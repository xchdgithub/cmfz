package com.xch.dao;

import com.xch.entity.Album;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

import java.util.List;
//专辑
public interface AlbumMapper extends Mapper<Album> {

    //分页展示所有
    List<Album> selectAlbum(@Param("page") Integer page, @Param("rows") Integer rows);

    //修改轮播图信息
    void updateOneAlbum(Album album);

}