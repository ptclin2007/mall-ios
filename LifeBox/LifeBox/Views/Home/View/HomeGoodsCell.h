//
//  HomeGoodsCell.h
//  LifeBox
//
//  Created by Lucky on 2019/8/27.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeProductdata.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeGoodsCell : UITableViewCell

#pragma mark - 属性
///商品图片
@property (strong, nonatomic) UIImageView *goodsImg;

///商品名称
@property (strong, nonatomic) UILabel *goodsLab;

///商品描述
@property (strong, nonatomic) UILabel *goodsTitle;

///商品价格
@property (strong, nonatomic) UILabel *goodsMoney;

///商品原价格
@property (strong, nonatomic) UILabel *original;

///添加购物车Btn
@property (strong, nonatomic) UIButton *addBtn;

#pragma mark - 刷新UI
///刷新首页推荐商品UI
- (void)reloadHomeGoodsCellUIWith:(HomeProductdata *)cellData;

@end

NS_ASSUME_NONNULL_END
