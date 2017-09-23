/**
 * 
 */
package com.hpe.service.impl;

import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import com.hpe.entity.Request;
import com.hpe.service.RequestService;

/**
 * @author wanfangg
 */
@Transactional
@Service("requestService")
public class RequestServiceImpl extends BaseServiceImpl implements RequestService {

	@Override
	@SuppressWarnings("unchecked")
	public List<Request> getAllRequest(){
		List<Request> list = getSession().createSQLQuery("select * from requestresource as rr where 1=1").addEntity(Request.class).list();
		BigInteger count = (BigInteger) getSession()
				.createSQLQuery("select count(*) from requestresource as rr where 1=1").uniqueResult();
		System.out.println(count.intValue());
		return list;
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> getRequestPaging(String searchKey, int iDisplayStart, int iDisplayLength){
		Map<String,Object> retMap = new HashMap<String, Object>();
		StringBuffer sql = new StringBuffer();
		sql.append("select * from requestresource as rr where 1=1");
		if (null != searchKey && !StringUtils.isEmpty(searchKey)){
			addQueryCriteria(searchKey, sql);
		}
		BigInteger count = (BigInteger) getSession()
				.createSQLQuery(sql.toString().replace("*", "count(*)"))
				.uniqueResult();
		sql.append(" order by requestDate DESC ");
		List<Request> resultList = getSession()
		.createSQLQuery(sql.toString())
		.addEntity(Request.class)
		.setFirstResult(iDisplayStart)
		.setMaxResults(iDisplayLength)
		.list();
		retMap.put("total", count.intValue());
		retMap.put("resultList", resultList);
		return retMap;
	}
	
	public void addQueryCriteria(String searchKey, StringBuffer sql){
		sql.append(" and ( ");
		sql.append("rr.jobTitle like '%").append(searchKey).append("%' ");
		sql.append("or rr.account like '%").append(searchKey).append("%' ");
		sql.append("or rr.primaryLocation like '%").append(searchKey).append("%' ");
		sql.append("or rr.resourceLevel like '%").append(searchKey).append("%' ");
		sql.append("or rr.projectName like '%").append(searchKey).append("%' ");
		sql.append("or rr.jobDescription like '%").append(searchKey).append("%' ");
		sql.append(" ) ");
	}
	
}
