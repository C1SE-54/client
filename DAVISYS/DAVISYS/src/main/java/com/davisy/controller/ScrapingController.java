package com.davisy.controller;

import com.davisy.service.ScrapingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.io.IOException;

@RestController
@RequestMapping("/index")
public class ScrapingController {

    @Autowired
    private ScrapingService scrapingService;

    @GetMapping("/content")
    public ResponseEntity<String> getFullContentWithoutHeader() throws IOException {
        String content = scrapingService.getFullContent();
        return ResponseEntity.ok(content);
    }
}
