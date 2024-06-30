import com.soft.entity.Cart;
import com.soft.service.CartService;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;

public class CartTest {
    @Test
    public void getCartByUid(){
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        CartService cartServiceImpl = (CartService) context.getBean("CartServiceImpl");
        List<Cart> cart = cartServiceImpl.getCartByUid(1);
        System.out.println(cart);
    }

//    @Test
//    public void  getCartByGoodsAndUid(){
//        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
//        CartService cartServiceImpl = (CartService) context.getBean("CartServiceImpl");
//        Cart cart = cartServiceImpl.getCartByGoodsAndUid(1,1);
//        System.out.println(cart);
//    }

//    @Test
//    public void addCart(){
//        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
//        CartService cartServiceImpl = (CartService) context.getBean("CartServiceImpl");
//
//        Cart cart = new Cart(1,1,"手机",100.00,2,"images/100,jpg");
//        int i = cartServiceImpl.addCart(cart);
//        if(i > 0){
//            System.out.println("添加成功 => "+cart);
//        }
//    }

//    @Test
//    public void updateCart(){
//        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
//        CartService cartServiceImpl = (CartService) context.getBean("CartServiceImpl");
//        cartServiceImpl.updateCart(new Cart(14,1,2,1));
//    }

//    @Test
//    public void delCart(){
//        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
//        CartService cartServiceImpl = (CartService) context.getBean("CartServiceImpl");
//        cartServiceImpl.delCart(12);
//    }





}
