package com.soft.dao;

import com.soft.entity.AfterSale;
import com.soft.entity.Order;
import com.soft.entity.OrderItem;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface OrderMapper {
    //查询所有订单
    @Select("select * from G1shop.order")
    List<Order> allOrder();

   //查询用户的所有订单

    @Select("select * from G1shop.order where  user_id = #{userId}")
    List<Order> getAllOrder( @Param("userId") int userId);

    //根据订单号查询
    @Select("select * from G1shop.order  where order_id = ${orderId}")
    Order getOrderById(@Param("orderId") int orderId);

    //查询新创建的订单
    @Select("select * from G1shop.order order by order_id desc limit 1")
    Order getNewOrder();

    //添加订单
    @Insert("insert into G1shop.order (user_id,order_receiver,payment,trans_type,order_date,order_state,address,post_code,tel_code,remarks,item_num)" +
            " values (#{userId},#{orderReceiver},#{payment},#{transType},#{orderDate},#{orderState},#{address},#{postCode},#{telCode},#{remarks},#{itemNum})")
    int addOrder ( Order order);

    //删除订单
    @Delete("delete from G1shop.order where order_id = #{orderId}")
    int delOrder(@Param("orderId") int orderId);

    //修改订单状态
    @Update("update G1shop.order set status = #{status} where order_id = #{orderId}")
    int updateOrderStatus(@Param("orderId") int orderId,@Param("status") int status);

    //添加售后
    @Insert("insert into G1shop.afterSale (user_id,order_id,money,remarks,type)" +
            " values (#{userId},#{orderId},#{money},#{remarks},#{type})")
    int addAfterSale(AfterSale afterSale);

    //查询售后信息
    @Select("select * from G1shop.afterSale where order_id =#{orderId} and type = #{type}")
    AfterSale getAfterSale(@Param("orderId") int orderId,@Param("type") int type);
}
