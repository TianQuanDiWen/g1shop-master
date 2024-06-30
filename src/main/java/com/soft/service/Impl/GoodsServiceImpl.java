package com.soft.service.Impl;

import com.soft.dao.GoodsMapper;
import com.soft.entity.Goods;
import com.soft.entity.Pager;
import com.soft.service.GoodsService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class GoodsServiceImpl implements GoodsService {
    private GoodsMapper goodsMapper;

    public void setGoodsMapper(GoodsMapper goodsMapper) {
        this.goodsMapper = goodsMapper;
    }

    @Override
    public List<Goods> getAllGoods() {
        return goodsMapper.getAllGoods();
    }

    @Override
    public Goods getGoodsById(int goodsId) {
        return goodsMapper.getGoodsById(goodsId);
    }


    @Override
    public List<Goods> getGoodsByType1(int goodsType) {
        return goodsMapper.getGoodsByType1(goodsType);
    }

    @Override
    public List<Goods> getGoodsByType2(int goodsType) {
        return goodsMapper.getGoodsByType2(goodsType);
    }

    @Override
    public List<Goods> getGoodsByType3(int goodsType) {
        return goodsMapper.getGoodsByType3(goodsType);
    }


    @Override
    public int addGoods(Goods goods) {
        return goodsMapper.addGoods(goods);
    }

    @Override
    public int updateGoods(Goods goods) {
        return goodsMapper.updateGoods(goods);
    }

    @Override
    public int delGoods(int goodsId) {
        return goodsMapper.delGoods(goodsId);
    }

    @Override
    public Pager<Goods> findByPager(int page, int size) {
        Map<String,Object> params = new HashMap<>();
        params.put("page",(page-1)*size);
        params.put("size",size);
        Pager<Goods> pager = new Pager<>();
        List<Goods> list = goodsMapper.findByPager(params);
        pager.setRows(list);
        long total= goodsMapper.count()/15;
        if(total % 15 > 0 ){
            total++;
        }
        pager.setTotal(total);
        return pager;
    }

}
