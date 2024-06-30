package com.soft.service.Impl;

import com.soft.dao.CartMapper;
import com.soft.entity.Cart;
import com.soft.service.CartService;

import java.util.List;

public class CartServiceImpl implements CartService {
    private CartMapper cartMapper;

    public void setCartMapper(CartMapper cartMapper) {
        this.cartMapper = cartMapper;
    }

    @Override
    public Cart getCartById(int cartId) {
        return cartMapper.getCartById(cartId);
    }

    @Override
    public List<Cart> getCartByUid(int userId) {
        return cartMapper.getCartByUid(userId);
    }

    @Override
    public Cart getCartByGoodsAndUid(int goodsId, int userId) {
        return cartMapper.getCartByGoodsAndUid(goodsId,userId);
    }

    @Override
    public int addCart(Cart cart) {
        return cartMapper.addCart(cart);
    }

    @Override
    public int updateCart(Cart cart) {
        return cartMapper.updateCart(cart);
    }

    @Override
    public int delCart(int cartId) {
        return cartMapper.delCart(cartId);
    }
}
