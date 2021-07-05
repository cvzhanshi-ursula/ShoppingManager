package cn.cvzhanshi.shop.entity;

import javax.validation.constraints.Pattern;

public class User {
    private Integer id;

    @Pattern(regexp="(^[a-zA-Z0-9_-]{6,16}$)"
            ,message="登录账号必须是6-16位英文和数字的组合")
    private String loginname;

    @Pattern(regexp="(^[a-zA-Z0-9_-]{6,33}$)"
            ,message="密码必须是6-33位英文和数字的组合")
    private String password;

    @Pattern(regexp="(^[a-zA-Z0-9_-]{6,16}$)"
            ,message="用户名可以是6-16位英文和数字的组合")
    private String username;

    private String sex;

    public User(String loginname, String password, String username, String sex) {
        this.loginname = loginname;
        this.password = password;
        this.username = username;
        this.sex = sex;
    }

    public User() {
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", loginname='" + loginname + '\'' +
                ", password='" + password + '\'' +
                ", username='" + username + '\'' +
                ", sex='" + sex + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLoginname() {
        return loginname;
    }

    public void setLoginname(String loginname) {
        this.loginname = loginname == null ? null : loginname.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex == null ? null : sex.trim();
    }
}