package cn.cvzhanshi.shop.dao;

import cn.cvzhanshi.shop.entity.Shop;
import cn.cvzhanshi.shop.entity.ShopExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ShopMapper {
    long countByExample(ShopExample example);

    int deleteByExample(ShopExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Shop record);

    int insertSelective(Shop record);

    List<Shop> selectByExample(ShopExample example);

    List<Shop> selectAllWithClazz();

    List<Shop> selectAllWithClazzForSearch(@Param("searchName") String searchName);

    Shop selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Shop record, @Param("example") ShopExample example);

    int updateByExample(@Param("record") Shop record, @Param("example") ShopExample example);

    int updateByPrimaryKeySelective(Shop record);

    int updateByPrimaryKey(Shop record);
}