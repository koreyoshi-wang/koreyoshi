/**
 * 
 */
package com.hpe.service;

import java.util.List;
import java.util.Map;

import com.hpe.entity.Request;

/**
 * @author wanfangg
 */

public interface RequestService extends BaseService{

	/**
	 * @return
	 */
	List<Request> getAllRequest();

	/**
	 * @param searchKey
	 * @param iDisplayStart
	 * @param iDisplayLength
	 * @return
	 */
	Map<String, Object> getRequestPaging(String searchKey, int iDisplayStart, int iDisplayLength);
	
}
