package cn.cvzhanshi.shop.entity;

import javax.validation.constraints.Pattern;

public class Clazz {
    private Integer cId;

    @Pattern(regexp="(^[a-zA-Z0-9_-]{3,8}$)|(^[\\u2E80-\\u9FFF]{2,5})"
            ,message="类型名可以是2-5位中文或者3-8位英文和数字的组合")
    private String cName;

    public Clazz(String cName) {
        this.cName = cName;
    }

    public Clazz() {
    }

    public Integer getcId() {
        return cId;
    }

    public void setcId(Integer cId) {
        this.cId = cId;
    }

    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName == null ? null : cName.trim();
    }

    @Override
    public String toString() {
        return "Clazz{" +
                "cId=" + cId +
                ", cName='" + cName + '\'' +
                '}';
    }
}