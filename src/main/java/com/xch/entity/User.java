package com.xch.entity;

import cn.afterturn.easypoi.excel.annotation.Excel;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class User {

    @Excel(name="ID")
    private String id;

    @Excel(name="手机")
    private String phone;

    @Excel(name="密码")
    private String password;

    @Excel(name="盐")
    private String salt;

    @Excel(name="状态")
    private String status;

    @Excel(name="头像",type=2,width = 30,height = 20)
    private String picImg;

    @Excel(name="名字")
    private String name;

    @Excel(name="昵称")
    private String legalName;

    @Excel(name="性别")
    private String sex;

    @Excel(name="地址")
    private String city;

    @Excel(name="签名")
    private String sign;

    @Excel(name="注册时间",format="yyyy年MM月dd日",width = 20,height = 10)
    @JsonFormat(pattern = "yyyy-MM-dd hh:mm:ss",timezone="GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd 24H:mm:ss")
    private Date regTime;

    @Excel(name="上师ID")
    private String guruId;

}