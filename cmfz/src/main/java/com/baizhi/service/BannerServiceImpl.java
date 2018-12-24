package com.baizhi.service;

import com.baizhi.entity.Banner;
import com.baizhi.mapper.BannerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
@Service
@Transactional
public class BannerServiceImpl implements BannerService {
    @Autowired
    BannerMapper bannerMapper;
    @Override
    public List<Banner> queryAll() {
        List<Banner> banners = bannerMapper.selectAll();
        return banners;
    }
    public void insertBanner(Banner banner){
        bannerMapper.insert(banner);
    }
    public void deleteBanner(Integer id){
        bannerMapper.deleteByPrimaryKey(id);
    }
    public void updateBanner(Banner banner){
        bannerMapper.updateByPrimaryKey(banner);
    }
}
