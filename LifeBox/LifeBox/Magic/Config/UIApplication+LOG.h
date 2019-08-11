//
//  UIApplication+LOG.h
//  LifeBox
//
//  Created by admin on 2019/8/11.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CocoaLumberjack/CocoaLumberjack.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (LOG)

/**
 * 配置日志
 */
-(void)configlog;
@end

NS_ASSUME_NONNULL_END
