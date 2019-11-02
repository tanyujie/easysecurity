package org.easymis.easysecurity.socket;

import java.io.IOException;
import java.util.Date;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * @author tanyujie 13551259347@139.com
 * @version 1.0
 * @date 2019-07-22 18:19
 */

@Controller
@RequestMapping("/web/socket")
public class WebSocketController {

    /**
     * 页面请求
     * @param cid
     * @return
     */
    @GetMapping("/{cid}")
    public ModelAndView socket(@PathVariable String cid) {
        ModelAndView mav=new ModelAndView("/socket");
        mav.addObject("cid", cid);
        return mav;
    }

    /**
     * 推送数据接口
     * @param cid
     * @param message
     * @return
     */
    @ResponseBody
    @RequestMapping("/send")
    public String pushToWeb(String cid,String message) {
        try {
        	SocketOrderMessage orderMessage= new SocketOrderMessage();
        	orderMessage.setResultCode("支付成功");
            orderMessage.setPayResult(2);
    		orderMessage.setSendDate(new Date());
    		orderMessage.setUserNo("20");
    		orderMessage.setOrderNo("order001");    		
            WebSocketServer.sendInfo(orderMessage);
        } catch (IOException e) {
            e.printStackTrace();
            return cid+"#"+e.getMessage();
        }
        return cid;
    }
}