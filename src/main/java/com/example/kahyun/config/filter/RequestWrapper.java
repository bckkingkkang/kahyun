package com.example.kahyun.config.filter;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletRequestWrapper;

public final class RequestWrapper extends HttpServletRequestWrapper {

    public RequestWrapper(HttpServletRequest servletRequest) {
        super(servletRequest);
    }

    public String[] getParameterValues(String parameter) {
        String[] values = super.getParameterValues(parameter);
        if(values == null) {
            return null;
        }
        int count = values.length;
        String[] encodedValues = new String[count];
        for(int i = 0; i <count; i++) {
            encodedValues[i] = cleanXSS(values[i]);
        }
        return encodedValues;
    }

    private String cleanXSS(String value) {
        String returnVal = value;
        returnVal = returnVal.replaceAll("<", "&lt;").replaceAll(">", "&gt;");
        returnVal = returnVal.replaceAll("\\(", "&#40;").replaceAll("\\)", "&#41;");
        returnVal = returnVal.replaceAll("'", "&#39;");
        returnVal = returnVal.replaceAll("eval\\((.*)\\)", "");
        returnVal = returnVal.replaceAll("[\\\"\\\'][\\s]*javascript:(.*)[\\\"\\\']", "\"\"");
        returnVal = returnVal.replaceAll("script", "스크립트");
        returnVal = returnVal.replaceAll("iframe", "iframe대신");
        returnVal = returnVal.replaceAll("embed", "");
        return returnVal;
    }

    public String getParameter(String parameter) {
        String value = super.getParameter(parameter);
        if (value == null) {
            return null;
        }
        return cleanXSS(value);
    }

    public String getHeader(String name) {
        String value = super.getHeader(name);
        if(value==null) {
            return null;
        }
        return cleanXSS(value);
    }
}
