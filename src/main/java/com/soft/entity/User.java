package com.soft.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private int uid;//用户id
    private String username;//用户名
    private String password;//密码
    private String actualName;//真实姓名
    private String city;//所在城市
    private String address;//联系地址
    private String postCode;//邮政编码
    private String licenceNum;//证件号码
    private int licenceType;//证件类型  1:身份证 2:军官证 3:学生证
    private String phone;//联系电话
    private String email;//邮箱
    private int type;//用户类型  1:会员 2:管理员
    private int level;//会员等级 1:铜牌 2:银牌 3:金牌 4:白金 5:钻石
    private int status;//会员状态 1:冻结 2:解冻（正常）
}
