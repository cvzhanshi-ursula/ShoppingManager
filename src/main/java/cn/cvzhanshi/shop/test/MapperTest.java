package cn.cvzhanshi.shop.test;

import cn.cvzhanshi.shop.dao.ClazzMapper;
import cn.cvzhanshi.shop.dao.ShopMapper;
import cn.cvzhanshi.shop.dao.UserMapper;
import cn.cvzhanshi.shop.entity.Clazz;
import cn.cvzhanshi.shop.entity.Shop;
import cn.cvzhanshi.shop.entity.User;
import cn.cvzhanshi.shop.entity.UserExample;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

import java.util.List;
import java.util.UUID;

/**
 * @author cVzhanshi
 * @create 2021-05-15 20:00
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private ClazzMapper clazzMapper;

    @Autowired
    private ShopMapper shopMapper;

    @Autowired
    SqlSession sqlSession;


    @Test
    public void test(){
//        UserExample userExample = new UserExample();
//        UserExample.Criteria criteria = userExample.createCriteria();
//        criteria.andLoginnameEqualTo("admin");
//        criteria.andPasswordEqualTo("123456");
//        List<User> users = userMapper.selectByExample(userExample);
//        System.out.println(users.size());

//        UserMapper mapper = sqlSession.getMapper(UserMapper.class);
//        for(int i = 0;i<1000;i++){
//            String uid = UUID.randomUUID().toString().substring(0,6)+i;
//            if(i%2 == 0){
//                mapper.insertSelective(new User(uid, uid,uid,"男"));
//            }else{
//                mapper.insertSelective(new User(uid, uid,uid,"女"));
//            }
//        }
//        System.out.println("批量完成");

//        ShopMapper mapper = sqlSession.getMapper(ShopMapper.class);
//        for(int i = 0;i<1000;i++){
//            String uid = UUID.randomUUID().toString().substring(0,6)+i;
//
//            Integer a = i%7;
//            mapper.insertSelective(new Shop(uid,i+500,a.toString()));
//        }
//        System.out.println("批量完成");


        ClazzMapper mapper = sqlSession.getMapper(ClazzMapper.class);
        for(int i = 0;i<1000;i++){
            String uname = UUID.randomUUID().toString().substring(0,5)+i;

            Integer a = i%7;
            mapper.insertSelective(new Clazz(uname));
        }
        System.out.println("批量完成");


    }
}
