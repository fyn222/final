package com.baizhi.service;

import com.baizhi.enitty.User;
import com.baizhi.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;
    @Override
    public List<User> queryAll() {
        List<User> users = userMapper.selectAll();
        return users;
    }
    public User queryOne(String phone,String password){
        return userMapper.queryOne(phone, password);
    }
}
