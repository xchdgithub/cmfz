package com.xch.service;


import javax.servlet.http.HttpSession;

public interface AdminService {

    public String queryByUsername(HttpSession session, String username, String password, String loginCode);
}
