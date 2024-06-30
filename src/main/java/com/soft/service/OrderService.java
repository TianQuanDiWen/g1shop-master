package com.soft.service;

import com.soft.entity.AfterSale;
import com.soft.entity.Order;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface OrderService {
    List<Order> allOrder();

    List<Order> getAllOrder(int uid);

    Order getOrderById( int orderId);

    int addOrder(Order order);

    Order getNewOrder();

    int delOrder(int orderId);

    int updateOrderStatus( int orderId, int status);

    int addAfterSale(AfterSale afterSale);

    AfterSale getAfterSale(int orderId, int type);
}
