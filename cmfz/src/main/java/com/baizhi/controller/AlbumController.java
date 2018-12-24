package com.baizhi.controller;

import com.baizhi.entity.Album;
import com.baizhi.service.AlbumService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/album")
public class AlbumController {
    @Autowired
    AlbumService albumService;
    @RequestMapping("/add")
    public void addAlbum(Album album, HttpSession session, MultipartFile file)throws IllegalStateException, IOException {
        ServletContext ctx = session.getServletContext();
        String realPath1 = ctx.getRealPath("/upload");
        File descFile = new File(realPath1+"/"+file.getOriginalFilename());
        file.transferTo(descFile);
        album.setCoverImg("/upload/"+file.getOriginalFilename());
        albumService.insertAlbum(album);
    }
    @RequestMapping("/getAll")
    public List<Album> getAll(){
        System.out.println(albumService.queryAll());
        return albumService.queryAll();
    }
    @RequestMapping("/getOne")
    public Album getOne(Integer id){
        return albumService.queryOne(id);
    }

}
