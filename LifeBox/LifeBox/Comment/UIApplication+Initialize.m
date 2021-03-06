//
//  UIApplication+Initialize.m
//  LifeBox
//
//  Created by Lucky on 2019/8/3.
//  Copyright © 2019 Lucky. All rights reserved.
//

#import "UIApplication+Initialize.h"
#import "MyTabBarController.h"
#import "LoginViewController.h"

@implementation UIApplication (Initialize)

#pragma mark - 创建主界面
+ (void)markWindownRootVC {
    UIWindow *awindow = [[UIApplication sharedApplication] keyWindow];
    if(!awindow){
        awindow = [[[UIApplication sharedApplication] windows] objectAtIndex:0];
    }
    SuperNavigationController *mainVC = [[SuperNavigationController alloc] initWithRootViewController:[[MyTabBarController alloc] init]];
    awindow.rootViewController = mainVC;
}

#pragma mark - 去登录界面
+ (void)gotoLoginCtl {
    
    LoginViewController *loginCtl = [[LoginViewController alloc] init];
    RTRootNavigationController *loginNav = [[RTRootNavigationController alloc] initWithRootViewController:loginCtl];
    loginNav.modalPresentationStyle = UIModalPresentationFullScreen;
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:loginNav animated:YES completion:nil];
}

@end
