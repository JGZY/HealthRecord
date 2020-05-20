package com.ahtcm.domain;

import lombok.Data;

import java.util.ArrayList;
import java.util.List;

@Data
public class Menu {
    private Long id;

    private String text;

    private String url;

    private Menu parent;

    private List<Menu> children = new ArrayList<>();

    private Permission permission;
}