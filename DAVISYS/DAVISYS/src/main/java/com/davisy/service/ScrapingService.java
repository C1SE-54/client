package com.davisy.service;

import io.github.bonigarcia.wdm.WebDriverManager;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.JavascriptExecutor;
import org.springframework.stereotype.Service;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

import java.io.IOException;
import java.util.List;

@Service
public class ScrapingService {

    private static final String URL = "https://vnexpress.net/tag/trong-trot-87274";
    private static final String URL1 = "https://vnexpress.net/tag/nong-nghiep-cong-nghe-cao-470954";

    // Phương thức loại bỏ phần tham số sau dấu "?" trong URL
    private String getUrlWithoutQuery(String url) {
        if (url != null && url.contains("?")) {
            String cleanedUrl = url.split("\\?")[0]; // Loại bỏ phần tham số query
            System.out.println("Original URL: " + url);  // In ra URL gốc
            System.out.println("Cleaned URL: " + cleanedUrl);  // In ra URL đã loại bỏ tham số query
            return cleanedUrl;
        }
        // Trả về URL gốc nếu không có tham số query
        return url;
    }

    public String getFullContent() throws IOException {
        // Setup WebDriver
        System.setProperty("webdriver.chrome.driver", "C:\\webdriver\\chromedriver.exe");
        ChromeOptions options = new ChromeOptions();
        options.addArguments("--headless");
        options.addArguments("--disable-gpu");
        options.addArguments("--no-sandbox");

        WebDriver driver = new ChromeDriver(options);

        try {
            driver.get(URL);  // Truy cập vào trang

            String pageSource = driver.getPageSource();

            Document document = Jsoup.parse(pageSource);

            // Loại bỏ các phần tử không cần thiết (như header)
            document.select("header").remove();

            // Tìm tất cả các liên kết và loại bỏ tham số query
            List<WebElement> links = driver.findElements(By.tagName("a"));
            JavascriptExecutor js = (JavascriptExecutor) driver;

            // Duyệt qua các liên kết và loại bỏ tham số query
            for (WebElement link : links) {
                String linkHref = link.getAttribute("href");
                if (linkHref != null && !linkHref.isEmpty()) {
                    // Loại bỏ tham số query
                    String cleanLink = getUrlWithoutQuery(linkHref);
                    // Thay đổi thuộc tính href bằng JavaScript
                    js.executeScript("arguments[0].setAttribute('href', arguments[1])", link, cleanLink);
                }
            }

            // Tiến hành xử lý CSS nếu cần
            List<WebElement> cssLinks = driver.findElements(By.tagName("link"));
            for (WebElement cssLink : cssLinks) {
                if (cssLink.getAttribute("rel").equals("stylesheet")) {
                    String cssUrl = cssLink.getAttribute("href");
                    String cssContent = getCssContent(cssUrl);
                    Element styleTag = document.head().appendElement("style");
                    styleTag.text(cssContent);
                }
            }

            return document.html();
        } finally {
            driver.quit();
        }
    }

    private String getCssContent(String cssUrl) throws IOException {
        return Jsoup.connect(cssUrl).ignoreContentType(true).execute().body();
    }
}
