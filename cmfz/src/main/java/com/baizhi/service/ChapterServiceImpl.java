package com.baizhi.service;

import com.baizhi.enitty.Chapter;
import com.baizhi.mapper.ChapterMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

@Service
@Transactional
public class ChapterServiceImpl implements ChapterService {
    @Autowired
    ChapterMapper chapterMapper;
    @Override
    public void insertChapter(Chapter chapter) {
        String uuid = UUID.randomUUID().toString().replaceAll("-", "");
        System.out.println(uuid);
        chapter.setId(uuid);
        chapterMapper.insert(chapter);
    }
}
