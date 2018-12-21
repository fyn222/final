package com.baizhi.controller;

import com.baizhi.enitty.Album;
import com.baizhi.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/album")
public class AlbumController {
    @Autowired
    AlbumService albumService;
    @RequestMapping("/add")
    public void addAlbum(Album album){
        System.out.println(album);
        albumService.insertAlbum(album);
    }
}
