package com.soft.service;

import com.soft.entity.User;

import java.util.List;

public interface UserService {
    User getUserById( int uid);

    List<User> getAllUser();

    User getUserByUsername(String username);

    int addUser(User user);

    int updateUser(User user);

    int updateUserStatus( int uid, int status);
}
