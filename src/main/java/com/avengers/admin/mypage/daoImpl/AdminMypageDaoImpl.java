package com.avengers.admin.mypage.daoImpl;

import java.util.ArrayList;

import com.avengers.admin.mypage.dao.AdminMypageDao;
import com.avengers.db.dto.AdminVO;
import com.avengers.db.dto.BoardVO;
import com.avengers.db.dto.PerschdVO;

public class AdminMypageDaoImpl implements AdminMypageDao {

	@Override
	public AdminVO selectAdmin() {
		return null;
	}

	@Override
	public int updateAdmin(AdminVO adminVO, String admin_id) {
		return 0;
	}

	@Override
	public ArrayList<PerschdVO> selectPerschdList(String perschd_psc) {
		return null;
	}

	@Override
	public PerschdVO selectPerschd(String perschd_num) {
		return null;
	}

	@Override
	public int insertPerschd(PerschdVO perschdVO, String perschd_psc) {
		return 0;
	}

	@Override
	public int updatePerschd(PerschdVO perschdVO, String perschd_num) {
		return 0;
	}

	@Override
	public int deletePerschd(String perschd_num) {
		return 0;
	}

	

}
