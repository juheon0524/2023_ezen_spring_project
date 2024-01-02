package com.ezen.mapper;

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
public class ReturnRequestMapperTest {

	@Autowired
	private ReturnRequestMapper returnRequestMapper;
	
	@Test
	public void testGetList() {
		returnRequestMapper.getList().forEach(returnRequest -> log.info(returnRequest));
	}
	
	
	@Test
    public void testGetListPage() {
        Criterial cri = new Criterial();
        cri.setPageNum(2); // 테스트하려는 페이지 번호 설정
        cri.setAmount(10); // 페이지 당 아이템 수 설정

        returnRequestMapper.getListWithPaging(cri).forEach(returnRequest -> log.info(returnRequest));
    }
	
	@Test
	public void testInsert() {
		
		ReturnRequestVO vo = ReturnRequestVO
				.builder()
//				.returnrequestid() uuid사용
				.rentallistid("4490eb99-926d-11ee-b089-309c238259e1")
				.memberid("admin1")
				.isbn("9788901248684")
				.actualreturndate("2023-01-13")
				.build();
		returnRequestMapper.insert(vo);
	}
	
	@Test
	public void testRead() {
		String uuidAsString = "4a8c49ee-9317-11ee-b089-309c238259e1";
		ReturnRequestVO vo = returnRequestMapper.read(uuidAsString);
		log.info("vo >>>> " + vo);
	}
	
	@Test
	public void testDelete() {
		String uuidAsString = "4a8c49ee-9317-11ee-b089-309c238259e1";
		returnRequestMapper.delete(uuidAsString);
	}

}
