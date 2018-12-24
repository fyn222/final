package com.baizhi.controller;

import com.baizhi.entity.Banner;
import com.baizhi.service.BannerService;
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
@RequestMapping("/banner")
public class BannerController {
    @Autowired
    BannerService bannerService;
    @RequestMapping("/getAll")
    public List<Banner> getAll(){
        List<Banner> banners = bannerService.queryAll();
        return banners;
    }
    @RequestMapping("/insert")
    public void insert(Banner banner, HttpSession session,MultipartFile file) throws IllegalStateException, IOException {
        ServletContext ctx = session.getServletContext();
        String realPath = ctx.getRealPath("/upload");
        File descFile = new File(realPath+"/"+file.getOriginalFilename());
        file.transferTo(descFile);
        banner.setImgPath("/upload/"+file.getOriginalFilename());
        bannerService.insertBanner(banner);
    }
    @RequestMapping("/delete")
    public void delete(Integer id){
        bannerService.deleteBanner(id);
    }
    @RequestMapping("/update")
    public void update(Banner banner){
        System.out.println(banner);
        bannerService.updateBanner(banner);
    }
}
