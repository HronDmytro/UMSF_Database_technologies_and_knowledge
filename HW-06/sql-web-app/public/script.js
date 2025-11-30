let selectedId = null;

async function load() {
    const res = await fetch('/api/customers');
    const data = await res.json();

    let html = `
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Actions</th>
        </tr>
    `;
    data.forEach(row => {
        html += `
        <tr>
            <td>${row.id}</td>
            <td>${row.name}</td>
            <td>${row.email}</td>
            <td>
                <button class="btn btn-sm btn-warning me-2" onclick="edit(${row.id}, '${row.name}', '${row.email}')">Edit</button>
                <button class="btn btn-sm btn-danger" onclick="del(${row.id})">Delete</button>
            </td>
        </tr>
        `;
    });

    document.getElementById("table").innerHTML = html;
}

async function addCustomer() {
    const name = document.getElementById("addName").value;
    const email = document.getElementById("addEmail").value;

    if (!name || !email) return alert("Please fill all fields");

    await fetch("/api/customers", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ name, email })
    });

    document.getElementById("addName").value = "";
    document.getElementById("addEmail").value = "";
    const addModal = bootstrap.Modal.getInstance(document.getElementById('addModal'));
    addModal.hide();

    load();
}

function edit(id, name, email) {
    selectedId = id;
    document.getElementById("editName").value = name;
    document.getElementById("editEmail").value = email;

    const editModal = new bootstrap.Modal(document.getElementById('editModal'));
    editModal.show();
}

async function updateCustomer() {
    const name = document.getElementById("editName").value;
    const email = document.getElementById("editEmail").value;

    if (!name || !email) return alert("Please fill all fields");

    await fetch(`/api/customers/${selectedId}`, {
        method: "PUT",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ name, email })
    });

    selectedId = null;
    const editModal = bootstrap.Modal.getInstance(document.getElementById('editModal'));
    editModal.hide();

    load();
}

async function del(id) {
    if (!confirm("Are you sure?")) return;

    await fetch(`/api/customers/${id}`, { method: "DELETE" });
    load();
}

load();
