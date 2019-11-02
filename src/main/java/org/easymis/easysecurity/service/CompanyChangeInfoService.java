package org.easymis.easysecurity.service;

import org.easymis.easysecurity.entitys.mybatis.vo.CompanyChangeVo;

import com.github.pagehelper.Page;

public interface CompanyChangeInfoService {
	Page findByPage(CompanyChangeVo vo);
}
