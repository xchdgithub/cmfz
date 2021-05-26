package com.xch.dao;

import com.xch.entity.CityStatistics;
import com.xch.entity.Statistics;
import com.xch.entity.User;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface UserMapper extends Mapper<User> {

    void updateOneUser(User user);

    //List<User> selectAllUser();
    List<Statistics> selectStatisticsMonth();

    List<CityStatistics> selectStatisticsCity(String sex);
}