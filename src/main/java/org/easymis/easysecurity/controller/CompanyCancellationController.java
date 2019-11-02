package org.easymis.easysecurity.controller;

import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;

@Api(description = "企业注销与吊销信息")
@RequestMapping("company/cancellation")
@RestController
@Validated
public class CompanyCancellationController {

}
