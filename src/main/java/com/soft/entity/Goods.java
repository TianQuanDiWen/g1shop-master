package com.soft.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Goods {
    private int goodsId;//商品id
    private String goodsName;//商品名称
    private double goodsPrice;//商品单价
    private String goodsIntroduce;//商品介绍
    private Date goodsDate;//上架时间
    private String goodsImg;//商品图片
    private int goodsType;//商品类型
}
