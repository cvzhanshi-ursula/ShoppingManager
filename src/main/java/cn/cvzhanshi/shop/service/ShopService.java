package cn.cvzhanshi.shop.service;

import cn.cvzhanshi.shop.dao.ShopMapper;
import cn.cvzhanshi.shop.entity.Shop;
import cn.cvzhanshi.shop.entity.ShopExample;
import cn.cvzhanshi.shop.entity.User;
import cn.cvzhanshi.shop.entity.UserExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @author cVzhanshi
 * @create 2021-05-16 14:41
 */
@Service
public class ShopService {

    @Autowired
    private ShopMapper shopMapper;


    /**
     * 获取全部数据 含分页
     * @return
     */
    public List<Shop> getAll() {

        List<Shop> shops = shopMapper.selectAllWithClazz();
        return shops;
    }

    /**
     * 模糊查询 搜索框功能
     * @param searchName
     * @return
     */
    public List<Shop> selectForSearch(String searchName) {
        String sh = "%" + searchName + "%";
        List<Shop> shops = shopMapper.selectAllWithClazzForSearch(sh);
        return shops;
    }


    /**
     * 校验商品是否已经存在
     * @param shopname
     * @return
     */
    public boolean checkShop(String shopname) {
        ShopExample shopExample = new ShopExample();
        ShopExample.Criteria criteria = shopExample.createCriteria();
        ShopExample.Criteria criteria1 = criteria.andShopnameEqualTo(shopname);
        List<Shop> shops = shopMapper.selectByExample(shopExample);
        return shops.size() == 0?true:false;
    }

    /**
     * 保存商品信息
     * @param shop
     */
    public void saveEmp(Shop shop) {
        shopMapper.insertSelective(shop);
    }

    /**
     * 按照id查商品
     * @param id
     * @return
     */
    public Shop getShop(Integer id) {
        return shopMapper.selectByPrimaryKey(id);
    }

    /**
     * 更新
     * @param shop
     */
    public void update(Shop shop) {
        shopMapper.updateByPrimaryKeySelective(shop);
    }

    /**
     * 删除单个员工
     * @param ids
     */
    public void deleteShop(Integer ids) {
        shopMapper.deleteByPrimaryKey(ids);
    }

    /**
     * 批量删除
     * @param del_ids
     */
    public void deleteBatch(List<Integer> del_ids) {
        ShopExample example = new ShopExample();
        ShopExample.Criteria criteria = example.createCriteria();
        //delete from xxx where emp_id in(1,2,3)
        criteria.andIdIn(del_ids);
        shopMapper.deleteByExample(example);
    }
}
