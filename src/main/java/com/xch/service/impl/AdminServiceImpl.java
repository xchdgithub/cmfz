package com.xch.service.impl;

import com.xch.dao.AdminMapper;
import com.xch.entity.Admin;
import com.xch.service.AdminService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {

    @Resource
    private AdminMapper adminMapper;

    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public String queryByUsername(HttpSession session, String username, String password,String loginCode){
        String code = (String)session.getAttribute("loginCode");
        if (!loginCode.equals(code)){
            session.setAttribute("LoginMessage","验证码错误！");
            throw new RuntimeException();
        }
        Admin admin = adminMapper.selectByUsername(username);
        if(admin==null){
            session.setAttribute("LoginMessage","账号不存在！");
            throw new RuntimeException();
        }
        if(!password.equals(admin.getPassword())){
            session.setAttribute("LoginMessage","密码错误！");
            throw new RuntimeException();
        }
        session.setAttribute("admin",admin);
        return "correct";
    }
}
