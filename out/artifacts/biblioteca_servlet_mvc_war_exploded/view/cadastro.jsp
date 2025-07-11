<%--
  Created by IntelliJ IDEA.
  User: Nós
  Date: 10/07/2025
  Time: 11:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Livro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5" style="max-width: 700px;">
    <div class="card shadow-sm">
        <div class="card-body">
            <h2 class="card-title mb-4">📘 Cadastrar Livro</h2>

            <% if (request.getAttribute("erro") != null) { %>
            <div class="alert alert-danger">
                <%= request.getAttribute("erro") %>
            </div>
            <% } %>

            <form action="livro" method="post" class="row g-3">
                <input type="hidden" name="action" value="cadastrar" />

                <div class="col-md-12">
                    <label class="form-label">Título</label>
                    <input type="text" name="titulo" class="form-control" required />
                </div>

                <div class="col-md-12">
                    <label class="form-label">Autor</label>
                    <input type="text" name="autor" class="form-control" required />
                </div>

                <div class="col-md-4">
                    <label class="form-label">Ano</label>
                    <input type="number" name="ano" class="form-control" required />
                </div>

                <div class="col-md-8">
                    <label class="form-label">ISBN</label>
                    <input type="text" name="isbn" class="form-control" required />
                </div>

                <div class="col-12 d-flex justify-content-between mt-3">
                    <button type="submit" class="btn btn-success">Cadastrar</button>
                    <a href="livro?action=listar" class="btn btn-outline-secondary">📄 Ver Lista</a>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
