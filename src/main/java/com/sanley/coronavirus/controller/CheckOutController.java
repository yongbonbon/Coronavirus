package com.sanley.coronavirus.controller;

import com.sanley.coronavirus.entity.CheckOut;
import com.sanley.coronavirus.entity.Touch;
import com.sanley.coronavirus.service.CheckOutService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.sql.Date;

/**
 * @Author: bonbon
 * @Date: 2021/4/15 15:48
 */
@Controller
public class CheckOutController {
    @Autowired
    CheckOutService checkOutService;

    //打卡
    @RequestMapping(value = "/checkOut/toAdd")
    public String toAdd() {
        return "checkOutAdd";
    }

    //添加密切
    @RequestMapping(value = "/checkOut/add", method = RequestMethod.POST)
    public String addCheckOut(@RequestParam("currentPosition") String currentPosition, @RequestParam("bodyTemperature") Double bodyTemperature,
                             @RequestParam("healthState") String healthState, @RequestParam("isToHighArea") String isToHighArea,
                             @RequestParam("isTouch") String isTouch, @RequestParam("remarks") String remarks,
                              @RequestParam("name") String name, @RequestParam("checkOutDate") Date checkOutDate) {
        CheckOut checkOut = new CheckOut().setCurrentPosition(currentPosition).setBodyTemperature(bodyTemperature)
                .setHealthState(healthState).setIsToHighArea(isToHighArea).setIsTouch(isTouch)
                .setRemarks(remarks).setName(name).setCheckOutDate(checkOutDate);
        checkOutService.add(checkOut);
        return "redirect:/indexpage";
    }
}
