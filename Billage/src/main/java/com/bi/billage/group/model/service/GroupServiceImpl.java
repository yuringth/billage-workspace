package com.bi.billage.group.model.service;

import org.springframework.stereotype.Service;

import com.bi.billage.group.model.dao.GroupDao;
import com.bi.billage.group.model.vo.Group;

@Service
public class GroupServiceImpl implements GroupService {

	private GroupDao groupDao;
	
	@Override
	public int insertGroup(Group group) {
		
	
		return 0;
	}

	
}
