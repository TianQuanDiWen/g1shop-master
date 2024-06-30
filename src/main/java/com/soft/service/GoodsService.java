package com.soft.service;

import com.soft.entity.Goods;
import com.soft.entity.Pager;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface GoodsService {

    List<Goods> getAllGoods();

    Goods getGoodsById(int goodsId);

    List<Goods> getGoodsByType1( int goodsType);
    List<Goods> getGoodsByType2( int goodsType);
    List<Goods> getGoodsByType3( int goodsType);

    int addGoods(Goods goods);

    int updateGoods(Goods goods);

    int delGoods(int goodsId);

    Pager<Goods> findByPager(int page,int size);

}
