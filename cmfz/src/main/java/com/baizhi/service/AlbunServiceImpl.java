package com.baizhi.service;

import com.baizhi.enitty.Album;
import com.baizhi.mapper.AlbumMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class AlbunServiceImpl implements AlbumService {
    @Autowired
    AlbumService albumService;
    @Override
    public void insertAlbum(Album album) {
        albumService.insertAlbum(album);
    }
}
