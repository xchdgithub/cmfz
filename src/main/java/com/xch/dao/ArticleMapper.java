package com.xch.dao;

import com.xch.entity.Article;
import com.xch.entity.Chapter;
import tk.mybatis.mapper.common.Mapper;
//文章
public interface ArticleMapper extends Mapper<Article> {
    //修改信息
    void updateOneArticle(Article article);
}