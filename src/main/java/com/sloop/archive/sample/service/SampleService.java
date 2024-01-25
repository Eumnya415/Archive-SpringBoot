package com.sloop.archive.sample.service;

import com.sloop.archive.sample.domain.BoardDTO;
import com.sloop.archive.sample.mapper.SampleMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class SampleService {

    private final SampleMapper sampleMapper;

    public List<BoardDTO> getAllBoardList() {
        return sampleMapper.getAllBoardList();
    }
}
