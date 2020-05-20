package com.ahtcm.util;

import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;

public class BrowserEncodeSwitchUtil {

    public static String getContentDisposition(String fileName, HttpServletRequest request) throws UnsupportedEncodingException {
        String content_disposition = "";
        String userAgent = request.getHeader("User-Agent");
        if (userAgent.contains("Safari")) {
            byte[] bytes = fileName.getBytes("UTF-8");
            fileName = new String(bytes, "ISO-8859-1");
            content_disposition = String.format("attachment; filename=\"%s\"", fileName);
        } else {
            fileName = java.net.URLEncoder.encode(fileName, "UTF-8");
            content_disposition = "attachment;filename=" + fileName;
        }
        return content_disposition;
    }
}
