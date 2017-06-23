//
//  SysTabbarController.m
//  UIKit-set
//
//  Created by Cyfuer on 16/6/8.
//  Copyright © 2016年 Cyfuer. All rights reserved.
//

#import "SysTabbarController.h"

#import "SysTabbar.h"

#import "SysTabbarViewController.h"

@interface SysTabbarController ()

@end

@implementation SysTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupBar];
    
    [self setupItem];
    
    [self setupChildrenViewController];
    
    [self setupTabbar];
}

#pragma mark - Private
- (void)setupBar {
    
    self.tabBar.barTintColor = [UIColor purpleColor];
}

- (void)setupItem {
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
}

- (void)setupChildrenViewController {
    [self setChildVc:[SysTabbarViewController new] title:@"xie" image:@"home" selecImage:@"home_s"];
    [self setChildVc:[SysTabbarViewController new] title:@"xie" image:@"home" selecImage:@"home_s"];
    [self setChildVc:[SysTabbarViewController new] title:@"xie" image:@"home" selecImage:@"home_s"];
    [self setChildVc:[SysTabbarViewController new] title:@"xie" image:@"home" selecImage:@"home_s"];
}

- (void)setChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString*)image selecImage:(NSString*)selecImage
{
    //创建个导航控制器
    UINavigationController *nav = [[UINavigationController  alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
    
    //设置子控制器tabbaritem
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];// 必须调用imageWithRenderingMode方法，不然图标的颜色会被默认的蓝色覆盖
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:selecImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
}

- (void)setupTabbar {
    [self setValue:[[SysTabbar alloc] init] forKey:@"tabBar"];// 注意大小写
}

@end
