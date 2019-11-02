package org.easymis.easysecurity.entitys.mybatis.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.easymis.easysecurity.entitys.mybatis.dto.CompanyCategoryCode;

@Mapper
public interface CompanyCategoryCodeMapper {
	CompanyCategoryCode findById(@Param("id") String id);
}
