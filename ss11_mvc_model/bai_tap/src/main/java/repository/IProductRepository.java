package repository;

import model.Product;

import java.util.List;

public interface IProductRepository {
    List<Product> findALL();
    Product findById (int id);
    void create (Product product);
    void update (Product product);
    void delete (int id);
    List<Product> search (String name);
}