package com.soft.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Cart {
    private int cartId;//购物车编号
    private int userId;//用户
    private int goodsId;//商品
    private String goodsName;//商品名称
    private double goodsPrice;//商品单价
    private int goodsNum;//商品数量
    private String goodsImg;//商品图片


    public Cart(int userId, int goodsId, String goodsName, double goodsPrice, int goodsNum, String goodsImg) {
        this.userId = userId;
        this.goodsId = goodsId;
        this.goodsName = goodsName;
        this.goodsPrice = goodsPrice;
        this.goodsNum = goodsNum;
        this.goodsImg = goodsImg;
    }
}
