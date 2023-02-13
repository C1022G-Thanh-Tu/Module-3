package controller;

import model.Product;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet extends HttpServlet {
    IProductService productService = new ProductService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionUser = request.getParameter("actionUser");
        if (actionUser == null) {
            actionUser = "";
        }
        switch (actionUser) {
            case "create":
                showCreate (request, response);
                break;
            case "update":
                showUpdate (request, response);
                break;
            case "delete":
                showDelete (request, response);
                break;
            case "search":
                showSearch (request, response);
                break;
            default:
                break;
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String actionUser = request.getParameter("actionUser");
        if (actionUser == null) {
            actionUser = "";
        }
        switch (actionUser) {
            case "create":
                showCreateForm (request, response);
                break;
            case "update":
                showUpdateForm (request, response);
                break;
            case "delete":
                showDeleteForm (request, response);
                break;
            case "search":
                break;
            default:
                showListProduct (request, response);
                break;
        }
    }

    private void showSearch(HttpServletRequest request, HttpServletResponse response) {
        String productName = request.getParameter("search");
        List<Product> productList = productService.search(productName);

        if (productList == null) {
            try {
                request.getRequestDispatcher("/view/error404.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            try {
                request.setAttribute("productList", productList);
                request.getRequestDispatcher("/view/search.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);

        request.setAttribute("product", product);
        try {
            request.getRequestDispatcher("/view/delete.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showDelete(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);

        if (product == null) {
            try {
                request.getRequestDispatcher("/view/error404.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            productService.delete(product);
            try {
                response.sendRedirect("/product");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        Product product = productService.findById(id);

        request.setAttribute("product", product);
        try {
            request.getRequestDispatcher("/view/update.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showUpdate(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String status = request.getParameter("status");
        int id = Integer.parseInt(request.getParameter("id"));

        Product product = productService.findById(id);

        if (product == null) {
            try {
                request.getRequestDispatcher("/view/error404.jsp").forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        } else {
            product.setName(name);
            product.setPrice(price);
            product.setStatus(status);

            productService.update(product);
            try {
                response.sendRedirect("/product");
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getRequestDispatcher("/view/create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showCreate(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String price = request.getParameter("price");
        String status = request.getParameter("status");

        productService.create(new Product(name, price, status));

        try {
            response.sendRedirect("/product");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showListProduct(HttpServletRequest request, HttpServletResponse response) {
        List<Product> productList = productService.findALL();
        request.setAttribute("productList", productList);
        try {
            request.getRequestDispatcher("/view/list.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
