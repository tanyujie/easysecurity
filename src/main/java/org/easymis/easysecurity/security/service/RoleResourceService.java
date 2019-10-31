package org.easymis.easysecurity.security.service;

import java.util.List;

import org.easymis.easysecurity.security.userdetail.RoleResource;

/**
 * <p>
 * 服务类
 * </p>
 *
 * @@author zh
 * @since 2019-09-05
 */
public interface RoleResourceService {
	List<RoleResource> list(String resourceId);
	List<RoleResource> findByResourceId(String resourceId);
}
