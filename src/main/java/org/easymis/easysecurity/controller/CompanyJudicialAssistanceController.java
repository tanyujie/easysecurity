package org.easymis.easysecurity.controller;

import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;

@Api(description = "司法协助")
@RequestMapping("companyJudicialAssistance")
@RestController
@Validated
public class CompanyJudicialAssistanceController {

}
