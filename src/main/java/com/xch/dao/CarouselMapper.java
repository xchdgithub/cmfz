package com.xch.dao;

import com.xch.entity.Carousel;
import com.xch.entity.CarouselExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import tk.mybatis.mapper.common.Mapper;

public interface CarouselMapper extends Mapper<Carousel> {
    //分页展示所有
    public List<Carousel> selectCarousel(@Param("page") Integer page, @Param("rows") Integer rows);

    //获取总条数
    public Integer selectCarouselTotalCount();

    //修改轮播图信息
    public void updateCarousel(Carousel carousel);

}