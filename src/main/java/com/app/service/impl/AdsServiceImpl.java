package com.app.service.impl;
import java.util.List;
import javax.annotation.Resource;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.app.entity.Ads;
import com.app.mapper.AdsDAO;
import com.app.service.AdsService;
/**
 * 定义一些接口和实现类
 * 存放业务逻辑层的实现类，主要作用是对控制器层和数据访问层之间进行中间件层的封装。
 * 这些业务逻辑类通常会调用一个或多个数据访问层的接口来完成具体的业务逻辑，以及与控制器层进行交互，组装返回给客户端的数据。
 * */
@Service
public class AdsServiceImpl implements AdsService{
	@Resource AdsDAO adsDao;
public List<Ads> getAdsPager(@Param("skip") int skip,@Param("size") int size){
return adsDao.getAdsPager(skip, size);
}
public  Ads getAdsById(int id){
return adsDao.getAdsById(id);
}
public int getAdsCount(){
return adsDao.getAdsCount();
}
public int insert(Ads entity){
return adsDao.insert(entity);
}
public int delete(int id){
return adsDao.delete(id);
}
public int update(Ads entity){
return adsDao.update(entity);
}
public List<Ads> getAllAds(){
return adsDao.getAllAds();
}

}
