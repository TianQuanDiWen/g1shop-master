package com.soft.controller;

import com.alibaba.fastjson.JSON;
import com.soft.entity.Cart;
import com.soft.entity.Goods;
import com.soft.service.CartService;
import com.soft.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/cart")
public class CartController {
    @Autowired
    @Qualifier("CartServiceImpl")
    private CartService cartService;

    @Autowired
    @Qualifier("GoodsServiceImpl")
    private GoodsService goodsService;

    //加入购物车
    @RequestMapping(value = "/addCart",method = RequestMethod.POST)
    @ResponseBody
    private String addCart(@RequestParam("goodsId")int goodsId,@RequestParam("userId")int userId){
        Cart goods = cartService.getCartByGoodsAndUid(goodsId, userId);
        if(goods == null){
            Goods g = goodsService.getGoodsById(goodsId);
            Cart cart = new Cart(userId,goodsId,g.getGoodsName(),g.getGoodsPrice(),1,g.getGoodsImg());
            //默认一次加入一个商品
            int i = cartService.addCart(cart);
            if(i > 0){
                return "true";
            }
        } else {//若商品已在购物车，那么直接增加数量
            int num = goods.getGoodsNum() + 1;
            goods.setGoodsNum(num);
            int x = cartService.updateCart(goods);
            if (x > 0){
                return "true";
            }
        }
        return "false";
    }

    //查看购物车
    @RequestMapping(value = "/checkCart",method = RequestMethod.GET)
    @ResponseBody
    private String checkCart(@RequestParam("userId") int userId, HttpSession session){
        List<Cart> list = cartService.getCartByUid(userId);
        if(list != null ){
            return JSON.toJSONString(list);
        }
        return "false";
    }

    //修改商品数量
    @RequestMapping(value = "/updateCart",method = RequestMethod.POST)
    @ResponseBody
    private String updateCart( @RequestParam("goodsNum") int goodsNum,@RequestParam("cartId") int cartId){
        Cart cart = cartService.getCartById(cartId);
        cart.setGoodsNum(goodsNum);
        int i = cartService.updateCart(cart);
        if (i > 0){
            return "true";
        }
        return "false";
    }

    //删除商品
    @RequestMapping(value = "/delCart",method = RequestMethod.POST)
    @ResponseBody
    private String delCart(@RequestParam("cartId") int cartId){
        int i = cartService.delCart(cartId);
        if(i > 0){
            return "true";
        }
        return "false";
    }

    //清空购物车
    @RequestMapping(value = "/clearCart",method = RequestMethod.POST)
    @ResponseBody
    private String clearCart(@RequestParam("userId") int userId){
        List<Cart> list = cartService.getCartByUid(userId);
        if(!list.isEmpty()){
            for(int i = 0; i < list.size(); i++){
               cartService.delCart(list.get(i).getCartId());
            }
            return "true";
        }
        return "false";
    }

    @RequestMapping(value = "/allMoney",method = RequestMethod.GET)
    @ResponseBody
    public String allMoney(@RequestParam("userId") int userId,HttpSession session){
        List<Cart> list = cartService.getCartByUid(userId);
        double allMoney = 0.00;
        double x = 0.00;
        for(int i = 0; i < list.size(); i++){
            Double price = list.get(i).getGoodsPrice();
            int num =list.get(i).getGoodsNum();
            x += price * num;
            allMoney =x;
        }
        System.out.println(allMoney);
        session.setAttribute("allMoney",allMoney);
        return "true";
    }

}
