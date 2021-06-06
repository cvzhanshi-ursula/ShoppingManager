package cn.cvzhanshi.shop.service;

import cn.cvzhanshi.shop.dao.UserMapper;
import cn.cvzhanshi.shop.entity.User;
import cn.cvzhanshi.shop.entity.UserExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author cVzhanshi
 * @create 2021-05-16 14:41
 */
@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    /**
     * 登录时判断账号密码
     * @param loginname
     * @param password
     * @return
     */
    public List<User> loginByLoginAndPass(String loginname,String password){
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andLoginnameEqualTo(loginname);
        criteria.andPasswordEqualTo(password);
        List<User> users = userMapper.selectByExample(userExample);
        return users;
    }


    /**
     * 检验用户名是否可用
     *
     * @param loginname
     * @return  true：代表当前姓名可用   fasle：不可用
     */
    public boolean checkUser(String loginname) {
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andLoginnameEqualTo(loginname);
        long count = userMapper.countByExample(userExample);
        return count == 0;
    }

    /**
     * 保存注册的账户
     * @param user
     */
    public User saveUser(User user) {
        userMapper.insertSelective(user);
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andLoginnameEqualTo(user.getLoginname());
        List<User> users = userMapper.selectByExample(userExample);
        return users.get(0);
    }

    /**
     * 获取全部用户信息进行分页
     * @return
     */
    public List<User> getAll() {
        List<User> users = userMapper.selectByExample(null);
        return users;
    }


    /**
     * 保存更新的用户
     * @param user
     */
    public void updateUser(User user) {
        userMapper.updateByPrimaryKeySelective(user);
    }


    /**
     * 搜索框功能
     * @param username
     * @return
     */
    public List<User> selectForSearch(String username){
        UserExample userExample = new UserExample();
        UserExample.Criteria criteria = userExample.createCriteria();
        criteria.andUsernameLike("%" + username + "%");

        List<User> users = userMapper.selectByExample(userExample);
        return users;
    }
}
