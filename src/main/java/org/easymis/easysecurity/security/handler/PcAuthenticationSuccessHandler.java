package org.easymis.easysecurity.security.handler;

import java.io.IOException;
import java.io.Writer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.easymis.easysecurity.security.RestResult;
import org.easymis.easysecurity.security.userdetail.SecurityUserDetails;
import org.easymis.easysecurity.security.userdetail.UserVo;
import org.springframework.beans.BeanUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.alibaba.fastjson.JSON;


public class PcAuthenticationSuccessHandler implements AuthenticationSuccessHandler {
    @Override
    public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException, ServletException {
        httpServletResponse.setCharacterEncoding("UTF-8");
        httpServletResponse.setContentType("application/json;charset=utf-8");
        Writer writer = httpServletResponse.getWriter();
        SecurityUserDetails userDetails = (SecurityUserDetails) authentication.getPrincipal();
        UserVo userVo = new UserVo();
        BeanUtils.copyProperties(userDetails,userVo);
        RestResult success = RestResult.buildSuccess(userVo);
        writer.write(JSON.toJSONString(success));
        writer.flush();
        writer.close();
    }
}
