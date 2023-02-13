package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    static List<Product> productList = new ArrayList<>();
    static {
        productList.add(new Product(1, "television", "09045809", "vip"));
        productList.add(new Product(2, "cell phone", "09045809", "vip"));
        productList.add(new Product(3, "telephone", "09045809", "vip"));
        productList.add(new Product(4, "washing machine", "09045809", "vip"));
        productList.add(new Product(5, "laptop", "09045809", "vip"));
        productList.add(new Product(6, "drill machine", "09045809", "vip"));
    }

    @Override
    public List<Product> findALL() {
        return productList;
    }

    @Override
    public Product findById(int id) {
        for (Product product:productList) {
            if (id == product.getId()) {
                return product;
            }
        }
        return null;
    }

    @Override
    public void create(Product product) {
        product.setId(productList.size() + 1);
        productList.add(product);
    }

    @Override
    public void update(Product product) {
        for (int i = 0; i < productList.size(); i++) {
            if (productList.get(i).getId() == product.getId()) {
                productList.set(i, productList.get(i));
            }
        }
    }

    @Override
    public void delete(Product product) {
        for (int i = 0; i < productList.size(); i++) {
            if (product.getId() == productList.get(i).getId()) {
                productList.remove(i);
            }
        }
    }

    @Override
    public List<Product> search(String name) {
        List<Product> products = new ArrayList<>();
        for (Product product: productList) {
            if (product.getName().contains(name)) {
                products.add(product);
            }
        }
        return products;
    }
}
