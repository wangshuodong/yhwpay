package com.wangsd.common.utils;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.core.io.support.PropertiesLoaderUtils;

import java.io.IOException;
import java.util.Properties;

public abstract class PropertiesUtils {

	private static final Logger logger = LogManager.getLogger(PropertiesUtils.class.getName());

	private static Properties props;

	static {
		try {
			props = new Properties();
			String location = "properties/jdbc.properties";
			Resource[] resources = new PathMatchingResourcePatternResolver().getResources(location);
			for (Resource resource : resources) {
				PropertiesLoaderUtils.fillProperties(props, resource);
			}
		} catch (IOException e) {
			logger.error("加载配置文件出错", e);
		}
	}

	public static String getProperty(String key) {
		return props.getProperty(key);
	}

}
