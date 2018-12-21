package com.baizhi.controller;

import com.baizhi.enitty.Admin;
import com.baizhi.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@RestController
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    AdminService adminService;
    @RequestMapping("/login")
    public Admin login(Admin admin, String enCode, HttpServletRequest request){
        HttpSession session = request.getSession();
        Object code = (String)session.getAttribute("code");
        if(((String) code).equalsIgnoreCase(enCode)){
            return adminService.login(admin);
        }else{
            return null;
        }
    }
}
