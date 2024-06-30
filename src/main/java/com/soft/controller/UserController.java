package com.soft.controller;

import com.alibaba.fastjson.JSON;
import com.soft.entity.User;
import com.soft.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;

    //会员登录
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    @ResponseBody
    public String Login(@RequestParam("uname")String uname, @RequestParam("pwd") String pwd, HttpSession session){
        User user = userService.getUserByUsername(uname);
        if(user == null){//该用户不存在
            return "false1";
        }
        if(!user.getPassword().equals(pwd)){//账号或密码错误
            return "false2";
        }//1:冻结 2:解冻（正常）
        if(user.getStatus() != 2){//账户冻结无法登录
            return "false3";
        }
        int uid = user.getUid();
        session.setAttribute("user",user);
        session.setAttribute("uid",uid);
        return "true";
    }


    //重复会员名称验证
    @RequestMapping(value = "/checkUsername",method = RequestMethod.GET)
    @ResponseBody
    public String checkUsername(@RequestParam("username") String username){
        User checkUser = userService.getUserByUsername(username);
        System.out.println(checkUser);
        if(checkUser == null){
            return "true";
        }
        return "false";
    }

    //会员注册
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    @ResponseBody
    public String Register(User user){
           int  i = userService.addUser(user);
           userService.updateUserStatus(user.getUid(),2);//初始化用户状态
           if(i > 0){
               return "true";
           } else {
               return "false1";
           }
       }


    //更改会员信息
    @RequestMapping(value = "/update",method = RequestMethod.POST)
    @ResponseBody
    public String Update( User user,HttpSession session){

        int i = userService.updateUser(user);
        if(i > 0){
            session.setAttribute("user",user);
            return "true";
        } else {
            return "false";
        }
    }


    //后台登录
    @RequestMapping(value = "/manage",method = RequestMethod.POST)
    @ResponseBody
    public String manage(@RequestParam("uname")String uname, @RequestParam("pwd") String pwd, HttpSession session){
        User user = userService.getUserByUsername(uname);
        if(user == null){//该用户不存在
            return "false1";
        }
        if(!user.getPassword().equals(pwd)){//账号或密码错误
            return "false2";
        }
        if(user.getType() != 2){//非管理员无法登录
            return "false3";
        }
        session.setAttribute("user",user);
        return "true";
    }

    //登出
    @RequestMapping(value = "/logOut",method = RequestMethod.GET)
    @ResponseBody
    public String logOut( HttpSession session){
        session.removeAttribute("user");
        session.removeAttribute("uid");
        return "true";
    }

    //查询所有用户
    @RequestMapping(value = "/getAllUser", method = RequestMethod.GET)
    @ResponseBody
    public String getAllUser(){
        List<User> list = userService.getAllUser();
        return JSON.toJSONString(list);
    }
    //查询会员详情
    @RequestMapping(value = "/userDetail",method = RequestMethod.GET)
    @ResponseBody
    public String userDetail(@RequestParam("uid") int uid,HttpSession session){
        User user = userService.getUserById(uid);
        if(user != null){
            session.setAttribute("userDetail",user);
            return "true";
        }
        return "false";
    }

    //冻结解冻账户
    @RequestMapping(value = "/closeAndOpenUser",method = RequestMethod.POST)
    @ResponseBody
    public String closeAndOpenUser(@RequestParam("uid") int uid){
        User user = userService.getUserById(uid);
        int status = user.getStatus();
        //会员状态 1:冻结 2:解冻（正常）
        if(status == 1){
            userService.updateUserStatus(uid, 2);
            return "true";
        } else if(status == 2){
            userService.updateUserStatus(uid, 1);
        }
        return "false";
    }

//====================================页面跳转  前台界面===========================================================================
//跳转到登录界面
@RequestMapping("/toLogin")
public String toLogin(){
    return "login";
}

    //跳转到修改用户信息界面
    @RequestMapping("/toUpdate")
    public String toUpdate(){
        return "updateMemberInfo";
    }

    //跳转到注册界面
    @RequestMapping("/toRegister")
    public String toRegister(){
        return "register";
    }

    //跳转到购物车界面
    @RequestMapping("/toCart")
    public String toCart(){
        return "goodscart";
    }

    //跳转到查看订单界面
    @RequestMapping("/toOrder")
    public String toOrder(){
        return "checkorder";
    }

    //跳转到后台管理界面
    @RequestMapping("/toManage")
    public String toManage(){
        return "manage";
    }

    //跳转到结账界面
    @RequestMapping("/toCheck")
    public String toCheck(){
        return "checkout";
    }

    //跳转到订单号界面
    @RequestMapping("/toOrderNum")
    public String toOrderNum(){
        return "ordernum";
    }


    //跳转到订单信息界面
    @RequestMapping("/toOrderInfo")
    public String toOrderInfo(){
        return "orderinformation";
    }

    //跳转到商品详情界面
    @RequestMapping("/toDetails")
    public String toDetails(){
        return "goodsdetails";
    }

    //====================================页面跳转  后台界面===========================================================================
    //跳转到商品列表界面
    @RequestMapping("/toGoodsManageList")
    public String toGoodsManageList(){
        return "goodsManageList";
    }

    //跳转到商品信息界面
    @RequestMapping("/toGoodsManageView")
    public String toGoodsManageView(){
        return "goodsManageView";
    }

    //跳转到订单列表界面
    @RequestMapping("/toOrderManageList")
    public String toOrderManageList(){
        return "orderManageList";
    }

    //跳转到订单信息界面
    @RequestMapping("/toOrderManageView")
    public String toOrderManageView(){
        return "orderManageView";
    }

    //跳转到用户列表界面
    @RequestMapping("/toUserManageList")
    public String toUserManageList(){
        return "userManageList";
    }

    //跳转到用户信息界面
    @RequestMapping("/toUserManageView")
    public String toUserManageView(){
        return "userManageView";
    }

    //跳转到添加商品界面
    @RequestMapping("/toGoodsManageAdd")
    public String toGoodsManageAdd(){
        return "toGoodsManageAdd";
    }

    //跳转到修改商品界面
    @RequestMapping("/toGoodsManageEdit")
    public String toGoodsManageEdit(){
        return "toGoodsManageEdit";
    }

    //跳转到退货申请界面
    @RequestMapping("/toReturnGoods")
    public String toReturnGoods(){
        return "returnGoods";
    }

    //跳转到退款申请界面
    @RequestMapping("/toReturnMoney")
    public String toReturnMoney(){
        return "returnMoney";
    }

    //跳转到退货处理界面
    @RequestMapping("/toCheckReturnGoods")
    public String toCheckReturnGoods(){
        return "checkReturnGoods";
    }

    //跳转到退款处理界面
    @RequestMapping("/toCheckReturnMoney")
    public String toCheckReturnMoney(){
        return "checkReturnMoney";
    }

    //跳转到关闭处理界面
    @RequestMapping("/toCloseOrder")
    public String toCloseOrder(){
        return "closeOrder";
    }

}
