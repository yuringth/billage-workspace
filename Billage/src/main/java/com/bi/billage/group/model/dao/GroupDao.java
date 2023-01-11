package com.bi.billage.group.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.group.model.vo.Group;

@Repository
public class GroupDao {
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("groupMapper.selectListCount");
	}
	
	public ArrayList<Group> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("groupMapper.selectList", null, rowBounds);
	}
	
	
	public int insertGroup(SqlSessionTemplate sqlSession, Group group) {
		return sqlSession.insert("groupMapper.insertGroup", group);
	}
	
	
}
