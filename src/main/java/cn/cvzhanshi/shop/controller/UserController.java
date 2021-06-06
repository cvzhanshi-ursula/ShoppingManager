package cn.cvzhanshi.shop.controller;

import cn.cvzhanshi.shop.entity.Msg;
import cn.cvzhanshi.shop.entity.User;
import cn.cvzhanshi.shop.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author cVzhanshi
 * @create 2021-05-16 10:47
 */
@RequestMapping("user")
@Controller
public class UserController {

    @Autowired
    UserService userService;


    /**
     * 获取用户信息，返回json数据 含分页
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/users",method = RequestMethod.GET)
    public Msg getUsersWithJson(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, @RequestParam(value = "pageSize", defaultValue = "7") Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<User> users = userService.getAll();
        // 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
        // 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
        PageInfo pageInfo = new PageInfo(users, 5);
        return Msg.success().add("pageInfo",pageInfo);
    }


    /**
     * 更新保存用户
     * @param user
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/user/{id}",method = RequestMethod.PUT)
    public Msg updateUser(User user) {
        System.out.println(user);
        userService.updateUser(user);
        return Msg.success();
    }


    /**
     *
     */


    /**
     * 搜索框
     * @param searchName
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/search",method = RequestMethod.POST)
    public Msg searchUsers(@RequestParam(value = "searchName")String searchName,@RequestParam(value = "pageNum",defaultValue = "1")Integer pageNum) {
        System.out.println(searchName);
        PageHelper.startPage(pageNum, 2);
        List<User> users = userService.selectForSearch(searchName);

        if (users.size() == 0) {
            return Msg.fail().add("msg", "查询失败，无用户与之对应");
        }
        PageInfo pageInfo = new PageInfo(users, 3);
        return Msg.success().add("pageInfo",pageInfo);
    }


}
