package org.easymis.easysecurity.socket;

import java.io.IOException;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.alibaba.fastjson.JSON;

import lombok.extern.slf4j.Slf4j;

/**
 * @author tanyujie 13551259347@139.com
 * @version 1.0
 * @date 2019-07-22 18:17
 */
@Slf4j
@ServerEndpoint("/web/socket/{sid}")
@Component
public class WebSocketServer extends TextWebSocketHandler{

    /**
     * 静态变量，用来记录当前在线连接数。应该把它设计成线程安全的。
     */
    private static int onlineCount = 0;
    /**
     * concurrent包的线程安全Set，用来存放每个客户端对应的MyWebSocket对象。
     */
    private static CopyOnWriteArraySet<WebSocketServer> webSocketSet = new CopyOnWriteArraySet<WebSocketServer>();

    /**
     * 与某个客户端的连接会话，需要通过它来给客户端发送数据
     */
    private Session session;

    /**
     * 接收sid
      */
    private String sid="";
    /**
     * 连接建立成功调用的方法*/
    @OnOpen
    public void onOpen(Session session,@PathParam("sid") String sid) {
        this.session = session;
        //加入set中
        webSocketSet.add(this);
        //在线数加1
        addOnlineCount();
        log.info("有新窗口开始监听:"+sid+",当前在线人数为" + getOnlineCount());
        this.sid=sid;
        try {
            sendMessage("连接成功");
        } catch (IOException e) {
            log.error("websocket IO异常");
        }
    }

    /**
     * 连接关闭调用的方法
     */
    @OnClose
    public void onClose() {
        webSocketSet.remove(this);
        subOnlineCount();
        log.info("有一连接关闭！当前在线人数为" + getOnlineCount());
    }

    /**
     * 收到客户端消息后调用的方法
     *
     * @param message 客户端发送过来的消息*/
    @OnMessage
    public void onMessage(String message, Session session) {
        log.info("收到来自窗口"+sid+"的信息:"+message);
        for (WebSocketServer item : webSocketSet) {
            try {
                item.sendMessage(message);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     *
     * @param session
     * @param error
     */
    @OnError
    public void onError(Session session, Throwable error) {
        log.error("发生错误");
        error.printStackTrace();
    }
    /**
     * 实现服务器主动推送
     */
    public void sendMessage(String message) throws IOException {
        this.session.getBasicRemote().sendText(message);
    }
    /**
     * 实现服务器主动推送
     */
    public void sendMessage(SocketMessage message) throws IOException {
    	this.session.getBasicRemote().sendText(JSON.toJSONString(message));
    }
    public void sendMessage(SocketOrderMessage message) throws IOException {
    	this.session.getBasicRemote().sendText(JSON.toJSONString(message));
    }
    /**
     * 群发自定义消息
     * */
    public static void sendInfo(String message,@PathParam("sid") String sid) throws IOException {
        log.info("推送消息到窗口"+sid+"，推送内容:"+message);
        for (WebSocketServer item : webSocketSet) {
            try {
                if(sid==null) {
                    item.sendMessage(message);
                }else if(item.sid.equals(sid)){
                    item.sendMessage(message);
                }
            } catch (IOException e) {
                continue;
            }
        }
    }
    public static void sendInfo(SocketMessage message,@PathParam("sid") String sid) throws IOException {
        log.info("推送消息到窗口"+sid+"，推送内容:"+message);
        for (WebSocketServer item : webSocketSet) {
            try {
                if(sid==null) {
                    item.sendMessage(message);
                }else if(item.sid.equals(sid)){
                    item.sendMessage(message);
                }
            } catch (IOException e) {
                continue;
            }
        }
    }
    /**
     * 向指定支付用户发送消息
     * */
	public static void sendInfo(SocketOrderMessage message) throws IOException {
		log.info("推送消息到窗口" + message.getUserNo() + "，推送内容:" + message);
		for (WebSocketServer item : webSocketSet) {
			try {
				if (message.getUserNo() != null && item.sid.equals(message.getUserNo()))
					item.sendMessage(message);
			} catch (IOException e) {
				continue;
			}
		}
	}

    public static synchronized int getOnlineCount() {
        return onlineCount;
    }

    public static synchronized void addOnlineCount() {
        WebSocketServer.onlineCount++;
    }

    public static synchronized void subOnlineCount() {
        WebSocketServer.onlineCount--;
    }
}