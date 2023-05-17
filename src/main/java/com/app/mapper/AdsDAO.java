package com.app.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.app.entity.*;

import org.apache.ibatis.annotations.Mapper;
/**
 * 存放数据访问层的接口或抽象类，定义与数据库的交互接口方法，由具体的实现类进行实现。通常使用MyBatis等框架实现。
 *
 * */
@Mapper
public interface AdsDAO {
    public List<Ads> getAdsPager(@Param("skip") int skip,@Param("size") int size);
    public  Ads getAdsById(int id);   
    public int getAdsCount();   
    public int insert(Ads entity);   
    public int delete(int id);   
    public int update(Ads entity);
	public List<Ads> getAllAds();
}
