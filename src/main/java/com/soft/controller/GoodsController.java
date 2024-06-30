package com.soft.controller;

import com.alibaba.fastjson.JSON;
import com.soft.entity.Goods;
import com.soft.entity.Pager;
import com.soft.service.GoodsService;
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
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/goods")
public class GoodsController {
    @Autowired
    @Qualifier("GoodsServiceImpl")
    private GoodsService goodsService;

    //1、查询手机列表
    @RequestMapping(value = "/findGoodsList1",method = RequestMethod.GET)
    @ResponseBody
    private String findGoodsList1(){
        List<Goods> list = goodsService.getGoodsByType1(1);
        return JSON.toJSONString(list);
    }

    //2、查询平板列表
    @RequestMapping(value = "/findGoodsList2",method = RequestMethod.GET)
    @ResponseBody
    private String findGoodsList2(){
        List<Goods> list = goodsService.getGoodsByType2(2);
        return JSON.toJSONString(list);
    }

    //3、查询电视列表
    @RequestMapping(value = "/findGoodsList3",method = RequestMethod.GET)
    @ResponseBody
    private String findGoodsList3(){
        List<Goods> list = goodsService.getGoodsByType2(3);
        return JSON.toJSONString(list);
    }

    //4、查询笔记本列表
    @RequestMapping(value = "/findGoodsList4",method = RequestMethod.GET)
    @ResponseBody
    private String findGoodsList4(){
        List<Goods> list = goodsService.getGoodsByType2(4);
        return JSON.toJSONString(list);
    }

    //5、查询家电列表
    @RequestMapping(value = "/findGoodsList5",method = RequestMethod.GET)
    @ResponseBody
    private String findGoodsList5(){
        List<Goods> list = goodsService.getGoodsByType2(5);
        return JSON.toJSONString(list);
    }

    //6、查询路由器列表
    @RequestMapping(value = "/findGoodsList6",method = RequestMethod.GET)
    @ResponseBody
    private String findGoodsList6(){
        List<Goods> list = goodsService.getGoodsByType2(6);
        return JSON.toJSONString(list);
    }

    //7、查询智能硬件列表
    @RequestMapping(value = "/findGoodsList7",method = RequestMethod.GET)
    @ResponseBody
    private String findGoodsList7(){
        List<Goods> list = goodsService.getGoodsByType2(7);
        return JSON.toJSONString(list);
    }

    //8、查询移动配件列表
    @RequestMapping(value = "/findGoodsList8",method = RequestMethod.GET)
    @ResponseBody
    private String findGoodsList8(){
        List<Goods> list = goodsService.getGoodsByType2(8);
        return JSON.toJSONString(list);
    }


    //9、查询智能养生列表
    @RequestMapping(value = "/findGoodsList9",method = RequestMethod.GET)
    @ResponseBody
    private String findGoodsList9(){
        List<Goods> list = goodsService.getGoodsByType2(9);
        return JSON.toJSONString(list);
    }

    //10、查询生活箱包列表
    @RequestMapping(value = "/findGoodsList10",method = RequestMethod.GET)
    @ResponseBody
    private String findGoodsList10(){
        List<Goods> list = goodsService.getGoodsByType2(10);
        return JSON.toJSONString(list);
    }

    //11、查询折扣商品列表
    @RequestMapping(value = "/findGoodsList11",method = RequestMethod.GET)
    @ResponseBody
    private String findGoodsList11(){
        List<Goods> list = goodsService.getGoodsByType3(6);
        return JSON.toJSONString(list);
    }




    //商品详情
    @RequestMapping(value = "/goodsDetails",method = RequestMethod.GET)
    @ResponseBody
    public String goodsDetails(@RequestParam("goodsId") int id,HttpSession session){
        Goods goods = goodsService.getGoodsById(id);
        if (goods == null){
            return "false";
        }
        session.setAttribute("goods",goods);
        return "true";
    }

    //查询所有商品
    @RequestMapping(value = "/getAllGoods", method = RequestMethod.GET)
    @ResponseBody
    public String getAllGoods(){
        List<Goods> list = goodsService.getAllGoods();
        return JSON.toJSONString(list);
    }

    //通过页数查询商品
    @RequestMapping(value = "/getGoodsByPage", method = RequestMethod.GET)
    @ResponseBody
    public String getGoodsByPage(@RequestParam("page") int page){
        Pager<Goods> list = goodsService.findByPager(page,15);
        return JSON.toJSONString(list);
    }

    //添加商品
    @RequestMapping(value = "/addGoods",method = RequestMethod.POST)
    public String addGoods(Goods goods){
        goods.setGoodsDate(getCurrentDate());
        int i = goodsService.addGoods(goods);
        if(i > 0) {
            System.out.println("添加商品成功");
            return "goodsManageList";
        }
        System.out.println("添加商品失败！");
        return "goodsManageList";
    }

    //修改商品
    @RequestMapping(value = "/updateGoods",method = RequestMethod.POST)
    public String updateGoods(Goods goods){
        int i = goodsService.updateGoods(goods);
        if(i > 0) {
            System.out.println("修改商品成功");
            return "goodsManageList";
        }
        System.out.println("修改商品失败！");
        return "goodsManageList";
    }

    //删除商品
    @RequestMapping(value = "delGoods",method = RequestMethod.POST)
    @ResponseBody
    public String delGoods(@RequestParam("goodsId") int goodsId){
        int i =goodsService.delGoods(goodsId);
        if(i > 0){
            System.out.println("删除商品成功！");
            return "true";
        }
        return "false";
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
