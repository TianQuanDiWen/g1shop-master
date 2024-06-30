package com.soft.dao;

import com.soft.entity.Cart;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface CartMapper {
    //通过购物车id查询
    @Select("select * from cart where cart_id = #{cartId}")
    Cart getCartById(@Param("cartId") int cartId);

    //通过用户查询购物车
    @Select("select * from cart where user_id = #{userId}")
    List<Cart> getCartByUid(@Param("userId") int userId);

    //透过用户和商品查询购物车
    @Select("select * from cart where goods_id = #{goodsId} and user_id = #{userId}")
    Cart getCartByGoodsAndUid(@Param("goodsId") int goodsId,@Param("userId") int userId);

    //添加某个用户的购物车添加商品
    @Insert("insert into cart (user_id,goods_id,goods_name,goods_price,goods_num,goods_img)\n" +
            "    values (#{userId},#{goodsId},#{goodsName},#{goodsPrice},#{goodsNum},#{goodsImg})")
    int addCart(Cart cart);

    //修改购物车商品数量
    @Update("update cart\n" +
            "            set goods_num = #{goodsNum}\n" +
            "            where cart_id = #{cartId}")
    int updateCart(Cart cart);

    //删除购物车某个记录
    @Delete("delete from cart where cart_id = #{cartId}")
    int delCart(@Param("cartId") int cartId);


}
