//
//  SysBaseViewController.h
//  UIKit-set
//
//  Created by Cyfuer on 16/6/13.
//  Copyright © 2016年 Cyfuer. All rights reserved.
//

#import "BaseVC.h"

@interface SysBaseViewController : BaseVC

/*
 *
 * 这些方法放在基类，其子类就都可以直接调用这些api了
 * 设置标题直接调用原生的self.title设置即可
 * 移植步骤：
 1.将.h文件中的方法声明拷贝到基类.h文件
 2.将.m文件顶部的常量拷贝到基类.m文件顶部
 3.在 viewDidLoad 中添加 [self setupTitle]; 设置标题属性
 3.将.m文件中的方法实现拷贝到基类.m文件
 */

// 隐藏导航栏
- (void)hideNav;

// 显示导航栏
- (void)showNav;

// 设置自定义的返回按钮
- (void)setBackBtn;


// 左侧：通过名称自定义单个按钮
- (UIButton *)setLeftNavBarItemWithTitle:(NSString *)title action:(SEL)action;

// 左侧：通过图片自定义单个按钮
- (UIButton *)setLeftNavBarItemWithImage:(UIImage *)image action:(SEL)action;

// 左侧：通过自定义视图定义单个按钮
- (UIView *)setLeftNavBarItemWithView:(UIView *)view;

// 左侧：通过自定义视图数组定义多个按钮
- (NSArray *)setLeftNavBarItemsWithViews:(NSArray *)views;


// 右侧：通过名称自定义单个按钮
- (UIButton *)setRightNavBarItemWithTitle:(NSString *)title action:(SEL)action;

// 右侧：通过图片自定义单个按钮
- (UIButton *)setRightNavBarItemWithImage:(UIImage *)image action:(SEL)action;

// 右侧：通过自定义视图定义单个按钮
- (UIView *)setRightNavBarItemWithView:(UIView *)view;

// 右侧：通过自定义视图数组定义多个按钮
- (NSArray *)setRightNavBarItemsWithViews:(NSArray *)views;


// 中间：自定义titleView
- (UIView *)setNavBarTitleViewWithView:(UIView *)view;


@end
