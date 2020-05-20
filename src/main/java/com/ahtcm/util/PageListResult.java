package com.ahtcm.util;

import lombok.Data;

import java.util.List;

@Data
public class PageListResult {

    private Long total;

    private List<?> rows;
}
