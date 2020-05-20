package com.ahtcm.domain;

import lombok.Data;

@Data
public class User {
    private Long uid;

    private Long rid;

    private String account;

    private String password;

}