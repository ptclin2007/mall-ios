//
//  NetWorkRequest+Goods.h
//  LifeBox
//
//  Created by admin on 2019/8/17.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "NetWorkRequest.h"

NS_ASSUME_NONNULL_BEGIN

@interface NetWorkRequest (Goods)

#pragma mark - 获取商品详情
/**
 * 获取商品详情
 */
-(void)productproductInfo:(NSInteger)productid block:(NREndBlock)endblock;

#pragma mark - 添加商品到购物车
/**
 * /cart/add post
 * 添加商品到购物车
 */
-(void)addCar:(NSString*)productId skuId:(NSString*)skuId block:(NREndBlock)endblock;

#pragma mark - 获取商品评价列表
/**
 * /product/commentlist
 * 获取商品评价列表
 */
-(void)commentlist:(NSString*)productId pageSize:(NSInteger)pageSize pageNum:(NSInteger)pageNum block:(NREndBlock)endblock;

#pragma mark - 商品添加收藏
/// 商品添加收藏
/// @param productId 商品ID
/// @param endblock 请求结束回调
-(void)addCollectionWithWithProductId:(NSString *)productId endBlock:(NREndBlock)endblock;

#pragma mark - 商品取消收藏
/// 商品取消收藏
/// @param memberId 会员ID
/// @param productId 商品ID
/// @param endblock 请求回调
-(void)cancelCollectionWithMemberId:(NSString *)memberId productId:(NSString *)productId endBlock:(NREndBlock)endblock;

#pragma mark - 根据用户ID获取关注列表
/// 根据用户ID获取关注列表
/// @param memberId 会员ID
/// @param endblock 请求回调
-(void)getCommentlistWithMemberId:(NSString *)memberId endBlock:(NREndBlock)endblock;

#pragma mark - 获取不同状态订单接口
/// 获取订单数据接口
/// @param state 订单状态
/// @param pageSize 一页个数
/// @param pageNum 页数
/// @param endblock 请求回调
-(void)getOrderStateListWithState:(NSString *)state pageSize:(NSString *)pageSize pageNum:(NSString *)pageNum endBlock:(NREndBlock)endblock;

#pragma mark - 获取订单数据接口
/// 获取订单数据接口
/// @param orderId 订单ID
/// @param endblock 请求回调
-(void)getOrderDetailsWithID:(NSString *)orderId endBlock:(NREndBlock)endblock;

#pragma mark - 根据父id获取品牌列表
/// @param parentID 分类父id
/// @param endblock 请求回调

-(void)categoryWithID:(NSString *)parentID endBlock:(NREndBlock)endblock;

#pragma mark - 综合搜索、筛选、排序
/**
 keyword 关键字
 brandId 品牌id
 productCategoryId 分类id
 pageNum 页码
 pageSize 分页大小
 sort 排序 排序字段:0->按相关度；1->按新品；2->按销量；3->价格从低到高；4->价格从高到低
 */

-(void)productsearch:(NSString *)keyword
             brandId:(NSString *)brandId
   productCategoryId:(NSString *)productCategoryId
                sort:(NSString *)sort
            pageSize:(NSString *)pageSize
             pageNum:(NSString *)pageNum
            endBlock:(NREndBlock)endblock;

@end

NS_ASSUME_NONNULL_END
