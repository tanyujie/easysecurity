package org.easymis.easysecurity.socket;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
/**
 * 
 * @author tanyujie 13551259347@139.com
 * 订单消息
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class SocketOrderMessage {
    private Integer id;
    //订单编号
    private String orderNo;
    //用户编号
    private String userNo;
    private Integer payResult;
    private Date sendDate;
    private String resultCode;
}

