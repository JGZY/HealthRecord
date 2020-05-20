package com.ahtcm.domain;

import lombok.Data;

@Data
public class HealthRecord {
    private Long id;

    private String name;

    private String account;

    private Community community; //社区

    private Boolean highBlood; //高血压

    private Boolean covid;     //新冠病毒

    private String familyIllness; //家族遗传病

    private String bloodType;  //血型

    private String colorBlind; //色盲

    private String bloodSugar; //血糖

    private Boolean whiteBlood; //白血病

    private String vaccin;  //疫苗状况

    private String remark; //备注

}