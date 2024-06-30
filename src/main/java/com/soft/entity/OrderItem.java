package com.soft.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderItem {
    private int itemId;//订单项id
    private int orderId;//订单id
    private int goodsId;//商品id
    private String goodsName;//商品名称
    private double goodsPrice;//商品价格
    private  int goodsNum;//商品数量
    private String goodsImg;//商品图片

    public OrderItem(int orderId, int goodsId, String goodsName, double goodsPrice, int goodsNum, String goodsImg) {
        this.orderId = orderId;
        this.goodsId = goodsId;
        this.goodsName = goodsName;
        this.goodsPrice = goodsPrice;
        this.goodsNum = goodsNum;
        this.goodsImg = goodsImg;
    }
}
