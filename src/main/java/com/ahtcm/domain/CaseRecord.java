package com.ahtcm.domain;

import lombok.Data;

import java.util.Date;

/**
 * 病历记录
 */
@Data
public class CaseRecord {
    private Long id;

    private Resident resident;   //居民

    private Date createTime; //时间

    private String hospital;  //医院

    private String dept;  //科室

    private String code;  //病历号

    private String complain; //主诉

    private String history;  //病史

    private String diagnose; //诊断

    private Consultant consultant; //医师

    private String view; //意见

    private String status;//初诊、复诊状态

}