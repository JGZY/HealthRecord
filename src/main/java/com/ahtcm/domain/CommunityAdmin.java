package com.ahtcm.domain;

import lombok.Data;

@Data
public class CommunityAdmin {
    private Long id;

    private String name;

    private String account;

    private String phone;

    private Community community;

    private String password;
}