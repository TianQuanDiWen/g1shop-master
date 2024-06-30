package com.soft.service.Impl;

import com.soft.dao.OrderMapper;
import com.soft.entity.AfterSale;
import com.soft.entity.Order;
import com.soft.service.OrderService;

import java.util.List;

public class OrderServiceImpl implements OrderService {
    private OrderMapper orderMapper;

    public void setOrderMapper(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    @Override
    public List<Order> allOrder() {
        return orderMapper.allOrder();
    }

    @Override
    public List<Order> getAllOrder(int uid) {
        return orderMapper.getAllOrder(uid);
    }

    @Override
    public Order getOrderById(int orderId) {
        return orderMapper.getOrderById(orderId);
    }


    @Override
    public int addOrder(Order order) {
        return orderMapper.addOrder(order);
    }

    @Override
    public Order getNewOrder() {
        return orderMapper.getNewOrder();
    }


    @Override
    public int delOrder(int orderId) {
        return orderMapper.delOrder(orderId);
    }

    @Override
    public int updateOrderStatus(int orderId, int status) {
        return orderMapper.updateOrderStatus(orderId,status);
    }

    @Override
    public int addAfterSale(AfterSale afterSale) {
        return orderMapper.addAfterSale(afterSale);
    }

    @Override
    public AfterSale getAfterSale(int orderId, int type) {
        return orderMapper.getAfterSale(orderId,type);
    }
}
