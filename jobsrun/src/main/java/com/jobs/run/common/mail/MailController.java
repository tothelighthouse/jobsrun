package com.jobs.run.common.mail;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.jobs.run.common.PasswordGenerator;
import com.jobs.run.member.vo.MemberVO;

@Controller
@EnableAsync
public class MailController {
	@Inject
	private MailService mailService;

	@GetMapping(value = "/sendMail")
	public void sendMail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		
		String to = ((MemberVO)request.getSession().getAttribute("member")).getId();
		
		
		PrintWriter out = response.getWriter();
		StringBuffer sb = new StringBuffer();
		sb.append("<html><body>");
		sb.append("<meta http-equiv='Content-Type' content='text/html; charset=euc-kr'>");
		sb.append("<h1>" + "이메일 인증메일입니다. 아래 링크를 클릭하세요" + "<h1><br>");
		sb.append("<a href='http://localhost:9080/run/member/emailcheck'>이메일 인증 확인</a>");
		sb.append("</body></html>");
		
		mailService.sendMail(to, "인증메일발송", sb.toString());
		out.print("메일을 발송하였습니다. 메일을 확인해주세요.!");
	}
	
	@GetMapping(value = "/sendSimpleMail")
	public void sendSimpleMail(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
    PrintWriter out = response.getWriter();	
		mailService.sendPreConfiguredMail("테스트 메일입니다");
		out.print("메일을 발송하였습니다.!!");
	}
}
