package com.avengers.common.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Repository;

import com.avengers.common.dao.CommonDao;
import com.avengers.db.dto.AdminVO;
import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.PrfsVO;
import com.avengers.db.dto.SecurityVO;
import com.avengers.db.dto.StudVO;

@Repository
public class CommonDaoImpl implements CommonDao{

	@Autowired
	protected SqlSession sqlSession;
	@Autowired
	protected JavaMailSender javaMailSender;

	@Override
	public int loginConfirm(String id, String pw)throws SQLException {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ArrayList<BoardVO> selectBoard(String bc_num, int firstRow,
			int endRow) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String selectId(String subject, String text, String from, String to,
			String name) throws SQLException {
		MimeMessage message = javaMailSender.createMimeMessage();
		try {
            // org.springframework.mail.javamail.MimeMessageHelper
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setSubject(subject);
            helper.setText(text, true);
            helper.setFrom(from);
            helper.setTo(to);
            
            	
            javaMailSender.send(message);
            return "성공";
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return "실패";
    }

	@Override
	public String selectPw(String subject, String text, String from, String to,
			String id,String pwd,String role) throws SQLException {
		MimeMessage message = javaMailSender.createMimeMessage();
		try {
            // org.springframework.mail.javamail.MimeMessageHelper
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");
            helper.setSubject(subject);
            helper.setText(text, true);
            helper.setFrom(from);
            helper.setTo(to);           
            
            javaMailSender.send(message);
			if (role.equals("admin")) {
				AdminVO adminVO = new AdminVO();
				adminVO.setAdmin_email(to);
				adminVO.setAdmin_id(id);
				adminVO.setAdmin_pw(pwd);
				sqlSession.update("admin.updatePwd", adminVO);
			} else if (role.equals("student")) {
				StudVO studVO = new StudVO();
				studVO.setStud_email(to);
				studVO.setStud_num(id);
				studVO.setStud_pw(pwd);
				sqlSession.update("student.updatePwd", studVO);
			} else if (role.equals("professor")) {
				PrfsVO prfsVO = new PrfsVO();
				prfsVO.setPrfs_email(to);
				prfsVO.setPrfs_num(id);
				prfsVO.setPrfs_pw(pwd);
				sqlSession.update("prfs.updatePwd", prfsVO);
			}
			SecurityVO securityVO = new SecurityVO();
			securityVO.setId(id);
			securityVO.setPwd(pwd);
			sqlSession.update("security.updatePwd", securityVO);
			
            return "성공";
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return null;
    }

	@Override
	public AdminVO findInfo(AdminVO adminVO) {
		AdminVO admin = (AdminVO)sqlSession.selectOne("admin.findInfo",adminVO);
		StudVO student = (StudVO)sqlSession.selectOne("student.findInfo",adminVO);
		PrfsVO prfs = (PrfsVO)sqlSession.selectOne("prfs.findInfo",adminVO);
		
		AdminVO info = new AdminVO();
		if(admin!=null){
			info=admin;
		}else if(student!=null){
			info.setAdmin_id(student.getStud_num());
		}else if(prfs!=null){
			info.setAdmin_id(prfs.getPrfs_num());
		}else{
			info=null;
		}
		
		return info;
	}

	@Override
	public String findRole(AdminVO adminVO) {
		AdminVO admin = (AdminVO)sqlSession.selectOne("admin.findInfo",adminVO);
		StudVO student = (StudVO)sqlSession.selectOne("student.findInfo",adminVO);
		PrfsVO prfs = (PrfsVO)sqlSession.selectOne("prfs.findInfo",adminVO);
		
		String info = null;
		if(admin!=null){
			info="admin";
		}else if(student!=null){
			info="student";
		}else if(prfs!=null){
			info="professor";
		}else{
			info=null;
		}
		return info;
	}

	



}
