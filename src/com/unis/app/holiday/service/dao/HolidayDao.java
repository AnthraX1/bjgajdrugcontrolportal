package com.unis.app.holiday.service.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.unis.app.pagination.Pagination;
import com.unis.core.database.impl.DataSetProviderImpl;
import com.unis.core.service.AbsServiceAdapter;

@Repository
public class HolidayDao<T> extends AbsServiceAdapter<T> {
	
	public Object saveInfo(Map p){
		return  super.insert("HolidayMapper.saveInfo", p);
	}

	public Object saveAllInfo(Map p){
		return  super.insert("HolidayMapper.saveAllInfo", p);
	}
	
	public Object saveGRInfo(Map p){
		return  super.insert("HolidayMapper.saveGRInfo", p);
	}
	
	public Object removeGRInfo(Map p){
		return  super.insert("HolidayMapper.removeGRInfo", p);
	}

	public Object removeInfo(Map p){
		return  super.delete("HolidayMapper.removeInfo", p);
	}

	public Object updateInfo(Map p){
		return  super.update("HolidayMapper.updateInfo", p);
	}

	public Object updateAllInfo(Map p){
		return  super.update("HolidayMapper.updateAllInfo", p);
	}

	public List queryAllInfo(Map p){
		return  super.selectList("HolidayMapper.queryAllInfo", p);
	}
	
	public List queryInfo(Map p){
		return  super.selectList("HolidayMapper.queryInfo", p);
	}

	public Object queryCountInfo(Map p) {
		return  super.selectOne("HolidayMapper.queryCountInfo", p);
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