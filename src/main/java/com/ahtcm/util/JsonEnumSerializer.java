package com.ahtcm.util;

import com.ahtcm.ajaxResponse.AjaxRes;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * 自定义枚举序列化规则，继承JsonSerializer类并重写serialize方法
 *
 * */
public class JsonEnumSerializer extends JsonSerializer<AjaxRes>{

    @Override
    public void serialize(AjaxRes value, JsonGenerator gen, SerializerProvider serializers) throws IOException {
        try {
            //类的全限定名
            String name = value.getClass().getName();
            //类的code值
            Object code = value.code();
            String message = value.msg();
            boolean success = value.success();
            //这里也不用反射了,性能不好,所以直接new一个map再做序列化
            Map<String, Object> jsonMap = new HashMap<>();
            jsonMap.put("code", code);
            jsonMap.put("msg", message);
            jsonMap.put("success",success);
            serializers.defaultSerializeValue(jsonMap, gen);
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}
