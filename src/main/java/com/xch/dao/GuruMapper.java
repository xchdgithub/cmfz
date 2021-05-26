package com.xch.dao;

import com.xch.entity.Guru;
import com.xch.entity.User;
import tk.mybatis.mapper.common.Mapper;

public interface GuruMapper extends Mapper<Guru> {
    void updateOneGuru(Guru guru);
}