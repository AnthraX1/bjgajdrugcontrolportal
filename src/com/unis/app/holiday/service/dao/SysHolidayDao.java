package com.unis.app.holiday.service.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.unis.app.pagination.Pagination;
import com.unis.core.service.AbsServiceAdapter;

@Repository
public class SysHolidayDao  extends SqlSessionDaoSupport {
	
	public Object saveInfo(Map p){
		return  getSqlSession().insert("SysHolidayMapper.saveInfo", p);
	}

	public Object saveAllInfo(Map p){
		return  getSqlSession().insert("SysHolidayMapper.saveAllInfo", p);
	}
	
	public Object saveGRInfo(Map p){
		return  getSqlSession().insert("SysHolidayMapper.saveGRInfo", p);
	}
	
	public Object removeGRInfo(Map p){
		return  getSqlSession().insert("SysHolidayMapper.removeGRInfo", p);
	}

	public Object removeInfo(Map p){
		return  getSqlSession().delete("SysHolidayMapper.removeInfo", p);
	}

	public Object updateInfo(Map p){
		return  getSqlSession().update("SysHolidayMapper.updateInfo", p);
	}

	public Object updateAllInfo(Map p){
		return  getSqlSession().update("SysHolidayMapper.updateAllInfo", p);
	}

	public List queryAllInfo(Map p){
		return  getSqlSession().selectList("SysHolidayMapper.queryAllInfo", p);
	}
	
	public List queryInfo(Map p){
		return  getSqlSession().selectList("SysHolidayMapper.queryInfo", p);
	}

	public Object queryCountInfo(Map p) {
		return  getSqlSession().selectOne("SysHolidayMapper.queryCountInfo", p);
	}
	
	

	public Map queryByPageInfo(Map p, Map page){
		String count = String.valueOf((Integer)queryCountInfo(p));
		if("0".equals(count)){
			return null;
		}else{ 
			page.put("recordCount", count);
			Pagination pagination = new Pagination(page);
			page.put("pageCount", pagination.getPageCount());
			p.put("startIndex", pagination.getStartIndex());
			p.put("lastIndex", pagination.getLastIndex());
			List list = queryInfo(p);
			Map retMap = new HashMap();
			retMap.put("data", list);
			retMap.put("page", page);
			return retMap;
		}
	}

}