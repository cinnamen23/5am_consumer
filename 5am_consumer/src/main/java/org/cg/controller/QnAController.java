package org.cg.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/qna")
public class QnAController {
	
	private final static Logger logger = Logger.getLogger(QnAController.class);

	@GetMapping("/list")
	public void qnaGet(){
		
		
	}
}
