package com.sanley.coronavirus.dao;

import com.sanley.coronavirus.entity.CheckOut;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;

/**
 * @Author: bonbon
 * @Date: 2021/4/15 12:59
 */
@Mapper
public interface CheckOutDao {

    @Insert("insert into checkout(baseId,currentPosition,bodyTemperature,healthState,isToHighArea,isTouch,remarks,name,checkOutDate)values(#{baseId},#{currentPosition},#{bodyTemperature},#{healthState},#{isToHighArea},#{isTouch},#{remarks},#{name},#{checkOutDate})")
    void add(CheckOut checkOut);
}
