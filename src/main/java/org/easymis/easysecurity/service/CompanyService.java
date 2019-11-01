package org.easymis.easysecurity.service;

import org.easymis.easysecurity.entitys.mybatis.dto.Company;

public interface CompanyService {
	public Company getById(String companyId);
}
