package com.baizhi.controller;

import com.baizhi.entity.Chapter;
import com.baizhi.service.ChapterService;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.UUID;

@RestController
@RequestMapping("/chapter")
public class ChapterController {
    @Autowired
    ChapterService chapterService;
    @RequestMapping("/add")
    public void addChapter(Chapter chapter, MultipartFile audio, HttpServletRequest request,Integer p_id){
        long size = audio.getSize();
        double v = size / (1024 * 1024.0);
        //获取当前文件的保存路径
        String realPath = request.getSession().getServletContext().getRealPath("/");
        String dir = realPath + "audio";
        File file = new File(dir);
        if (!file.exists()) {
            file.mkdir();
        }
        //重命名   测试.mp3
        String originalFilename = audio.getOriginalFilename();
        //mp3
        String extension = FilenameUtils.getExtension(originalFilename);
        String newName = UUID.randomUUID().toString();
        newName = newName + "." + extension;
        //上传
        try {
            audio.transferTo(new File(dir, newName));
        } catch (IOException e) {
            e.printStackTrace();
        }
       /* Long duration = Audioutil.getDuration(new File(dir + "/" + newName));*/
        String cid=UUID.randomUUID().toString();
        chapter.setId(cid);
        chapter.setSize(v+"Mb");
        chapter.setAlbumId(p_id);
        chapter.setUploadDate(new Date());
        chapter.setUrl(newName);
        System.out.println(chapter);
        chapter.setDuration("20min");
        chapterService.insertChapter(chapter);
        // 保存数据到数据库
        //  名字  大小  时长  url  专辑id  上传时间
    }
    @RequestMapping("/down")
    public void down(String url, String title, HttpSession session, HttpServletResponse response) {
        String realPath = session.getServletContext().getRealPath("/audio");
        String filePath = realPath + "/" + url;
        System.out.println(filePath+"````````````````````````");
        File file = new File(filePath);
        String extension = FilenameUtils.getExtension(url);
        String oldName = title + "." + extension;
        String encode = null;
        try {
            encode = URLEncoder.encode(oldName, "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        response.setHeader("Content-Disposition", "attachment;fileName=" + encode);
        response.setContentType("audio/mpeg");
        try {
            ServletOutputStream outputStream = response.getOutputStream();
            outputStream.write(FileUtils.readFileToByteArray(file));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
