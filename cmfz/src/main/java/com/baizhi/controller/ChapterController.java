package com.baizhi.controller;

import com.baizhi.enitty.Chapter;
import com.baizhi.service.ChapterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/chapter")
public class ChapterController {
    @Autowired
    ChapterService chapterService;
    @RequestMapping("/add")
    public void addChapter(Chapter chapter){
        System.out.println(chapter);
        chapterService.insertChapter(chapter);
    }
}
