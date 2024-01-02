package com.ezen.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezen.domain.Criterial;
import com.ezen.domain.PageDTO;
import com.ezen.domain.ReturnRequestVO;
import com.ezen.service.BookService;
import com.ezen.service.ReturnRequestService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/return/*")
@Log4j
@RequiredArgsConstructor
public class ReturnRequestController {
	
	private final ReturnRequestService returnRequestService;
	private final BookService bookService;
	
	@GetMapping({"/returnList", "/adminReturn"})
	public void list(Criterial cri, Model model) {
		log.info("Return List >> " + cri);
		
		model.addAttribute("list", returnRequestService.getList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, returnRequestService.getTotal(cri)));
	}
	
	@GetMapping("/returnRegister")
	@PreAuthorize("isAuthenticated()")
	public void register() {
		
	}
	
	@PostMapping("/returnRegister")
	@PreAuthorize("isAuthenticated()")
	public String register(ReturnRequestVO returnrequest, RedirectAttributes rttr) {
		log.info("Register Return : " + returnrequest);
		
		returnRequestService.register(returnrequest);
		rttr.addFlashAttribute("result",returnrequest.getReturnrequestid());
		
		return "redirect:/return/returnList";
	}
	
	
	@GetMapping({"/returnGet", "/returnModify"})
    public void get(@RequestParam("returnrequestid") String returnrequestid, @ModelAttribute("cri") Criterial cri, Model model) {
        log.info("/get or modify");

        model.addAttribute("return", returnRequestService.read(returnrequestid));
    }
	
	
	
	@PostMapping("/returnRemove")
	@PreAuthorize("principal.username == #returnrequest.memberid")
	public String remove(String returnrequestid, @ModelAttribute("cri") Criterial cri, RedirectAttributes rttr) {
		log.info("Remove Return : " + returnrequestid);
		
		if(returnRequestService.remove(returnrequestid)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
        rttr.addAttribute("amount", cri.getAmount());
        
		return "redirect:/return/returnList";
	}
	
	
	@PreAuthorize("principal.username == #return.memberid")
    @PostMapping("/returnModify")
    public String modify(ReturnRequestVO returnrequest, @ModelAttribute("cri") Criterial cri, RedirectAttributes rttr) {
        log.info("Modify Rental: " + returnrequest);

        if (returnRequestService.modify(returnrequest)) {
            rttr.addFlashAttribute("result", "success");
        }
        
        bookService.updateBookCountsReturn(returnrequest.getIsbn());

        rttr.addAttribute("pageNum", cri.getPageNum());
        rttr.addAttribute("amount", cri.getAmount());

        return "redirect:/return/returnList";
    }

}
