package org.easymis.easysecurity.service;

import java.util.List;

import org.easymis.easysecurity.entitys.mybatis.vo.CompanyInvestorVo;

public interface CompanyInvestorService {
	List findByList(CompanyInvestorVo vo);
}
