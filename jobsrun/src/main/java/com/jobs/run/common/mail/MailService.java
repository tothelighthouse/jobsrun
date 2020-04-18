package com.jobs.run.common.mail;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.jobs.run.member.controller.MemberController;



@Service
public class MailService {
	private static final Logger logger = LoggerFactory.getLogger(MailService.class);
	@Inject
	private JavaMailSender mailSender;
	@Inject
	private SimpleMailMessage preConfiguredMessage;

	@Async
	public void sendMail(String to, String subject, String body) {
		MimeMessage message = mailSender.createMimeMessage();
		logger.info("sendMail실행됨");
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setSubject(subject);
			//messageHelper.setBcc(bcc); //참조추가
			messageHelper.setTo(to);
			messageHelper.setFrom("jobsrun1234@gmail.com", "관리자");
			messageHelper.setText(body, true);
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Async
	public void sendPreConfiguredMail(String message) {
		SimpleMailMessage mailMessage = new SimpleMailMessage(preConfiguredMessage);
		mailMessage.setText(message);
		mailSender.send(mailMessage);
	}
}
