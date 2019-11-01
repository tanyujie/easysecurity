package org.easymis.easysecurity.service;

import org.easymis.easysecurity.entitys.mybatis.dto.CompanyCategoryCode;

public interface CompanyCategoryCodeService {
	CompanyCategoryCode findByCategoryCode(String categoryCode);
}
