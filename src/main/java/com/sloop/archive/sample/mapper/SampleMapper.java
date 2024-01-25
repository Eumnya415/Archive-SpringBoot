package com.sloop.archive.sample.mapper;

import com.sloop.archive.sample.domain.BoardDTO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SampleMapper {
    List<BoardDTO> getAllBoardList();
}
