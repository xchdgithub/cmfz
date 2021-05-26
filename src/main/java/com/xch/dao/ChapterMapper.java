package com.xch.dao;

import com.xch.entity.Chapter;
import java.util.List;
import tk.mybatis.mapper.common.Mapper;
//章节
public interface ChapterMapper extends Mapper<Chapter> {
    //修专辑信息
    void updateOneChapter(Chapter chapter);
}