package com.xch.controller;

import com.xch.service.impl.AdminServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminServiceImpl adminService;
    //登录
    @RequestMapping("/adminLogin")
    public String adminLogin(HttpSession session,String username,String password,String loginCode )throws Exception{
        try {
            String loginJudge = adminService.queryByUsername(session, username, password,loginCode);
            return "redirect:/main/main.jsp";
        } catch (Exception e) {
            return "redirect:/login/login.jsp";
        }
    }

}
