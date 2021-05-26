package com.xch.service;

import com.xch.entity.Statistics;
import com.xch.entity.User;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public interface UserService {
    //分页查询用户
    public List<User> queryUser(Integer page, Integer rows);

    //获取用户总条数
    public Integer queryUserTotalCount();

    //修改用户信息
    public void alterOneUser(User user);

    //打印/查寻所有用户
    public void printAllUser();

    //统计月份
    public Map<String, Object> queryStatisticsMonth();

    //统计地区
    public Map<String, Object> queryStatisticsCity();
}
