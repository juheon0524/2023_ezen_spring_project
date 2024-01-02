package com.ezen.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.ezen.domain.Criterial;
import com.ezen.domain.ReturnRequestVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReturnRequestServiceImplTest {

	@Autowired
	ReturnRequestService returnRequestService;
	
	@Test
	public void testGetList() {
		returnRequestService.getList(new Criterial())
			.forEach(returnRequest->log.info(returnRequest));
	}
	
	
	@Test
    public void testGetListWithPaging() {
        // 페이징 정보 설정 (예: 1페이지, 페이지당 10개 아이템)
        Criterial cri = new Criterial();
        cri.setPageNum(2);
        cri.setAmount(10);

        // getListWithPaging 메서드 호출
        returnRequestService.getList(cri).forEach(returnRequest -> {
            // 결과 확인
            System.out.println(returnRequest);
        });
    }
	
	
	
	@Test
	public void testRegister() {
		ReturnRequestVO vo = ReturnRequestVO
				.builder()
//				.returnrequestid() uuid사용
				.rentallistid("531b2898-926d-11ee-b089-309c238259e1")
				.memberid("admin1")
				.isbn("9788917230567")
				.actualreturndate("2023-01-13")
				.build();
		returnRequestService.register(vo);
	}
	
	@Test
	public void testDelete() {
		boolean result = returnRequestService.remove("3eefb97b-931c-11ee-b089-309c238259e1");
		log.info("result >> " + result);
	}
	
	@Test
	public void testGetTotal() {
		Criterial cri = new Criterial();
		int total = returnRequestService.getTotal(cri);
		
		assertEquals(total, total);
		log.info("total >> " + total);
	}

}
