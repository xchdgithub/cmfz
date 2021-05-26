package com.xch.controller;

import com.xch.util.ImageCodeUtil;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

@Controller
@RequestMapping("/code")
public class VerificationCode {

    @RequestMapping("/loginCode")
    public void loginCode(HttpSession session, HttpServletResponse response){
        try {
            //获取随机数
            String securityCode = ImageCodeUtil.getSecurityCode();
            //生成验证码图片
            BufferedImage image = ImageCodeUtil.createImage(securityCode);

            session.setAttribute("loginCode",securityCode);
            ServletOutputStream out = response.getOutputStream();
            ImageIO.write(image, "png", out);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
