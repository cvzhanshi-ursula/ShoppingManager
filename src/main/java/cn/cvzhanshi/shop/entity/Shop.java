package cn.cvzhanshi.shop.entity;

import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.Pattern;

public class Shop {
    private Integer id;


    @Pattern(regexp="(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})"
            ,message="商品名可以是2-5位中文或者6-16位英文和数字的组合")
    private String shopname;

    @DecimalMax("99999")
    private Integer price;

    private String cId;

    private Clazz clazz;

    public Shop(String shopname, Integer price, String cId) {
        this.shopname = shopname;
        this.price = price;
        this.cId = cId;
    }



    public Clazz getClazz() {
        return clazz;
    }

    public void setClazz(Clazz clazz) {
        this.clazz = clazz;
    }

    public Shop() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getShopname() {
        return shopname;
    }

    public void setShopname(String shopname) {
        this.shopname = shopname == null ? null : shopname.trim();
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public String getcId() {
        return cId;
    }

    public void setcId(String cId) {
        this.cId = cId == null ? null : cId.trim();
    }

    @Override
    public String toString() {
        return "Shop{" +
                "id=" + id +
                ", shopname='" + shopname + '\'' +
                ", price=" + price +
                ", cId='" + cId + '\'' +
                '}';
    }
}