package com.davisy.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
//import org.springframework.boot.web.servlet.error.ErrorController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ErrorControllerHandle implements ErrorController {
	@Autowired
	private HttpServletRequest request;
	
	@RequestMapping("/error")
	public String handleError() {
		Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
		System.out.println(status);
		if (status != null) {
			Integer statuscode = Integer.valueOf(status.toString());
			if (statuscode == HttpStatus.NOT_FOUND.value()) {
				return "error404";
			}
			if (statuscode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
				return "error500";
			}
		}
		return "error404";
	}
}
