package com.baizhi.controller;

import com.baizhi.enitty.User;
import com.baizhi.service.UserService;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;
    @RequestMapping("/queryAll")
    public List<User> queryAll(){
        return userService.queryAll();
    }
    @RequestMapping("/login")
    public User login(String phone,String password){
        return  userService.queryOne(phone, password);
    }
}
