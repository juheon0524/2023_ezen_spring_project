package com.ezen.controller;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml" ,
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class ReturnRequestControllerTest {

	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	@Test
	public void testList() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/return/returnList")
				.param("pageNum", "2")
				.param("amount", "10"))
		.andExpect(MockMvcResultMatchers.status().isOk())
        .andExpect(MockMvcResultMatchers.view().name("return/returnList"));
	}	
	
	@Test
	public void testRegisterForm() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/return/returnRegister"))
			.andExpect(MockMvcResultMatchers.status().isOk())
			.andExpect(MockMvcResultMatchers.view().name("return/returnRegister"));
	}
	
	@Test
	public void testRegister() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.post("/return/returnRegister")
                .contentType(MediaType.APPLICATION_FORM_URLENCODED)
                .param("returnProperty1", "value1")  // 필요한 파라미터를 추가
                .param("returnProperty2", "value2"))
                .andExpect(MockMvcResultMatchers.status().is3xxRedirection())
                .andExpect(MockMvcResultMatchers.redirectedUrl("/return/returnList"));
	}
	
	
	@Test
	public void testRemove() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.post("/return/returnRemove")
                .param("returnrequestid", "123"))
                .andExpect(MockMvcResultMatchers.status().is3xxRedirection())
                .andExpect(MockMvcResultMatchers.redirectedUrl("/return/returnList?pageNum=1&amount=10"));
	}

}
