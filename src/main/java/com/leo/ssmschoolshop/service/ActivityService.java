package com.leo.ssmschoolshop.service;


import com.leo.ssmschoolshop.entity.Activity;
import com.leo.ssmschoolshop.entity.ActivityExample;

import java.util.List;

public interface ActivityService {
    List<Activity> getAllActivity(ActivityExample activityExample);

    void insertActivitySelective(Activity activity);

    Activity selectByKey(Integer activityid);

    void deleteByActivityId(Integer activityid);

//    void updateGoodsActSelective(Goods goods);
}
