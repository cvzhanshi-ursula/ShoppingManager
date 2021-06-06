package cn.cvzhanshi.shop.controller;

import cn.cvzhanshi.shop.entity.Msg;
import cn.cvzhanshi.shop.entity.Shop;

import cn.cvzhanshi.shop.service.ShopService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
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
    @RequestMapping("shop")
    @Controller
    public class ShopController {

        @Autowired
        private ShopService shopService;


        /**
         * 获取用户信息，返回json数据 含分页
         *
         * @return
         */
        @ResponseBody
        @RequestMapping(value = "/shops",method = RequestMethod.GET)
        public Msg getShopsWithJson(@RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum, @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize) {
            PageHelper.startPage(pageNum, pageSize);
            List<Shop> shops = shopService.getAll();
            // 使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
            // 封装了详细的分页信息,包括有我们查询出来的数据，传入连续显示的页数
            PageInfo pageInfo = new PageInfo(shops, 5);
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
            List<Shop> shops = shopService.selectForSearch(searchName);

            if (shops.size() == 0) {
                return Msg.fail().add("msg", "查询失败，无商品与之对应");
            }
            PageInfo pageInfo = new PageInfo(shops, 3);
            return Msg.success().add("pageInfo",pageInfo);
        }


        /**
         * 校验商品名是否存在
         * @param shopname
         * @return
         */
        @ResponseBody
        @RequestMapping("/checkshop")
        public Msg checkshop(@RequestParam("shopname")String shopname){
            //先判断用户名是否是合法的表达式;
            String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
            if(!shopname.matches(regx)){
                return Msg.fail().add("va_msg", "商品名可以是2-5位中文或者6-16位英文和数字的组合");
            }
            boolean b = shopService.checkShop(shopname);
            //数据库用户名重复校验
            if(b){
                return Msg.success();
            }else{
                return Msg.fail().add("va_msg", "商品已存在，可以去编辑");
            }
        }


        @ResponseBody
        @RequestMapping(value = "/shop",method = RequestMethod.POST)
        public Msg saveShop(@Valid Shop shop, BindingResult result){
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
                shopService.saveEmp(shop);
                return Msg.success();
            }
        }

        /**
         * 根据id查商品
         * @param id
         * @return
         */
        @ResponseBody
        @RequestMapping(value = "/shop/{id}",method = RequestMethod.GET)
        public Msg getShop(@PathVariable("id")Integer id){
            Shop shop = shopService.getShop(id);

            return Msg.success().add("shop",shop);
        }


        /**
         * 修改员工
         * @param shop
         * @return
         */
        @ResponseBody
        @RequestMapping(value = "/shop/{id}",method = RequestMethod.PUT)
        public Msg updateShop(Shop shop){
            shopService.update(shop);
            return Msg.success();
        }

        /**
         * 删除员工
         * @param ids
         * @return
         */
        @ResponseBody
        @RequestMapping(value = "/shop/{ids}",method = RequestMethod.DELETE)
        public Msg deleteShop(@PathVariable("ids")String ids){
            if(ids.contains("-")){

                List<Integer> del_ids = new ArrayList<>();
                String[] str_ids = ids.split("-");
                //组装id的集合
                for (String string : str_ids) {
                    del_ids.add(Integer.parseInt(string));
                }
                shopService.deleteBatch(del_ids);
            }else{
                Integer id = Integer.parseInt(ids);
                shopService.deleteShop(id);
            }
            return Msg.success();
        }

    }
