package com.baizhi.service;

import com.baizhi.entity.Banner;

import java.util.List;

public interface BannerService {
    public List<Banner> queryAll();
    public void insertBanner(Banner banner);
    public void deleteBanner(Integer id);
    public void updateBanner(Banner banner);
}
