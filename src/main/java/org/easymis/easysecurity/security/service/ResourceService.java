package org.easymis.easysecurity.security.service;

import org.easymis.easysecurity.security.userdetail.Resource;

public interface ResourceService {
	Resource  getOne(String requestURI);
	Resource findByEndPoint(String endPoint);
}
