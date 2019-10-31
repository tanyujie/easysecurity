package org.easymis.easysecurity.controller;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;

@Api(description = "企业信息相关接口测试")
@RequestMapping("/company")
@RestController
public class CompanyBaseInfoController {

	
	@ApiImplicitParams({
			@ApiImplicitParam(name = "companyId", value = "公司id", dataType = "int", required = true)
	})
	@GetMapping("/info")
	public Long allInfo(@NotNull @Min(1) Long companyId) {
		return companyId;
		
	}
	
}
