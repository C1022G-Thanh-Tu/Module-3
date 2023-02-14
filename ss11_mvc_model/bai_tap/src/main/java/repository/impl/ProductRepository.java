package repository.impl;

import model.Product;
import repository.IProductRepository;

import java.util.ArrayList;
import java.util.List;

public class ProductRepository implements IProductRepository {
    static List<Product> productList = new ArrayList<>();
    static {
        productList.add(new Product(1, "https://www.google.com/imgres?imgurl=https%3A%2F%2Ftranscode-v2.app.engoo.com%2Fimage%2Ffetch%2Ff_auto%2Cc_lfill%2Cw_300%2Cdpr_3%2Fhttps%3A%2F%2Fassets.app.engoo.com%2Fimages%2F3Ml11xtB0hXWJQyr6Wpm08.jpeg&imgrefurl=https%3A%2F%2Fengoo.com.vn%2Fapp%2Flessons%2Ftelevision%2FASh-HEB8EeekKt-vm_U9NQ&tbnid=98r4lyeFuI2RVM&vet=12ahUKEwiYjfaBipT9AhU6BLcAHXg_AlEQMygCegUIARDMAQ..i&docid=wehrdTJIhD8d6M&w=900&h=600&q=television&ved=2ahUKEwiYjfaBipT9AhU6BLcAHXg_AlEQMygCegUIARDMAQ",
                "television", "09045809", "vip"));
        productList.add(new Product(2, "https://www.google.com/imgres?imgurl=https%3A%2F%2Fcdn2.cellphones.com.vn%2F358x358%2Cwebp%2Cq100%2Fmedia%2Fcatalog%2Fproduct%2Ft%2F_%2Ft_m_18.png&imgrefurl=https%3A%2F%2Fcellphones.com.vn%2Fiphone-14-pro-max.html&tbnid=ziTVMfMiGsPz9M&vet=12ahUKEwix-buaipT9AhV7PbcAHeEFBrMQMygAegUIARC_AQ..i&docid=l6CB1jvnTitiuM&w=358&h=358&q=iphone&ved=2ahUKEwix-buaipT9AhV7PbcAHeEFBrMQMygAegUIARC_AQ",
                "cell phone", "09045809", "vip"));
        productList.add(new Product(3, "https://www.google.com/imgres?imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2F0%2F05%2FDialog_gr_1972.jpg%2F1200px-Dialog_gr_1972.jpg&imgrefurl=https%3A%2F%2Fen.wiktionary.org%2Fwiki%2Ftelephone&tbnid=j1y9EfkCxtoMlM&vet=12ahUKEwjHruStipT9AhXVieYKHZoJDS8QMygCegUIARDHAQ..i&docid=JQs1xaZlh-cwTM&w=1200&h=881&q=telephone&ved=2ahUKEwjHruStipT9AhXVieYKHZoJDS8QMygCegUIARDHAQ",
                "telephone", "09045809", "vip"));
        productList.add(new Product(4, "https://www.google.com/imgres?imgurl=https%3A%2F%2Fwww.lg.com%2Fin%2Fimages%2Fwashing-machines%2Fmd07518535%2Fgallery%2FFHV1408ZWB-Washing-Machines-Left-View-Open-D-07.jpg&imgrefurl=https%3A%2F%2Fwww.lg.com%2Fin%2Fwashing-machines%2Flg-fhv1408zwb&tbnid=Y22dIGyPWXXKtM&vet=12ahUKEwi78MG-ipT9AhXIKbcAHd3rAg4QMygBegUIARDCAQ..i&docid=M07q3OxXndepEM&w=1100&h=730&q=washing%20ma&ved=2ahUKEwi78MG-ipT9AhXIKbcAHd3rAg4QMygBegUIARDCAQ",
                "washing machine", "09045809", "vip"));
        productList.add(new Product(5, "https://www.google.com/aclk?sa=l&ai=DChcSEwiUpq7LiZT9AhVKVGAKHfOjDkwYABAHGgJ0bQ&sig=AOD64_2jIWWcYFWDHGzn7NEGS-CZ12zwpg&adurl&ctype=5&ved=2ahUKEwjT76HLiZT9AhUXjNgFHRvwAp0Qvhd6BAgBEFI",
                "laptop", "09045809", "vip"));
        productList.add(new Product(6, "https://www.google.com/imgres?imgurl=https%3A%2F%2Fm.media-amazon.com%2Fimages%2FI%2F61pgJRCTx1S._SL1000_.jpg&imgrefurl=https%3A%2F%2Fwww.amazon.in%2FMLD-Reversible-220V-50Hz-Color-Multi-Material%2Fdp%2FB092R9FQW3&tbnid=M_y7PJvzzhXcJM&vet=12ahUKEwiHo5rPipT9AhVTEbcAHemTBVsQMygBegUIARCKAg..i&docid=0bxxLQz6dgDbaM&w=1000&h=1000&q=drill%20machine&ved=2ahUKEwiHo5rPipT9AhVTEbcAHemTBVsQMygBegUIARCKAg",
                "drill machine", "09045809", "vip"));
    }

    @Override
    public List<Product> findALL() {
//        System.out.println(productList.get(0).get);
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
