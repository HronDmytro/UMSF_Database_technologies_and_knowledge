const express = require('express');
const sqlite3 = require('sqlite3').verbose();
const path = require('path');
const app = express();

app.use(express.json());
app.use(express.static("public"));

const db = new sqlite3.Database('database.sqlite');

// отримання 
app.get('/api/customers', (req, res) => {
    db.all("SELECT * FROM customers", [], (err, rows) => {
        if (err) return res.status(500).json({ error: err });
        res.json(rows);
    });
});
// додавання нового клієнта в таблицю
app.post('/api/customers', (req, res) => {
    const { name, email } = req.body;
    db.run("INSERT INTO customers (name, email) VALUES (?, ?)", [name, email],
        function(err) {
            if (err) return res.status(500).json({ error: err });
            res.json({ id: this.lastID });
        }
    );
});
// редагування обраного запису
app.put('/api/customers/:id', (req, res) => {
    const { name, email } = req.body;
    db.run(
        "UPDATE customers SET name=?, email=? WHERE id=?",
        [name, email, req.params.id],
        function(err) {
            if (err) return res.status(500).json({ error: err });
            res.json({ changed: this.changes });
        }
    );
});
// видалення обраного запису
app.delete('/api/customers/:id', (req, res) => {
    db.run("DELETE FROM customers WHERE id=?", req.params.id, function(err) {
        if (err) return res.status(500).json({ error: err });
        res.json({ deleted: this.changes });
    });
});


app.listen(3000, () => console.log("Server running on http://localhost:3000"));