package com.ruby.devel.web;

import java.util.List;

import com.ruby.devel.model.MarketDto;
import com.ruby.devel.service.impl.MarketMapper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@RestController // 차후에 ajax 진행 예정
@Slf4j
public class GroundRestController {

    @Autowired
    private MarketMapper marketMapper;

    @GetMapping("/markets")
    public List<MarketDto> getAllMarkets() {
        long startTime = System.currentTimeMillis();
        log.info("call for markets at {} ", startTime);
        List<MarketDto> markets = marketMapper.getAllDatas();
        long endTime = System.currentTimeMillis();
        log.info("markets aws call finished at {}, total time taken {} ms ", endTime, (endTime - startTime));
        return markets;
    }
}
