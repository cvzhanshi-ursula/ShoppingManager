package cn.cvzhanshi.shop.controller;

import cn.cvzhanshi.shop.entity.Msg;
import cn.cvzhanshi.shop.entity.User;
import cn.cvzhanshi.shop.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.google.code.kaptcha.Constants.KAPTCHA_SESSION_KEY;

/**
 * @author cVzhanshi
 * @create 2021-05-16 10:44
 */
@Controller
@RequestMapping("/system")
public class SystemController {

    @Autowired
    private UserService userService;


    /**
     * 登陆页面
     * @param model
     * @return
     */
    @RequestMapping(value = "/showAllUser",method= RequestMethod.GET)
    public ModelAndView showAll(ModelAndView model){
        model.setViewName("user/showAllUser");
        return model;
    }


    /**
     * 跳转类型列表
     * @param model
     * @return
     */
    @RequestMapping(value = "/showAllClazz",method = RequestMethod.GET)
    public ModelAndView showAllClazz(ModelAndView model){
        model.setViewName("clazz/showAllClazz");
        return model;
    }


    /**
     * 跳转商品列表
     * @param model
     * @return
     */
    @RequestMapping(value = "/showAllShop",method = RequestMethod.GET)
    public ModelAndView showAllUser(ModelAndView model){
        model.setViewName("shop/showAllShop");
        return model;
    }


    /**
     * 跳转登录页面
     * @param model
     * @return
     */
    @RequestMapping(value = "/login",method= RequestMethod.GET)
    public ModelAndView login(ModelAndView model){
        model.setViewName("system/login");
        return model;
    }


    /**
     * 欢迎页面
     * @param
     * @return
     */
    @RequestMapping(value = "/index",method= RequestMethod.GET)
    public ModelAndView index(ModelAndView model){
        //System.out.println("welcomeIndex");
        model.setViewName("system/welcomeIndex");
        return model;
    }


    /**
     * 登出
     * @param model
     * @param request
     * @return
     */
    @RequestMapping(value = "/login_out",method= RequestMethod.GET)
    public ModelAndView login_out(ModelAndView model,HttpServletRequest request){
        request.getSession().removeAttribute("user");
        //System.out.println("welcomeIndex");
        model.setViewName("system/login");
        return model;
    }

    @RequestMapping(value = "/register",method = RequestMethod.GET)
    public String register(){
        return "system/register";
    }

    /**
     * 登录时判断用户名 密码 验证码
     * @param loginname
     * @param password
     * @param code
     * @param request
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/login",method= RequestMethod.POST)
    public Msg login(@RequestParam(value = "loginname")String loginname,
                     @RequestParam(value = "password")String password,
                     @RequestParam(value = "code")String code,
                     HttpServletRequest request){
        // 获取 Session 中的验证码
        String token = (String) request.getSession().getAttribute(KAPTCHA_SESSION_KEY);
        // 删除 Session 中的验证码
        request.getSession().removeAttribute(KAPTCHA_SESSION_KEY);
        request.getSession().removeAttribute("user");

//        System.out.println("code = "+ code);
//        System.out.println("loginname = "+ loginname);
//        System.out.println("password = "+ password);
//        System.out.println("token = "+ token);


        List<User> users = userService.loginByLoginAndPass(loginname, password);
        if(users.size() == 0){
            //System.out.println("账密错误");
            return Msg.fail().add("msg","账号或密码错误").add("typess","1");
        }
        if(token!=null && token.equalsIgnoreCase(code.trim())){
            //System.out.println("成功======");
            request.getSession().setAttribute("user",users.get(0));
            return Msg.success();
        }else{
            //System.out.println("验证码错误======");
            return Msg.fail().add("msg","验证码错误").add("typess","2");
        }
    }


    /**
     * 校验登录账号是否可用
     * @param loginname
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkuser")
    public Msg checkuser(@RequestParam("loginname")String loginname){
        //先判断用户名是否是合法的表达式;
        String regx = "(^[a-zA-Z0-9_-]{6,16}$)";
        if(!loginname.matches(regx)){
            return Msg.fail().add("va_msg", "登录账号必须是6-16位数字和字母的组合");
        }
        //数据库用户名重复校验
        boolean b = userService.checkUser(loginname);
        if(b){
            return Msg.success();
        }else{
            return Msg.fail().add("va_msg", "登录账号已存在");
        }
    }


    /**
     * 注册成功，保存用户信息，带jsr303检验
     * @param user
     * @param result
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/save",method = RequestMethod.POST)
    public Msg save(@Valid User user, BindingResult result,HttpServletRequest request){
        System.out.println(user);
        if(result.hasErrors()){
            //校验失败，应该返回失败，在模态框中显示校验失败的错误信息
            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError fieldError : errors) {
               // System.out.println("错误的字段名："+fieldError.getField());
                //System.out.println("错误信息："+fieldError.getDefaultMessage());
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);
        }else{
            System.out.println(user);

            User user1 = userService.saveUser(user);
            request.getSession().setAttribute("user",user1);
            return Msg.success();
        }
    }
}
