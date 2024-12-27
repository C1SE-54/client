package com.davisy.service;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.stereotype.Service;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import java.util.List;
import java.io.IOException;
import java.util.concurrent.*;

@Service
public class ScrapingService {

    public static final String URL = "https://vnexpress.net/tag/trong-trot-87274";
    public static final String URL1 = "https://vnexpress.net/tag/nong-nghiep-cong-nghe-cao-470954";
    public static final String URL2 = "https://vnexpress.net/tag/sau-benh-759198";
    public static final String URL3 = "https://vnexpress.net/tag/kinh-nghiem-trong-trot-738558";

    // Phương thức lấy nội dung từ URL cho trước
    public String getContentForUrl(String url) throws IOException {
        // Setup WebDriver
        System.setProperty("webdriver.chrome.driver", "C:\\webdriver\\chromedriver.exe");
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--headless");
        options.addArguments("--disable-gpu");
        options.addArguments("--no-sandbox");
        options.addArguments("--disable-javascript"); // Tắt JavaScript nếu không cần thiết

        WebDriver driver = new ChromeDriver(options);

        try {
            driver.get(url);  // Truy cập vào trang
            String newFaviconUrl = "http://localhost:8080/large.png";  // URL hợp lệ của favicon
            ((JavascriptExecutor) driver).executeScript(
                    "var link = document.querySelector('link[rel=\"icon\"]');" +
                            "if (link) {" +
                            "  link.href = '" + newFaviconUrl + "';" +
                            "} else {" +
                            "  var link = document.createElement('link');" +
                            "  link.rel = 'icon';" +
                            "  link.href = '" + newFaviconUrl + "';" +
                            "  document.head.appendChild(link);" +
                            "}"
            );

            String pageSource = driver.getPageSource();

            Document document = Jsoup.parse(pageSource);
            document.select("header").remove();  // Loại bỏ các phần tử không cần thiết
            document.select("nav").remove();
            document.select("footer").remove();

            return document.html();
        } finally {
            driver.quit();
        }
    }

    // Sử dụng Jsoup nếu không cần Selenium
    public String getContentForUrlWithJsoup(String url) throws IOException {
        Document document = Jsoup.connect(url).get();
        // Tiến hành xử lý nội dung nếu cần
        return document.html();
    }

    // Phương thức để lấy nhiều nội dung song song với đa luồng
    public String getAllContent() throws InterruptedException, ExecutionException {
        ExecutorService executor = Executors.newFixedThreadPool(4); // Sử dụng 4 tiến trình

        // Gửi các nhiệm vụ cào dữ liệu song song
        List<Callable<String>> tasks = List.of(
                () -> getContentForUrl(URL),
                () -> getContentForUrl(URL1),
                () -> getContentForUrl(URL2),
                () -> getContentForUrl(URL3)
        );

        List<Future<String>> results = executor.invokeAll(tasks);
        StringBuilder allContent = new StringBuilder();

        // Lấy kết quả từ các tiến trình
        for (Future<String> result : results) {
            allContent.append(result.get()).append("\n");
        }

        executor.shutdown();
        return allContent.toString();
    }
}
