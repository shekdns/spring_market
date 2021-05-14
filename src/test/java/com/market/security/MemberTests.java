package com.market.security;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
		"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class MemberTests {

	@Autowired
	private PasswordEncoder pwencoder;

	@Autowired
	private DataSource ds;

	@Test
	public void testInsertMember() {

		String sql = "insert into member(userid, userpw, username, email, phone1, phone2, phone3, zipcode, point, auth) "
				 + "values (?,?,?,?,?,?,?,?,?,?)";

		Connection con = null;
		PreparedStatement pstmt = null;

		try {
			con = ds.getConnection();
			pstmt = con.prepareStatement(sql);

			pstmt.setString(2, pwencoder.encode("pw"));
			pstmt.setString(1, "test");
			pstmt.setString(3, "테스트유저");
			pstmt.setString(4, "test@google.com");
			pstmt.setString(5, "010");
			pstmt.setString(6, "1234");
			pstmt.setString(7, "5678");
			pstmt.setString(8, "12345");
			pstmt.setInt(9, 10000);
			pstmt.setString(10, "ROLE_USER");				
			pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (Exception e) {
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
				}
			}

		}
		
		
//		for (int i = 0; i < 3; i++) {
//
//			Connection con = null;
//			PreparedStatement pstmt = null;
//
//			try {
//				con = ds.getConnection();
//				pstmt = con.prepareStatement(sql);
//
//				pstmt.setString(2, pwencoder.encode("pw" + i));
//				
//				pstmt.setString(1, "admin" + i);
//				pstmt.setString(3, "테스트" + i);
//				pstmt.setString(4, "ROLE_ADMIN");				
//				pstmt.executeUpdate();
//
//			} catch (Exception e) {
//				e.printStackTrace();
//			} finally {
//				if (pstmt != null) {
//					try {
//						pstmt.close();
//					} catch (Exception e) {
//					}
//				}
//				if (con != null) {
//					try {
//						con.close();
//					} catch (Exception e) {
//					}
//				}
//
//			}
//		}
	}



}
