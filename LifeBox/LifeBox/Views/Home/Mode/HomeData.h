//
//  HomeData.h
//  LifeBox
//
//  Created by Lucky on 2019/11/4.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeData : NSObject

///首页功能数组
@property (strong, nonatomic) NSArray *toolArr;

///首页公告数组
@property (strong, nonatomic) NSArray *notiArr;

///首页轮播数组
@property (strong, nonatomic) NSArray *bannerArr;

@end

#pragma mark - 首页功能Data
@interface HomeToolData : NSObject

///首页功能图片
@property (strong, nonatomic) NSString *logo;

///首页功能名称
@property (strong, nonatomic) NSString *name;

@end

#pragma mark - 首页轮播Data
@interface HomeBannerData : NSObject

///首页轮播地址
@property (strong, nonatomic) NSString *pic;

@end

#pragma mark - 首页通知Data
@interface HomeNotiData : NSObject

///通知内容
@property (strong, nonatomic) NSString *title;

@end

NS_ASSUME_NONNULL_END
