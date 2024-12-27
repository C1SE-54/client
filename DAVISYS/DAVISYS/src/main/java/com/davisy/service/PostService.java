package com.davisy.service;

import com.davisy.dao.ProvinceDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Map;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class PostService {

    @Autowired
    private ProvinceDao provinceDao;

    public List<Map<String, Object>> getPostCountsByMonth() {
        List<Object[]> results = provinceDao.getPostCountsByMonth();
        return results.stream()
                .map(row -> Map.of("month", row[0], "count", row[1]))
                .collect(Collectors.toList());
    }
}
