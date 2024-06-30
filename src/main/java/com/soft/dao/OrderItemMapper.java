package com.soft.dao;

import com.soft.entity.OrderItem;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface OrderItemMapper {
    //添加订单项
    @Insert("insert into G1shop.orderItem (order_id,goods_id,goods_name,goods_price,goods_num,goods_img)" +
            " values (#{orderId},#{goodsId},#{goodsName},#{goodsPrice},#{goodsNum},#{goodsImg})")
    int addOrderItem(OrderItem orderItem);

    //查询订单项
    @Select("select * from G1shop.orderItem where order_id = #{orderId}")
    List<OrderItem> findItemsById(@Param("orderId") int orderId);
}
