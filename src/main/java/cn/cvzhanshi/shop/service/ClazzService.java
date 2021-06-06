package cn.cvzhanshi.shop.service;

import cn.cvzhanshi.shop.dao.ClazzMapper;
import cn.cvzhanshi.shop.entity.Clazz;
import cn.cvzhanshi.shop.entity.ClazzExample;
import cn.cvzhanshi.shop.entity.ShopExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author cVzhanshi
 * @create 2021-05-16 14:41
 */
@Service
public class ClazzService {
    @Autowired
    private ClazzMapper clazzMapper;

    /**
     * 获取所有类型
     * @return
     */
    public List<Clazz> getClazzs() {
        return clazzMapper.selectByExample(null);
    }

    /**
     * 搜索框
     * @param searchName
     * @return
     */
    public List<Clazz> selectForSearch(String searchName) {
        String sh = "%" + searchName + "%";
        ClazzExample clazzExample = new ClazzExample();
        ClazzExample.Criteria criteria = clazzExample.createCriteria();
        criteria.andCNameLike(sh);
        List<Clazz> clazzList = clazzMapper.selectByExample(clazzExample);
        return  clazzList;

    }

    public boolean checkShop(String clazzname) {
        ClazzExample clazzExample = new ClazzExample();
        ClazzExample.Criteria criteria = clazzExample.createCriteria();
        criteria.andCNameEqualTo(clazzname);
        List<Clazz> clazzList = clazzMapper.selectByExample(clazzExample);
        return clazzList.size() == 0 ? true:false;

    }

    /**
     * 保存新加的
     * @param clazz
     */
    public void saveClazz(Clazz clazz) {
        clazzMapper.insertSelective(clazz);
    }

    /**
     * 根据id查询
     * @param id
     * @return
     */
    public Clazz getClazz(Integer id) {
        return clazzMapper.selectByPrimaryKey(id);
    }

    /**
     * 更新
     * @param clazz
     */
    public void update(Clazz clazz) {
        clazzMapper.updateByPrimaryKeySelective(clazz);
    }


    /**
     * 删除单个员工
     * @param ids
     */
    public void deleteShop(Integer ids) {
        clazzMapper.deleteByPrimaryKey(ids);
    }

    /**
     * 批量删除
     * @param del_ids
     */
    public void deleteBatch(List<Integer> del_ids) {
        ClazzExample clazzExample = new ClazzExample();
        ClazzExample.Criteria criteria = clazzExample.createCriteria();
        //delete from xxx where emp_id in(1,2,3)
        criteria.andCIdIn(del_ids);
        clazzMapper.deleteByExample(clazzExample);
    }
}
