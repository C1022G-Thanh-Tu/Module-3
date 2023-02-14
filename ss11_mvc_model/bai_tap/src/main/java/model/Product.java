package model;

public class Product {
    private int id;
    private String imgURL;
    private String name;
    private String price;
    private String status;

    public Product() {
    }

    public Product(int id, String imgURL, String name, String price, String status) {
        this.id = id;
        this.imgURL = imgURL;
        this.name = name;
        this.price = price;
        this.status = status;
    }


    public Product(String name, String price, String status) {
        this.name = name;
        this.price = price;
        this.status = status;
    }

    public String getImgURL() {
        return imgURL;
    }

    public void setImgURL(String imgURL) {
        this.imgURL = imgURL;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
