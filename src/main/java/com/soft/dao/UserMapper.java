package com.soft.dao;

import com.soft.entity.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;


public interface UserMapper {

    @Select("select * from user where uid =#{uid}")
    User getUserById(@Param("uid") int uid);

    @Select("select * from user")
    List<User> getAllUser();

    @Select("select * from user where username = #{username}")
    User getUserByUsername(@Param("username")String  username);

    @Insert("insert into user (username,password,actual_name,city,address,post_code,licence_num,licence_type,phone,email)" +
            "values (#{username},#{password},#{actualName},#{city},#{address},#{postCode},#{licenceNum},#{licenceType},#{phone},#{email})")
    int addUser(User user);

    @Update("update user " +
            "set username = #{username},password = #{password},actual_name = #{actualName},city = #{city},address =#{address},post_code = #{postCode}," +
            "licence_num = #{licenceNum},licence_type = #{licenceType},phone = #{phone},email = #{email}" +
            "where uid = #{uid}")
    int updateUser(User user);

    @Update("update user set status = #{status} where uid = #{uid}")
    int updateUserStatus(@Param("uid") int uid,@Param("status") int status);
}
