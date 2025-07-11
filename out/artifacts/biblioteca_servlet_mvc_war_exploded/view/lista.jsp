<%--
  Created by IntelliJ IDEA.
  User: Nós
  Date: 10/07/2025
  Time: 12:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="br.com.lennon.biblioteca.model.Livro" %>
<%@ page import="java.util.List" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Livros</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <h2 class="mb-4">📚 Livros Cadastrados</h2>

    <%
        List<Livro> livros = (List<Livro>) request.getAttribute("livros");
        if (livros == null || livros.isEmpty()) {
    %>
        <div class="alert alert-warning">Nenhum livro cadastrado.</div>
    <%
        } else {

    %>

    <div class="table-responsive">
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
            <tr>
                <th>Título</th>
                <th>Autor</th>
                <th>Ano</th>
                <th>ISBN</th>
                <th>Ações</th>
            </tr>
            </thead>
            <tbody>
            <%
                for (Livro livro : livros) {
            %>
                <tr>
                    <td><%= livro.getTitulo() %></td>
                    <td><%= livro.getAutor() %></td>
                    <td><%= livro.getAno() %></td>
                    <td><%= livro.getIsbn() %></td>
                    <td>
                        <form action="livro" method="Post" style="display:inline;">
                            <input type="hidden" name="action" value="excluir" />
                            <input type="hidden" name="isbn" value="<%= livro.getIsbn() %>" />
                            <button type="submit" class="btn btn-sm btn-danger">Excluir</button>
                        </form>
                    </td>
                </tr>
            <%
                }
            %>
            </tbody>
        </table>
    </div>
    <% } %>
    <a href="livro" class="btn btn-outline-primary mt-3">⬅️ Cadastrar novo livro</a>
</div>

</body>
</html>
