import com.soft.entity.Order;
import com.soft.entity.User;
import com.soft.service.OrderService;
import com.soft.service.UserService;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class UserTest {

    @Test
    public void getUserByUsername(){
        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        UserService userServiceImpl = (UserService) context.getBean("UserServiceImpl");
        User user = userServiceImpl.getUserByUsername("lyp");
        System.out.println(user);
    }

//    @Test
//    public void updateUserStatus(){
//        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
//        UserService userServiceImpl = (UserService) context.getBean("UserServiceImpl");
//        userServiceImpl.updateUserStatus(1,1);
//    }

//    @Test
//    public void addUser(){
//        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
//        UserService userServiceImpl = (UserService) context.getBean("UserServiceImpl");
//        User user = new User(2,"username","password","actualName","city","address","postCode","licenceNum",1,"phone","email",1,1);
//        int n = userServiceImpl.addUser(user);
//        if(n > 0){
//            System.out.println("success =>"+user);
//        }
//    }
//
//    @Test
//    public void updateUser(){
//        ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
//        UserService userServiceImpl = (UserService) context.getBean("UserServiceImpl");
//        User user = new User(2,"xxx","yyy","zzz","dd","123","456","789",1,"123456","email",1,1);
//        int i = userServiceImpl.updateUser(user);
//        if (i > 0){
//            System.out.println("success =>"+user);
//        }
//    }
//

}
