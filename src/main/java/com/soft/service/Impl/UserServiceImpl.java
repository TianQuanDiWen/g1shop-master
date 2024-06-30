package com.soft.service.Impl;

import com.soft.dao.UserMapper;
import com.soft.entity.User;
import com.soft.service.UserService;

import java.util.List;


public class UserServiceImpl implements UserService {

    private UserMapper userMapper;

    public void setUserMapper(UserMapper userMapper) {
        this.userMapper = userMapper;
    }

    @Override
    public User getUserById(int uid) {
        return userMapper.getUserById(uid);
    }

    @Override
    public List<User> getAllUser() {
        return userMapper.getAllUser();
    }

    @Override
    public User getUserByUsername(String username) {
        return userMapper.getUserByUsername(username);
    }

    @Override
    public int addUser(User user) {
        return userMapper.addUser(user);
    }

    @Override
    public int updateUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public int updateUserStatus(int uid, int status) {
        return userMapper.updateUserStatus(uid,status);
    }
}
