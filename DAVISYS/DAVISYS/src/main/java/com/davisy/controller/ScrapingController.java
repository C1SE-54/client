package com.davisy.controller;

import com.davisy.service.ScrapingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.io.IOException;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping("/index")
public class ScrapingController {

    @Autowired
    private ScrapingService scrapingService;

    // Để lấy từng nội dung từ các URL riêng biệt
    @GetMapping("/caytrong")
    public ResponseEntity<String> getCayTrongContent() throws IOException {
        String content = scrapingService.getContentForUrl(scrapingService.URL);
        return ResponseEntity.ok(content);
    }

    @GetMapping("/thietbinongnghiep")
    public ResponseEntity<String> getThietBiNongNghiepContent() throws IOException {
        String content = scrapingService.getContentForUrl(scrapingService.URL1);
        return ResponseEntity.ok(content);
    }

    @GetMapping("/saubenh")
    public ResponseEntity<String> getSaoBenhContent() throws IOException {
        String content = scrapingService.getContentForUrl(scrapingService.URL2);
        return ResponseEntity.ok(content);
    }

    @GetMapping("/kinhnghiemvameo")
    public ResponseEntity<String> getKinhNghiemVaMeoContent() throws IOException {
        String content = scrapingService.getContentForUrl(scrapingService.URL3);
        return ResponseEntity.ok(content);
    }

    // Để lấy tất cả nội dung song song từ các URL
    @GetMapping("/allContent")
    public ResponseEntity<String> getAllContent() throws InterruptedException, ExecutionException {
        String content = scrapingService.getAllContent();
        return ResponseEntity.ok(content);
    }
}
