package com.baizhi.service;

import com.baizhi.enitty.User;

import java.util.List;

public interface UserService {
    public List<User> queryAll();
    public User queryOne(String phone,String password);

}
