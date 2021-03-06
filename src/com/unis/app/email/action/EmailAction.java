package com.unis.app.email.action;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.xwork.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.unis.core.service.AbsServiceAdapter;
import com.unis.core.util.Globals;
import com.unis.app.email.model.Email;

@Controller
@Scope(value="prototype")
public class EmailAction {

	private Email email;

	@Autowired
	private AbsServiceAdapter<Integer> emailService = null;
	
	public String emailSave(Map sqlParamMap, HttpServletRequest request){
		
		if(sqlParamMap.get("n_xh") != null && !"".equals(sqlParamMap.get("n_xh")) ){
			
			String jsrStr = (String) sqlParamMap.get("c_jsr");
			String csrStr = (String) sqlParamMap.get("c_csr");
			String msrStr = (String) sqlParamMap.get("c_msr");
			if("1".equals(sqlParamMap.get("c_zt"))){ //发送
				
				
				List<Email> list = new ArrayList<Email>();
				if(StringUtils.isNotEmpty(jsrStr)){
					String[] jsrs = jsrStr.split(";");
					for(String jsr : jsrs){
						Email em = new Email();
						em.setC_yhid(jsr);
						em.setC_lx("1");
						list.add(em);
					}
					//sqlParamMap.put("c_jsr", list);
				}
				if(StringUtils.isNotEmpty(csrStr)){
					String[] csrs = csrStr.split(";");
					for(String csr : csrs){
						Email em = new Email();
						em.setC_yhid(csr);
						em.setC_lx("2");
						list.add(em);
					}
					//sqlParamMap.put("c_jsr", list);
				}
				if(StringUtils.isNotEmpty(msrStr)){
					String[] msrs = msrStr.split(";");
					for(String msr : msrs){
						Email em = new Email();
						em.setC_yhid(msr);
						em.setC_lx("3");
						list.add(em);
					}
					//sqlParamMap.put("c_jsr", list);
				}
				sqlParamMap.put("list", list);
				emailService.insert("EmailMapper.updateEmail", sqlParamMap);
				
			} else { // 保存草稿箱
				
				emailService.insert("EmailMapper.updateEmailCg", sqlParamMap);
			}
			
		} else {
			
			HttpSession session = request.getSession();
			String c_yhid = session.getAttribute("userId")+"";
			String c_yhzid = session.getAttribute("cYhz")+"";
			
			sqlParamMap.put("c_yhid", c_yhid);
			sqlParamMap.put("c_yhzid", c_yhzid);
			
			String jsrStr = (String) sqlParamMap.get("c_jsr");
			String csrStr = (String) sqlParamMap.get("c_csr");
			String msrStr = (String) sqlParamMap.get("c_msr");
			
			if("1".equals(sqlParamMap.get("c_zt"))){  //发送
				
				List<Email> list = new ArrayList<Email>();
				if(StringUtils.isNotEmpty(jsrStr)){
					String[] jsrs = jsrStr.split(";");
					for(String jsr : jsrs){
						Email em = new Email();
						em.setC_yhid(jsr);
						em.setC_lx("1");
						list.add(em);
					}
					//sqlParamMap.put("c_jsr", list);
				}
				if(StringUtils.isNotEmpty(csrStr)){
					String[] csrs = csrStr.split(";");
					for(String csr : csrs){
						Email em = new Email();
						em.setC_yhid(csr);
						em.setC_lx("2");
						list.add(em);
					}
					//sqlParamMap.put("c_jsr", list);
				}
				if(StringUtils.isNotEmpty(msrStr)){
					String[] msrs = msrStr.split(";");
					for(String msr : msrs){
						Email em = new Email();
						em.setC_yhid(msr);
						em.setC_lx("3");
						list.add(em);
					}
					//sqlParamMap.put("c_jsr", list);
				}
				sqlParamMap.put("list", list);
				emailService.insert("EmailMapper.insertEmail", sqlParamMap);
				
			} else { // 保存草稿箱
				
				emailService.insert("EmailMapper.insertEmailCg", sqlParamMap);
			}
		}
		
		//emailService.insert("EmailMapper.insertEmailRecieve", sqlParamMap);
		
		/**
		if(StringUtils.isNotEmpty(sqlParamMap.get("n_xh"))){
			emailService.update("EmailMapper.updateEmail", sqlParamMap);
		} else {
			emailService.insert("EmailMapper.insertEmail", sqlParamMap);
		}
		**/
		return Globals.SUCCESS;
	}
	
	public String emailOperate(String value, String n_xh){
		Map<String, Object> sqlParamMap = new HashMap<String, Object>();
		//sqlParamMap.put("operateType", operateType);
		sqlParamMap.put("value", value);
		sqlParamMap.put("n_xh", n_xh);
	    emailService.update("EmailMapper.operateEmail", sqlParamMap);
		return Globals.SUCCESS;
	}
	
	public String emailRecieveOperator(String value, String n_xh, HttpServletRequest request){
		
		HttpSession session = request.getSession();
		String c_yhid = session.getAttribute("userId")+"";
		Map<String, Object> sqlParamMap = new HashMap<String, Object>();
		//sqlParamMap.put("operateType", operateType);
		
		sqlParamMap.put("c_zt", value);
		sqlParamMap.put("n_xh", n_xh);
		sqlParamMap.put("c_yhid", c_yhid);
	    emailService.update("EmailMapper.operateRecieveEmail", sqlParamMap);
		return Globals.SUCCESS;
	}
	
	public String emailRecieveOperate(String value, String n_xh, HttpServletRequest request){
		HttpSession session = request.getSession();
		String c_yhid = session.getAttribute("userId")+"";
		
		Map<String, Object> sqlParamMap = new HashMap<String, Object>();
		sqlParamMap.put("value", value);
		sqlParamMap.put("c_yhid", c_yhid);
		sqlParamMap.put("n_xh", n_xh);
		emailService.update("EmailMapper.operateRecieveEmail", sqlParamMap);
		return Globals.SUCCESS;
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> emailList(String c_zt, HttpServletRequest request){
		HttpSession session = request.getSession();
		String c_yhid = session.getAttribute("userId")+"";
		
		Map<String, Object> sqlParamMap = new HashMap<String, Object>();
		sqlParamMap.put("c_zt", c_zt);
		sqlParamMap.put("c_yhid", c_yhid);
		Map<String, Object> resMap = new HashMap<String, Object>();
		List<Email> emailList = (List<Email>) emailService.selectList("EmailMapper.getEmailList",sqlParamMap);
		resMap.put("Rows", emailList);
		resMap.put("Total", emailList.size());
		return resMap;
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getEmailQsqkList(String n_xh){
		Map<String, Object> resMap = new HashMap<String, Object>();
		List<Email> emailList = (List<Email>) emailService.selectList("EmailMapper.getEmailQsqkList",n_xh);
		resMap.put("Rows", emailList);
		resMap.put("Total", emailList.size());
		return resMap;
	}
	
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getEmailRecieveList(HttpServletRequest request){
		HttpSession session = request.getSession();
		String c_yhid = session.getAttribute("userId")+"";
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		List<Email> emailList = (List<Email>) emailService.selectList("EmailMapper.getEmailRecieveList",c_yhid);
		resMap.put("Rows", emailList);
		resMap.put("Total", emailList.size());
		return resMap;
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getEmailDeleteList(HttpServletRequest request){
		HttpSession session = request.getSession();
		String c_yhid = session.getAttribute("userId")+"";
		
		Map<String, Object> resMap = new HashMap<String, Object>();
		List<Email> emailList = (List<Email>) emailService.selectList("EmailMapper.getEmailDeleteList",c_yhid);
		resMap.put("Rows", emailList);
		resMap.put("Total", emailList.size());
		return resMap;
	}
	
	@SuppressWarnings("unchecked")
	public Map<String, Object> getEmailNoReadList(HttpServletRequest request){
		HttpSession session = request.getSession();
		String c_yhid = session.getAttribute("userId")+"";
		Map<String, Object> resMap = new HashMap<String, Object>();
		List<Email> emailList = (List<Email>) emailService.selectList("EmailMapper.getEmailNoReadList",c_yhid);
		resMap.put("Rows", emailList);
		resMap.put("Total", emailList.size());
		return resMap;
	}
	
	public String emailUpdate(){
		email = (Email) emailService.selectOne("EmailMapper.getEmail", email);
		return Globals.SUCCESS;
	}
	
	
	public String emailView(){
		email = (Email) emailService.selectOne("EmailMapper.viewEmail", email);
		return Globals.SUCCESS;
	}
	
	public String emailDelete(String n_xh){
		
		emailService.update("EmailMapper.deleteEmail", n_xh);
		return Globals.SUCCESS;
	}
	
	public String emailQuery(){
		
		email = (Email) emailService.selectOne("EmailMapper.getEmail", email);
		return Globals.SUCCESS;
	}
	
	public Email getEmail() {
		return email;
	}

	public void setEmail(Email email) {
		this.email = email;
	}

	public AbsServiceAdapter<Integer> getEmailService() {
		return emailService;
	}

	public void setEmailService(AbsServiceAdapter<Integer> emailService) {
		this.emailService = emailService;
	}

	
}
