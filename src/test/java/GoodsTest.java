import com.soft.entity.Goods;
import com.soft.service.GoodsService;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class GoodsTest {
    @Test
    public void getAllGoods(){
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        GoodsService goodsServiceImpl = (GoodsService) context.getBean("GoodsServiceImpl");
        List<Goods> allGoods = goodsServiceImpl.getAllGoods();
        System.out.println(allGoods);
    }

    @Test
    public void GoodsById(){
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        GoodsService goodsServiceImpl = (GoodsService) context.getBean("GoodsServiceImpl");

        Goods goods = goodsServiceImpl.getGoodsById(1);
            System.out.println(goods);
    }

    @Test
    public void getGoodsByType(){
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        GoodsService goodsServiceImpl = (GoodsService) context.getBean("GoodsServiceImpl");
        List<Goods> allGoods = goodsServiceImpl.getGoodsByType1(1);
        System.out.println(allGoods);
    }

    @Test
    public void findByPager(){
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        GoodsService goodsServiceImpl = (GoodsService) context.getBean("GoodsServiceImpl");
        goodsServiceImpl.findByPager(1,10);
        goodsServiceImpl.findByPager(2,10);
        goodsServiceImpl.findByPager(3,10);
    }

//    @Test
//    public void addGoods(){
//        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
//        GoodsService goodsServiceImpl = (GoodsService) context.getBean("GoodsServiceImpl");
//        Goods goods = new Goods(50,"运动裤",1000.23,"宽松透气",getCurrentDate(),"/img/01.png",1);
//
//        int i = goodsServiceImpl.addGoods(goods);
//        if(i > 1){
//            System.out.println("添加成功=>"+goods);
//        }
//    }

//    @Test
//    public void updateGoods(){
//        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
//        GoodsService goodsServiceImpl = (GoodsService) context.getBean("GoodsServiceImpl");
//        Goods goods = new Goods(41,"运动裤",1050.23,"宽松透气",getCurrentDate(),"/img/01.png",1);
//        int i = goodsServiceImpl.updateGoods(goods);
//        if(i > 1){
//            System.out.println("修改成功=>"+goods);
//        }
//    }


    public Date getCurrentDate() {
        //产生一个不带毫秒的时间,不然,SQL时间和JAVA时间格式不一致
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
        Date tm = new Date();
        try {
            tm= sdf.parse(sdf.format(new Date()));
        } catch (ParseException e1) {
            e1.printStackTrace();
        }
        return tm;
    }
}
