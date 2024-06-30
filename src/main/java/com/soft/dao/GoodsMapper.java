package com.soft.dao;

import com.soft.entity.Goods;
import org.apache.ibatis.annotations.*;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

public interface GoodsMapper {

    //查询所有商品
    @Select("select * from goods")
    List<Goods> getAllGoods();

    //根据id查询商品
    @Select("select * from goods where goods_id = #{goodsId}")
    Goods getGoodsById(@RequestParam("goodsId") int goodsId);

    //查询八个商品
    @Select("select * from goods where goods_type = #{goodsType} order by goods_id desc limit 8")
    List<Goods> getGoodsByType1(@Param("goodsType") int goodsType);

    //查询四个商品
    @Select("select * from goods where goods_type = #{goodsType} order by goods_id desc limit 4")
    List<Goods> getGoodsByType2(@Param("goodsType") int goodsType);

    //查询两个商品
    @Select("select * from goods where goods_type = #{goodsType} order by goods_id desc limit 2")
    List<Goods> getGoodsByType3(@Param("goodsType") int goodsType);

    //添加商品
    @Insert("insert into goods (goods_name,goods_price,goods_introduce,goods_date,goods_img,goods_type)\n" +
            "    values (#{goodsName},#{goodsPrice},#{goodsIntroduce},#{goodsDate},#{goodsImg},#{goodsType})")
    int addGoods( Goods goods);

    //修改商品
    @Update("update goods\n" +
            "            set goods_name = #{goodsName},goods_price= #{goodsPrice},goods_introduce = #{goodsIntroduce},\n" +
            "            goods_date= #{goodsDate},goods_img =#{goodsImg},goods_type = #{goodsType}\n" +
            "            where goods_id = #{goodsId}")
    int updateGoods(Goods goods);

    //删除商品
    @Delete("delete from goods where goods_id = ${goodsId}")
    int delGoods(@Param("goodsId") int goodsId);

    //分页
    @Select("select * from goods limit #{page},#{size}")
    List<Goods> findByPager(Map<String, Object> params);

    @Select("select count(1) from goods")
    long count();
}
