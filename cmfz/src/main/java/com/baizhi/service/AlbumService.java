package com.baizhi.service;

import com.baizhi.entity.Album;

import java.util.List;

public interface AlbumService {
    public void insertAlbum(Album album);//添加专辑
    public List<Album> queryAll();
    public Album queryOne(Integer id);
}
