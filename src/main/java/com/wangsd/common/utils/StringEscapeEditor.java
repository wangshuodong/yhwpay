package com.wangsd.common.utils;

import org.springframework.web.util.HtmlUtils;

import java.beans.PropertyEditorSupport;

/**
 * 防止XSS攻击
 */
public class StringEscapeEditor extends PropertyEditorSupport {
    public StringEscapeEditor() {}

    @Override
    public String getAsText() {
        Object value = getValue();
        return value != null ? value.toString() : "";
    }

    @Override
    public void setAsText(String text) throws IllegalArgumentException {
        if (text == null) {
            setValue(null);
        } else {
            setValue(HtmlUtils.htmlEscape(text));
        }
    }

}
