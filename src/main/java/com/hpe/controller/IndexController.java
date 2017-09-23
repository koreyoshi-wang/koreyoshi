/**
 * 
 */
package com.hpe.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.hpe.entity.Request;
import com.hpe.service.RequestService;

/**
 * @author wang
 */
@Controller
@RequestMapping(value = "/index")
public class IndexController {
	
	@Resource
	RequestService requestService;

	@RequestMapping
	public ModelAndView index(HttpServletRequest request,
			HttpServletResponse response) {
		Map<String, Object> map = new HashMap<String, Object>();
		ModelAndView modelAndView = new ModelAndView("index");
		map.put("contextPath", request.getContextPath());
		modelAndView.addAllObjects(map);
		return modelAndView;
	}
	
	@RequestMapping(value = "/list")
	@ResponseBody
	public String userPaging(HttpServletRequest request,
			HttpServletResponse response) {
		String sEcho = request.getParameter("draw");
        int iDisplayStart = Integer.parseInt(request.getParameter("start"));
        int iDisplayLength = Integer.parseInt(request.getParameter("length"));
		JSONObject json = new JSONObject();
		String searchKey = request.getParameter("searchKey");
        if (searchKey == null || StringUtils.isEmpty(searchKey)) {
        	searchKey = "";
        }
        Map<String, Object> resultMap = requestService.getRequestPaging(searchKey, iDisplayStart, iDisplayLength);
        json.put("data", resultMap.get("resultList"));
        json.put("sEcho", Integer.parseInt(sEcho));
        json.put("iTotalDisplayRecords", resultMap.get("total"));
        json.put("iTotalRecords", resultMap.get("total"));
		return json.toJSONString();
	}
	
	@RequestMapping(value = "/view")
	public ModelAndView viewRequest(HttpServletRequest request,
			HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView("viewModal");
		String id = request.getParameter("id");
		Request requestResource = (Request) requestService.getById(Request.class, id);
		modelAndView.addObject("currentRequest", requestResource);
		modelAndView.addObject("contextPath", request.getContextPath());
		return modelAndView;
	}
	
}
