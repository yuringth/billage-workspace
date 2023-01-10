package com.bi.billage.group.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.group.model.dao.GroupDao;
import com.bi.billage.group.model.vo.Group;

@Service
public class GroupServiceImpl implements GroupService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private GroupDao groupDao;
	
	@Override
	public int selectListCount() {
		return groupDao.selectListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Group> selectList(PageInfo pi) {
		return groupDao.selectList(sqlSession, pi);
	}
		
	@Override
	public int insertGroup(Group group) {
		return groupDao.insertGroup(sqlSession, group);
	}





	
}
