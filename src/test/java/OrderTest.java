import com.soft.entity.AfterSale;
import com.soft.entity.Order;
import com.soft.entity.OrderItem;
import com.soft.service.OrderItemService;
import com.soft.service.OrderService;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class OrderTest {

//   @Test
//    public void addOrder(){
//            ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
//            OrderService orderServiceImpl = (OrderService) context.getBean("OrderServiceImpl");
//            Order order = new Order(1,"lyp","支付宝","顺丰",getCurrentDate(),1,"郑州大学",410000,"123456789","sss",2,1);
//            int i = orderServiceImpl.addOrder(order);
//            System.out.println(i);
//            if(i > 0){
//                System.out.println("add success =>"+order);
//            }
//    }
//    @Test
//    public void addOrderItem(){
//        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
//        OrderItemService orderItemService = (OrderItemService) context.getBean("OrderItemServiceImpl");
//        orderItemService.addOrderItem( new OrderItem(58,1,"Note 9 Pro",1699.00,1,"products/1/0007.jpg"));
//    }

//    @Test
//    public void addAfterSale(){
//        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
//        OrderService orderServiceImpl = (OrderService) context.getBean("OrderServiceImpl");
//        AfterSale afterSale = new AfterSale(1,1,74,1000.00,"尽快处理",2);
//        orderServiceImpl.addAfterSale(afterSale);
//    }
//
//    @Test
//    public void updateStatus(){
//        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
//        OrderService orderServiceImpl = (OrderService) context.getBean("OrderServiceImpl");
//        orderServiceImpl.updateOrderStatus(74,1);
//    }


    @Test
    public void getAllOrder(){
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        OrderService orderServiceImpl = (OrderService) context.getBean("OrderServiceImpl");
        List<Order> list = orderServiceImpl.getAllOrder(1);
        System.out.println(list);
    }


    @Test
    public void getNewOrder(){
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        OrderService orderServiceImpl = (OrderService) context.getBean("OrderServiceImpl");
        Order order = orderServiceImpl.getNewOrder();
        System.out.println(order);
    }

    @Test
    public void getOrderById(){
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        OrderService orderServiceImpl = (OrderService) context.getBean("OrderServiceImpl");
        orderServiceImpl.getOrderById(39);
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
