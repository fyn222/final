package com.baizhi.service;

import com.baizhi.entity.Album;
import com.baizhi.mapper.AlbumMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AlbumServiceImpl implements AlbumService {
    @Autowired
    AlbumMapper albumMapper;
    @Override
    public void insertAlbum(Album album) {
       albumMapper.insert(album);
    }
    public List<Album> queryAll(){
        return albumMapper.queryAll();
    }

    @Override
    public Album queryOne(Integer id) {
        return albumMapper.selectByPrimaryKey(id);
    }
}
