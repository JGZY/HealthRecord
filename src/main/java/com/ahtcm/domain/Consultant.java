package com.ahtcm.domain;

import lombok.Data;

@Data
public class Consultant {
    private Long id;

    private String consultantName;

    private String consultantAccount;

    private Integer consultantAge;

    private String consultantPhone;

    //男为0，女为1
    private Boolean consultantGender;

    private Community community;

    private String consultantPassword;

}