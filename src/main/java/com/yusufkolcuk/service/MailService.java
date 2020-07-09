package com.yusufkolcuk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.yusufkolcuk.core.HomeController;


@Service
public class MailService {
	@Autowired
	private JavaMailSender mailSender;
	
	public void registerMail(String mail,String key){
		SimpleMailMessage email = new SimpleMailMessage();
		email.setFrom("yusufdemoapp@gmail.com");
		email.setTo(mail);
		email.setSubject("Complete your membership.");
		email.setText("Click on the link."+HomeController.url+"/reg/"+key);
		
		mailSender.send(email);
	}
	
	
	

}
