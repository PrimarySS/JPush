package com.xhc.push;


import com.xhc.push.utils.JpushUtil;

import java.util.HashMap;
import java.util.Map;

public class MainTest {

    public static void main(String[] args) {

        String notification_title = "这里是测试通知内容标题"; //通知内容标题
        String msg_title = "这里是测试消息内容标题"; //消息内容标题
        String msg_content = "这里是测试消息内容"; //消息内容
        Map<String, String> xtrasparams = new HashMap<String, String>(); //扩展字段

        xtrasparams.put("from", "JPush");

        int result = JpushUtil.sendToAll(notification_title, msg_title, msg_content, xtrasparams);
        System.out.println(result);
    }


}
