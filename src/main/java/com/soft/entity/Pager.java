package com.soft.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Pager<T> {
        private int page;//分页起始页
        private int size;//每页记录数
        private List<T> rows;//返回的记录集合
        private long total;//总记录条数
    }
