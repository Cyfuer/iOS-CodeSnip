//
//  SysNavigationController.m
//  UIKit-set
//
//  Created by Cyfuer on 16/6/12.
//  Copyright © 2016年 Cyfuer. All rights reserved.
//

#import "SysNavigationController.h"

@interface SysNavigationController () <UIGestureRecognizerDelegate,UINavigationControllerDelegate>

@end

@implementation SysNavigationController

+ (void)initialize {
    //uinavigationBAr  appearance:全局,设置全局背景
    UINavigationBar *bar = [UINavigationBar appearance];
    
    //设置背景
    [bar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
    
    //设置标题文字属性
    NSMutableDictionary *barAttrs = [NSMutableDictionary dictionary];
    barAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    [bar setTitleTextAttributes:barAttrs];
    
    //UIbarbuttonitem
    UIBarButtonItem *item = [UIBarButtonItem appearance];
    
    //UIControlStateNomal
    NSMutableDictionary *nomalAttrs = [NSMutableDictionary dictionary];
    nomalAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    nomalAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    [item setTitleTextAttributes:nomalAttrs forState:UIControlStateNormal];
    
    //UIcontrolDisabled
    NSMutableDictionary *disabledAttrs = [NSMutableDictionary dictionary];
    disabledAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    [item setTitleTextAttributes:disabledAttrs forState:UIControlStateDisabled];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    self.interactivePopGestureRecognizer.delegate = self;
}

/**
 拦截所有push进来的子控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    // push过程中触发手势滑动返回，会导致导航栏崩溃（从日志中可以看出）。针对这个问题，我们需要在pop过程禁用手势滑动返回功能
        if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
        self.interactivePopGestureRecognizer.enabled = NO;

    // 隐藏底部的工具条
    if (self.childViewControllers.count>= 1) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    // super的push方法一定要写到最后面
    // 一旦调用super的pushViewController方法,就会创建子控制器viewController的view
    // 也就会调用viewController的viewDidLoad方法
    [super pushViewController:viewController animated:animated];
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    //如果当前显示的是第一个子控制器就禁止使用[返回按钮]
    return self.childViewControllers.count > 1;
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animate {
    // 跳转过程中禁用了手势返回的功能，所以跳转完成后要重新启用手势返回功能
    if ([self respondsToSelector:@selector(interactivePopGestureRecognizer)])
        self.interactivePopGestureRecognizer.enabled = YES;
}


@end
