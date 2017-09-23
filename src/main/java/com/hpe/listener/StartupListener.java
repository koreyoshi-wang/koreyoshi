package com.hpe.listener;

import java.io.IOException;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.hpe.util.GlobalConfigHolder;


public class StartupListener implements ServletContextListener
{
    private static final Logger logger = LoggerFactory.getLogger(StartupListener.class);
    
    public void contextDestroyed(ServletContextEvent event)
    {
    }
    
    public void contextInitialized(ServletContextEvent event)
    {
        logger.info("系统初始化中....");
        try
        {
            initSys();
        }
        catch (Exception e)
        {
            logger.error("启动触发器出错！");
            e.printStackTrace();
        }
        logger.info("系统初始化完成.");
    }
    
    private void initSys() throws IOException
    {
        // 加载配置文件sys.properties
        GlobalConfigHolder.init();
        
    }
}
