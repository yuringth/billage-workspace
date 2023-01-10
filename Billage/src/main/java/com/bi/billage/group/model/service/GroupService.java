package com.bi.billage.group.model.service;

import java.util.ArrayList;

import com.bi.billage.common.model.vo.PageInfo;
import com.bi.billage.group.model.vo.Group;

public interface GroupService {
	
	int selectListCount();
	
	ArrayList<Group> selectList(PageInfo pi);
	
	int insertGroup(Group group);
}
