package cn.cvzhanshi.shop.controller;

import cn.cvzhanshi.shop.dao.ClazzMapper;
import cn.cvzhanshi.shop.entity.Clazz;
import cn.cvzhanshi.shop.entity.Msg;
import cn.cvzhanshi.shop.entity.Shop;
import cn.cvzhanshi.shop.service.ClazzService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sun.tracing.dtrace.ArgsAttributes;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author cVzhanshi
 * @create 2021-05-16 10:47
 */
@RequestMapping("clazz")
@Controller
public class ClazzController {

    @Autowired
    private ClazzService clazzService;

    /**
     * 获取所有类型，不分页
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/clazzs",method = RequestMethod.GET)
    public Msg getClazzs(){
        List<Clazz> clazzList = clazzService.getClazzs();
        return Msg.success().add("clazzs",clazzList);
    }


    /**
     * 获取类型信息，返回json数据 含分页
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/clazzspage",method = RequestMethod.GET)
    public Msg getShopsWithJson(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, @RequestParam(value = "pageSize", defaultValue = "7") Integer pageSize) {
        PageHelper.startPage(pageNum, pageSize);
        List<Clazz> clazzs = clazzService.getClazzs();
        // 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
        // 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
        PageInfo pageInfo = new PageInfo(clazzs, 5);
        return Msg.success().add("pageInfo",pageInfo);
    }



    /**
     * 搜索框
     * @param searchName
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/search",method = RequestMethod.POST)
    public Msg searchShop(@RequestParam(value = "searchName")String searchName,@RequestParam(value = "pageNum",defaultValue = "1")Integer pageNum) {
        System.out.println(searchName);
        PageHelper.startPage(pageNum, 2);
        List<Clazz> clazzs = clazzService.selectForSearch(searchName);

        if (clazzs.size() == 0) {
            return Msg.fail().add("msg", "查询失败，无类型与之对应");
        }
        PageInfo pageInfo = new PageInfo(clazzs, 3);
        return Msg.success().add("pageInfo",pageInfo);
    }



    /**
     * 校验类型名是否存在
     * @param clazzname
     * @return
     */
    @ResponseBody
    @RequestMapping("/checkclazz")
    public Msg checkshop(@RequestParam("clazzname")String clazzname){
        //先判断用户名是否是合法的表达式;
        String regx = "(^[a-zA-Z0-9_-]{3,8}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        if(!clazzname.matches(regx)){
            return Msg.fail().add("va_msg", "类型名可以是2-5位中文或者3-8位英文和数字的组合");
        }
        boolean b = clazzService.checkShop(clazzname);
        //数据库用户名重复校验
        if(b){
            return Msg.success();
        }else{
            return Msg.fail().add("va_msg", "类型名已存在，可以去编辑");
        }
    }



    @ResponseBody
    @RequestMapping(value = "/clazz",method = RequestMethod.POST)
    public Msg saveShop(@Valid Clazz clazz, BindingResult result){
        if(result.hasErrors()){
            //校验失败，应该返回失败，在模态框中显示校验失败的错误信息
            Map<String, Object> map = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError fieldError : errors) {
                System.out.println("错误的字段名："+fieldError.getField());
                System.out.println("错误信息："+fieldError.getDefaultMessage());
                map.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.fail().add("errorFields", map);
        }else{
            clazzService.saveClazz(clazz);
            return Msg.success();
        }
    }

    /**
     * 根据id查类型
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/clazz/{id}",method = RequestMethod.GET)
    public Msg getClazz(@PathVariable("id")Integer id){
        Clazz clazz = clazzService.getClazz(id);
        return Msg.success().add("clazz",clazz);
    }


    /**
     * 修改类型
     * @param clazz
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/clazz/{cid}",method = RequestMethod.PUT)
    public Msg updateClazz(Clazz clazz){
        clazzService.update(clazz);
        return Msg.success();
    }


    /**
     * 删除类型
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/clazz/{ids}",method = RequestMethod.DELETE)
    public Msg deleteShop(@PathVariable("ids")String ids){
        if(ids.contains("-")){

            List<Integer> del_ids = new ArrayList<>();
            String[] str_ids = ids.split("-");
            //组装id的集合
            for (String string : str_ids) {
                del_ids.add(Integer.parseInt(string));
            }
            clazzService.deleteBatch(del_ids);
        }else{
            Integer id = Integer.parseInt(ids);
            clazzService.deleteShop(id);
        }
        return Msg.success();
    }

}
