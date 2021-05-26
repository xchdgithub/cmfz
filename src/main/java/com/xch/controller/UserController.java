package com.xch.controller;

import com.xch.entity.User;
import com.xch.service.impl.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
@RestController
public class UserController {

    @Autowired
    private UserServiceImpl userService;

    @RequestMapping("/queryUser")
    public Map<String,Object> queryUser(Integer page,Integer rows) throws Exception {
        System.out.println("---------lai la----------");
        Map<String, Object> map = new HashMap<>();
        List<User> list = userService.queryUser(page, rows);
        Integer totalCount = userService.queryUserTotalCount();
        //设置json串
        map.put("rows",list);
        map.put("page",page);
        map.put("records",totalCount);
        Integer total = totalCount%rows==0 ? totalCount/rows : totalCount/rows+1;
        map.put("total",total);

        return map;
    }

    @RequestMapping("/change")
    public String change(User user, String oper) throws Exception {
        String id = null;
        //添加
        if (oper.equals("add")){
        }
        //修改
        if (oper.equals("edit")){
            userService.alterOneUser(user);
        }
        //删除
        if (oper.equals("del")){
        }
        return id;
    }
    //打印所有
    @RequestMapping("/printAllUser")
    public void printAllUser() throws Exception {

        userService.printAllUser();

    }

    //统计月份
    @RequestMapping("/queryStatisticsMonth")
    public Map<String,Object> queryStatisticsMonth() throws Exception{

        Map<String, Object> map = userService.queryStatisticsMonth();
        return map;
    }

    //统计地区
    @RequestMapping("/queryStatisticsCity")
    public Map<String,Object> queryStatisticsCity() throws Exception{

        Map<String, Object> map = userService.queryStatisticsCity();
        return map;
    }
}
