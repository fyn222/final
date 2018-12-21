package com.baizhi.controller;

import com.baizhi.conf.CreateValidateCode;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@Controller
@RequestMapping("/code")
public class CodeController {
    @RequestMapping("/getCode")
    public void code(HttpServletResponse response,HttpServletRequest request){
        CreateValidateCode vCode = new CreateValidateCode();
        HttpSession session = request.getSession();
        session.setAttribute("code", vCode.getCode()); //保存在Session作用域
        try {
            vCode.write(response.getOutputStream());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
