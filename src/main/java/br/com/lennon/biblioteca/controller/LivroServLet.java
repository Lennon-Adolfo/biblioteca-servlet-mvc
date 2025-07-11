package br.com.lennon.biblioteca.controller;

import br.com.lennon.biblioteca.model.Livro;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.*;

@WebServlet("/livro")
public class LivroServLet extends HttpServlet {
    private static final List<Livro> livros = new ArrayList<>();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");

        String action = req.getParameter("action");

        if ("cadastrar".equals(action)) {
            String titulo = req.getParameter("titulo");
            String autor = req.getParameter("autor");
            String anoStr = req.getParameter("ano");
            String isbn = req.getParameter("isbn");

            if (titulo.isEmpty() || autor.isEmpty() || anoStr.isEmpty() || isbn.isEmpty()) {
                req.setAttribute("erro", "Todos os campos são obrigatórios!");
                req.getRequestDispatcher("view/cadastro.jsp").forward(req, resp);
                return;
            }

            int ano;
            try {
                ano = Integer.parseInt(anoStr);
            } catch (NumberFormatException e) {
                req.setAttribute("erro", "Ano inválido!");
                req.getRequestDispatcher("view/cadastro.jsp").forward(req, resp);
                return;
            }

            livros.add(new Livro(titulo, autor, ano, isbn));
            resp.sendRedirect("livro?action=listar");

        }

        if ("excluir".equals(action)) {
            String isbn = req.getParameter("isbn");
            livros.removeIf(l -> l.getIsbn().equals(isbn));
            resp.sendRedirect("livro?action=listar");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
        throws ServletException, IOException {
        String action = req.getParameter("action");
        if ("listar".equals(action)) {
            req.setAttribute("livros", livros);
            req.getRequestDispatcher("view/lista.jsp").forward(req, resp);
        } else {
            req.getRequestDispatcher("view/cadastro.jsp").forward(req, resp);
        }
    }
}
