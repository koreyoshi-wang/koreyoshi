/**
 * 
 */
package com.hpe.service;

import java.util.List;

/**
 * @author wanfangg
 */

public interface BaseService {
	public Object getById(Class<?> c, String id);
	public List<Object> getAll(Class<?> c);
	public void save(Object object);
	public void update(Object object);
	public void delete(Object object);
}
