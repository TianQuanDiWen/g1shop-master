package com.soft.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    private int orderId;//订单号
    private int userId;//用户
    private String orderReceiver;//收件人
    private String payment;//付款方式          1微信/2支付宝/3货到付款
    private String transType;//运送方式
    private Date orderDate;//下单时间
    private int orderState;//下单状态       1未付款/2已付款/3已发货/4已完成
    private String address;//邮寄地址
    private int postCode;//邮政编码
    private String telCode;//电话
    private String remarks;//备注
    private int status;//状态  1 待处理 2 已退货 3 已退款 4 已关闭
    private List<OrderItem> items;//订单商品列表
    private int itemNum;//订单商品数

}
