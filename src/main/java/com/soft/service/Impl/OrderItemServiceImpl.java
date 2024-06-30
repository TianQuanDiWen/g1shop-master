package com.soft.service.Impl;

import com.soft.dao.OrderItemMapper;
import com.soft.entity.OrderItem;
import com.soft.service.OrderItemService;
import com.soft.service.OrderService;

import java.util.List;

public class OrderItemServiceImpl implements OrderItemService {
   private OrderItemMapper orderItemMapper;

    public void setOrderItemMapper(OrderItemMapper orderItemMapper) {
        this.orderItemMapper = orderItemMapper;
    }

    @Override
    public int addOrderItem(OrderItem orderItem) {
        return orderItemMapper.addOrderItem(orderItem);
    }

    @Override
    public List<OrderItem> findItemsById(int orderId) {
        return orderItemMapper.findItemsById(orderId);
    }


}
