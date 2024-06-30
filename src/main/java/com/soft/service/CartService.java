package com.soft.service;

import com.soft.entity.Cart;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface CartService {
    //通过购物车id查询
    Cart getCartById(@Param("cartId") int cartId);

    //通过用户查询购物车
    List<Cart> getCartByUid( int userId);

    //透过用户和商品查询购物车
    Cart getCartByGoodsAndUid( int goodsId, int userId);

    //添加某个用户的购物车添加商品
    int addCart(Cart cart);

    //修改购物车商品数量
    int updateCart(Cart cart);

    //删除购物车某个记录
    int delCart(int cartId);
}
