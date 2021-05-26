package com.xch.dao;

import com.xch.entity.Admin;
import tk.mybatis.mapper.common.Mapper;
//管理
public interface AdminMapper extends Mapper<Admin> {
    //按username查询
    Admin selectByUsername(String username);

}