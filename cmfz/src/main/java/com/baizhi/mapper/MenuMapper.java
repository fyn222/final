package com.baizhi.mapper;

import com.baizhi.enitty.Menu;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;

public interface MenuMapper extends Mapper<Menu> {
    public List<Menu> getAll();
}
