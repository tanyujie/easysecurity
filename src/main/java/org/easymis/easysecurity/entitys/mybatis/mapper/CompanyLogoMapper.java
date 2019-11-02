package org.easymis.easysecurity.entitys.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.easymis.easysecurity.entitys.mybatis.dto.CompanyLogo;

@Mapper
public interface CompanyLogoMapper {
	CompanyLogo findById(@Param("id") String id);
}
