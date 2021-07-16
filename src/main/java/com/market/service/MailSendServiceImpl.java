package com.market.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.market.domain.MemberVO;
import com.market.mapper.MemberMapper;


@Service
public class MailSendServiceImpl implements MailSendService{

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private SqlSessionTemplate userSqlSession;
	
	@Autowired
	private MemberMapper mapper;
	
	@Autowired
	private PasswordEncoder pwencoder;
	
	private boolean lowerCheck;
	private int size;
	
	//인증코드 랜덤
	@Override
	public String init() {
		// TODO Auto-generated method stub
		Random ran = new Random();
		StringBuffer sb = new StringBuffer();
		int num = 0;
		
		do {
			num = ran.nextInt(75) + 48;
			if ((num >= 48 && num <= 57) || (num >= 65 && num <= 90) || (num >= 97 && num <= 122)) {
				sb.append((char) num);
			} else {
				continue;
			}

		} while (sb.length() < size);
		if (lowerCheck) {
			return sb.toString().toLowerCase();
		}
		return sb.toString();
	}
	//인증키
	@Override
	public String getKey(boolean lowerCheck, int size) {
		// TODO Auto-generated method stub
		this.lowerCheck = lowerCheck;
		this.size = size;
		return init();
	}

	@Override
	public void mailSendWithRegister(String e_mail, String userid, HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		mapper = userSqlSession.getMapper(MemberMapper.class);
		
		MemberVO member = mapper.read(userid);
		String name = member.getUserid();
		
		MimeMessage mail = mailSender.createMimeMessage();
		
		String htmlStr = "<h2>안녕하세요 '"+ name +"' 님</h2><br><br>" 
				+ "<p>회원가입을 진심으로 축하드립니다~.</p>"
				+ "<p>신규 회원가입  감사쿠폰이 지급되었습니다~.</p>"
				+ "<h3><a href='http://localhost:8080/front/index'>SpringMarket 홈페이지 접속 ^0^</a></h3><br><br>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		try {
			mail.setSubject("회원가입을 축하드립니다~", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(e_mail));
			mailSender.send(mail);
		} catch (MessagingException e) { 
			e.printStackTrace();
		}
		

		
		
	}
	
	//임시 비밀번호 보내기
	@Override
	public void mailSendWithPass(String userid, String email, HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		String new_pass = getKey(false, 6);
		mapper = userSqlSession.getMapper(MemberMapper.class);
		
		//UserVO user = mapper.read(id);
		
		MemberVO user = mapper.pw_userInfo(userid);
		String name = user.getUserid();
		
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 '"+ name +"' 님</h2><br><br>" 
				+ "<p>비밀번호 찾기를 신청해주셔서 임시 비밀번호를 발급해드렸습니다.</p>"
				+ "<p>임시로 발급 드린 비밀번호는 <h2 style='color : blue'>'" + new_pass +"'</h2>이며 로그인 후 마이페이지에서 비밀번호를 변경해주시면 됩니다.</p><br>"
				+ "<h3><a href='http://localhost:8080/front/index'>SpringMarket 홈페이지 접속 ^0^</a></h3><br><br>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		try {
			mail.setSubject("[MS :p] 임시 비밀번호가 발급되었습니다", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail);
		} catch (MessagingException e) { 
			e.printStackTrace();
		}
		
		new_pass = pwencoder.encode(new_pass);
		
		mapper.searchPassword(userid, email, new_pass);
	}
	//아이디 보내기
	@Override
	public void mailSendWithId(String username, String email, HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		mapper = userSqlSession.getMapper(MemberMapper.class);
		MemberVO user_name = mapper.id_userInfo(username);
		String getName = user_name.getUsername();
		String id = mapper.searchId(username, email);
		
		MimeMessage mail = mailSender.createMimeMessage();
		String htmlStr = "<h2>안녕하세요 '"+ getName +"' 님</h2><br><br>" 
				+ "<p>찾으시려는 아이디를 메일로 보내드렸습니다~.</p>"
				+ "<p>찾으시려는 아이디는 <h2 style='color : blue'>'" + id +"'</h2>이며 잊어버리지 마세요~</p><br>"
				+ "<h3><a href='http://localhost:8080/front/index'>SpringMarket 홈페이지 접속 ^0^</a></h3><br><br>"
				+ "(혹시 잘못 전달된 메일이라면 이 이메일을 무시하셔도 됩니다)";
		try {
			mail.setSubject("[MS :p] 찾으시는 아이디 입니다~", "utf-8");
			mail.setText(htmlStr, "utf-8", "html");
			mail.addRecipient(RecipientType.TO, new InternetAddress(email));
			mailSender.send(mail);
		} catch (MessagingException e) { 
			e.printStackTrace();
		}
		
		
	}

}
