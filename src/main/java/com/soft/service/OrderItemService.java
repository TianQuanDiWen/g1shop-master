package com.soft.service;

import com.soft.entity.OrderItem;

import java.util.List;

public interface OrderItemService {

    int addOrderItem(OrderItem orderItem);

    List<OrderItem> findItemsById(int orderId);
}
