package com.soft.controller;

import com.alibaba.fastjson.JSON;
import com.soft.entity.*;
import com.soft.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/order")
public class OrderController {

    @Autowired
    @Qualifier("OrderServiceImpl")
    private OrderService orderService;

    @Autowired
    @Qualifier("OrderItemServiceImpl")
    private OrderItemService orderItemService;

    @Autowired
    @Qualifier("CartServiceImpl")
    private CartService cartService;

    @Autowired
    @Qualifier("GoodsServiceImpl")
    private GoodsService goodsService;

    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    //提交订单
    @RequestMapping(value = "/submitOrder",method = RequestMethod.POST)
    private String submitOrder(Order order,HttpSession session){
        List<Cart> list = cartService.getCartByUid(order.getUserId());
        order.setOrderDate(getCurrentDate());//设置下单时间
        order.setOrderState(2);//设置订单状态
        order.setItemNum(list.size());//设置商品数
        orderService.addOrder(order);//保存订单
        int orderId = orderService.getNewOrder().getOrderId();//获得订单号
        for(int i = 0; i < list.size();i++){
            OrderItem orderItem = new OrderItem();
            orderItem.setOrderId(orderId);//设置订单号
            orderItem.setGoodsId(list.get(i).getGoodsId());//设置商品id
            orderItem.setGoodsNum(list.get(i).getGoodsNum());//设置商品数量
            orderItem.setGoodsName(list.get(i).getGoodsName());//设置商品名称
            orderItem.setGoodsPrice(list.get(i).getGoodsPrice());//设置商品价格
            orderItem.setGoodsImg(list.get(i).getGoodsImg());//设置商品图片
            orderItemService.addOrderItem(orderItem);//保存订单项
            cartService.delCart(list.get(i).getCartId());//清空购物车
        }
        session.setAttribute("orderId",orderId);
        return "ordernum";
    }
    //查询用户所有订单
    @RequestMapping(value = "/findOrder",method = RequestMethod.GET)
    @ResponseBody
    private String findOrder(@RequestParam("userId") int userId){
        List<Order> list = orderService.getAllOrder(userId);
        if(!list.isEmpty()){
            return JSON.toJSONString(list);
        }
        return "false";
    }

    //通过订单号查询订单
    @RequestMapping(value="/findOrderById",method = RequestMethod.GET)
    @ResponseBody
    private String findOrderById(@RequestParam("orderId") int orderId,HttpSession session){
        Order order = orderService.getOrderById(orderId);
        List<OrderItem> items = orderItemService.findItemsById(orderId);
        String name = userService.getUserById(order.getUserId()).getUsername();
        session.setAttribute("order",order);
        session.setAttribute("uname",name);
        session.setAttribute("orderItems",items);
        return "true";
    }

    //通过订单号删除订单
    @RequestMapping(value = "/delOrder",method = RequestMethod.POST)
    @ResponseBody
    private String delOrder(@RequestParam("orderId") int orderId){
        int i = orderService.delOrder(orderId);
        if(i > 0){
            return "true";
        }
            return "false";
    }

    //查询所有订单
    @RequestMapping(value = "/getAllOrder", method = RequestMethod.GET)
    @ResponseBody
    public String getAllOrder(){
        List<Order> list = orderService.allOrder();
        return JSON.toJSONString(list);
    }

    //记录售后
    @RequestMapping(value ="/addAfterSale",produces = "application/json;charset=utf-8",method = RequestMethod.POST)
    @ResponseBody
    public String addAfterSale(AfterSale afterSale){
        int orderId = afterSale.getOrderId();
        int type = afterSale.getType();
        if(orderService.getAfterSale(orderId,type) != null){
            return "请勿重复提交！";
        }
        int i = orderService.addAfterSale(afterSale);
        if(i > 0){
            orderService.updateOrderStatus(orderId,1);//设置为待处理
            return "提交成功，客服将会在一天之内处理！";
        }
        return "提交失败，请再次尝试！";
    }

    //查询售后
    @RequestMapping(value ="/getAfterSale",method = RequestMethod.POST)
    @ResponseBody
    public String getAfterSale(@RequestParam("orderId") int orderId,@RequestParam("type") int type,HttpSession session){
        AfterSale afterSale = orderService.getAfterSale(orderId,type);
        session.setAttribute("afterSale",afterSale);
        if(type == 3){
            session.setAttribute("closeOrderId",orderId);
        }
        return "true";
    }

    //处理售后
    @RequestMapping(value = "/checkAfterSale",produces = "application/json;charset=utf-8",method = RequestMethod.POST)
    @ResponseBody
    public String checkAfterSale(@RequestParam("status") int status,@RequestParam("orderId") int orderId){
        //状态  1 待处理 2 已退货 3 已退款 4 已关闭
        if(status != 0){
            orderService.updateOrderStatus(orderId,status);
        }
        return "处理成功！";
    }

    //关闭订单
    @RequestMapping(value ="/closeOrder",produces = "application/json;charset=utf-8",method = RequestMethod.POST)
    @ResponseBody
    public String closeOrder(AfterSale afterSale){
        int orderId = afterSale.getOrderId();
        int type = afterSale.getType();
        if(orderService.getAfterSale(orderId,type) != null){
            return "请勿重复提交！";
        }
        int i = orderService.addAfterSale(afterSale);
        if(i > 0){
            orderService.updateOrderStatus(orderId,4);//设置为关闭状态
            return "关闭订单成功！";
        }
        return "关闭订单失败，请再次尝试！";
    }


    public Date getCurrentDate() {
        //产生一个不带毫秒的时间,不然,SQL时间和JAVA时间格式不一致
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        Date tm = new Date();
        try {
            tm= sdf.parse(sdf.format(new Date()));
        } catch (ParseException e1) {
            e1.printStackTrace();
        }
        return tm;
    }
}
