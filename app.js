const express  = require("express");
const path     = require("path");
const Database = require("better-sqlite3");

const app = express();
const db  = new Database(path.join(__dirname, "internship.db"));
db.pragma("foreign_keys = ON");

app.use(express.json());

app.get("/api/applications", (req, res) => {
  const rows = db.prepare(`
    SELECT a.app_id, a.submission_date, a.current_status, a.notes,
           s.name AS student_name, jp.title AS job_title, c.company_name
    FROM Application a
    JOIN Student    s  ON a.student_id  = s.student_id
    JOIN JobPosting jp ON a.job_id      = jp.job_id
    JOIN Company    c  ON jp.company_id = c.company_id
    ORDER BY a.submission_date DESC
  `).all();
  res.json(rows);
});

app.get("/api/applications/:id", (req, res) => {
  const row = db.prepare(`
    SELECT a.*, s.name AS student_name, jp.title AS job_title, c.company_name
    FROM Application a
    JOIN Student    s  ON a.student_id  = s.student_id
    JOIN JobPosting jp ON a.job_id      = jp.job_id
    JOIN Company    c  ON jp.company_id = c.company_id
    WHERE a.app_id = ?
  `).get(req.params.id);
  if (!row) return res.status(404).json({ error: "Application not found" });
  res.json(row);
});

app.post("/api/applications", (req, res) => {
  const { student_id, job_id, submission_date, current_status, notes } = req.body;
  if (!student_id || !job_id)
    return res.status(400).json({ error: "student_id and job_id are required" });
  const result = db.prepare(`
    INSERT INTO Application (student_id, job_id, submission_date, current_status, notes)
    VALUES (?, ?, ?, ?, ?)
  `).run(student_id, job_id, submission_date ?? null, current_status ?? null, notes ?? null);
  res.status(201).json({ app_id: result.lastInsertRowid });
});

app.put("/api/applications/:id", (req, res) => {
  const { student_id, job_id, submission_date, current_status, notes } = req.body;
  const result = db.prepare(`
    UPDATE Application
    SET student_id=?, job_id=?, submission_date=?, current_status=?, notes=?
    WHERE app_id=?
  `).run(student_id, job_id, submission_date ?? null, current_status ?? null, notes ?? null, req.params.id);
  if (result.changes === 0) return res.status(404).json({ error: "Application not found" });
  res.json({ updated: result.changes });
});

app.delete("/api/applications/:id", (req, res) => {
  const result = db.prepare("DELETE FROM Application WHERE app_id = ?").run(req.params.id);
  if (result.changes === 0) return res.status(404).json({ error: "Application not found" });
  res.json({ deleted: result.changes });
});

app.get("/api/interviews", (req, res) => {
  const rows = db.prepare(`
    SELECT ir.round_id, ir.app_id, ir.round_type, ir.scheduled_date,
           ir.outcome, ir.notes,
           s.name AS student_name, jp.title AS job_title, c.company_name
    FROM InterviewRound ir
    JOIN Application a  ON ir.app_id     = a.app_id
    JOIN Student     s  ON a.student_id  = s.student_id
    JOIN JobPosting  jp ON a.job_id      = jp.job_id
    JOIN Company     c  ON jp.company_id = c.company_id
    ORDER BY ir.scheduled_date DESC
  `).all();
  res.json(rows);
});

app.get("/api/interviews/:id", (req, res) => {
  const row = db.prepare(`
    SELECT ir.*, s.name AS student_name, jp.title AS job_title, c.company_name
    FROM InterviewRound ir
    JOIN Application a  ON ir.app_id     = a.app_id
    JOIN Student     s  ON a.student_id  = s.student_id
    JOIN JobPosting  jp ON a.job_id      = jp.job_id
    JOIN Company     c  ON jp.company_id = c.company_id
    WHERE ir.round_id = ?
  `).get(req.params.id);
  if (!row) return res.status(404).json({ error: "Interview round not found" });
  res.json(row);
});

app.post("/api/interviews", (req, res) => {
  const { app_id, round_type, scheduled_date, outcome, notes } = req.body;
  if (!app_id)
    return res.status(400).json({ error: "app_id is required" });
  const result = db.prepare(`
    INSERT INTO InterviewRound (app_id, round_type, scheduled_date, outcome, notes)
    VALUES (?, ?, ?, ?, ?)
  `).run(app_id, round_type ?? null, scheduled_date ?? null, outcome ?? "Pending", notes ?? null);
  res.status(201).json({ round_id: result.lastInsertRowid });
});

app.put("/api/interviews/:id", (req, res) => {
  const { app_id, round_type, scheduled_date, outcome, notes } = req.body;
  const result = db.prepare(`
    UPDATE InterviewRound
    SET app_id=?, round_type=?, scheduled_date=?, outcome=?, notes=?
    WHERE round_id=?
  `).run(app_id, round_type ?? null, scheduled_date ?? null, outcome ?? "Pending", notes ?? null, req.params.id);
  if (result.changes === 0) return res.status(404).json({ error: "Interview round not found" });
  res.json({ updated: result.changes });
});

app.delete("/api/interviews/:id", (req, res) => {
  const result = db.prepare("DELETE FROM InterviewRound WHERE round_id = ?").run(req.params.id);
  if (result.changes === 0) return res.status(404).json({ error: "Interview round not found" });
  res.json({ deleted: result.changes });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`API running on http://localhost:${PORT}`));
