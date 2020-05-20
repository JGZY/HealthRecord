package com.ahtcm.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class Resident {
    private Long id;

    private String residentName;

    //账户名
    private String residentAccount;

    @JsonFormat(pattern = "yyyy-MM-dd",timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date residentBirth;

    //男为0，女为1
    private Boolean residentGender;

    private String residentHeight;

    private String residentWeight;

    private String residentPhone;

    //所在社区
    private Community residentCommunity;

    //户籍位置
    private String residentHouse;

    //职业
    private String residentWork;

    //审核状态
    private Boolean residentApplyState;

    //密码
    private String residentPassword;
}