package cn.cvzhanshi.shop.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author cVzhanshi
 * @create 2021-05-15 21:42
 */
@Controller
public class TestController {
    @RequestMapping("/abg")
    public String dsa(){
        return "login";
    }
}
