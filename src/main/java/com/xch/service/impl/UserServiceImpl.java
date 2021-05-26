package com.xch.service.impl;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.ExportParams;
import com.xch.dao.UserMapper;
import com.xch.entity.CityStatistics;
import com.xch.entity.User;
import com.xch.entity.UserExample;
import com.xch.service.UserService;
import org.apache.commons.collections4.map.HashedMap;
import org.apache.ibatis.session.RowBounds;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;

@Transactional
@Service
public class UserServiceImpl implements UserService {

    @Resource
    private UserMapper userMapper;
    @Autowired
    private UserExample userExample;

    //分页查询用户
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public List<User> queryUser(Integer page , Integer rows){
        //分页查询： 参数：忽略几条,获取几条数据
        RowBounds rowBounds = new RowBounds((page-1)*rows,rows);

        List<User> list = userMapper.selectByExampleAndRowBounds(userExample, rowBounds);
        // List<Carousel> list = carouselMapper.selectCarousel(page, rows);
        return list;
    }

    //获取用户总条数
    @Transactional(propagation = Propagation.SUPPORTS,readOnly = true)
    public Integer queryUserTotalCount(){
        Integer totalCount = userMapper.selectCountByExample(userExample);
        return totalCount;
    }

    //修改用户信息
    public void alterOneUser(User user){
        userMapper.updateOneUser(user);
    }

    //打印/查寻所有用户
    public void printAllUser(){
        try {
            //所有的用户信息
            List<User> list = userMapper.selectAll();

            for (User user : list) {
                user.setPicImg("D:/SoftwareInstallationDirectory/IDEA/IDEAWorkSpace/HouQiXiangMu/cmfz_xch/src/main/webapp/upload/photo/"+user.getPicImg());
                System.out.println("--user--"+user);
            }

            //出配置的参数   参数:标题名,工作薄名字
            ExportParams exportParams = new ExportParams("用户信息表", "用户信息");

            //参数：导出的配置,导出数据对应的实体类,导出的数据
            Workbook workbook = ExcelExportUtil.exportExcel(exportParams, User.class, list);

            //导出
            workbook.write(new FileOutputStream(new File("E:/Java/170后期项目/day7 poi/EasyPOI文件/持明法洲库表.xls")));

            //释放资源
            workbook.close();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    //统计月份
    public Map<String, Object> queryStatisticsMonth(){
        Map<String, Object> map = new HashedMap<>();
        //List<Statistics> list = new ArrayList<>();
        //map.put("months", Arrays.asList("一月份","二月份","三月份","四月份","五月份","六月份"));
        //map.put("counts", Arrays.asList(5, 20, 36, 10, 10, 20));

        String[] months = {"一月份","二月份","三月份","四月份","五月份","六月份","七月份","八月份","九月份","十月份","十一月份","十二月份"};
        Integer[] count1 = {5, 20, 36, 50, 78, 89,33,68,27,23,98,34};
        Integer[] count2 = {90, 87, 73, 52, 32, 19,34,23,75,12,6,23};
        //userMapper.selectStatisticsMonth();

        map.put("months",months);
        map.put("boys",count1);
        map.put("girls",count2);

        return map;
    }

    //统计地区
    public Map<String, Object> queryStatisticsCity(){
        Map<String, Object> map = new HashedMap<>();

        List<CityStatistics> boysList = userMapper.selectStatisticsCity("男");
        List<CityStatistics> girlsList = userMapper.selectStatisticsCity("女");

        map.put("boys",boysList);
        map.put("girls",girlsList);

        return map;
    }
}















