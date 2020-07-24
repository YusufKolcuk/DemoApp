package com.xperta.quartz.jobs;

import org.quartz.CronScheduleBuilder;
import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;

public class WeatherQuartzRun {
	public static void main(String[] args) {
        try {
            JobDetail job = JobBuilder.newJob(WeatherDataCall.class).withIdentity("weatherJob", "group").build();
            Trigger triggerw = TriggerBuilder.newTrigger().withIdentity("cronTrigger", "group")
                    .withSchedule(CronScheduleBuilder.cronSchedule("0/5 * * * * ?")).build();
            Scheduler scheduler = new StdSchedulerFactory().getScheduler();
            scheduler.start(); 
            scheduler.scheduleJob(job, triggerw); 
            }
        catch(Exception e){ 
            e.printStackTrace();
        }
    }
}

