//
//  UITabbarViewControllerVC.m
//  UIKit-set
//
//  Created by Cyfuer on 2017/6/23.
//  Copyright © 2017年 Cyfuer. All rights reserved.
//

#import "UITabbarViewControllerVC.h"
#import "BaseVC.h"

@interface UITabbarViewControllerVC ()

@end

@implementation UITabbarViewControllerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupBar];
    
    [self setupItem];
    
    [self setupChildrenViewController];
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
    
    BaseVC *vc0 = [[BaseVC alloc] init];
    
    BaseVC *vc1 = [[BaseVC alloc] init];
    
    BaseVC *vc2 = [[BaseVC alloc] init];
    
    [self setChildVc:vc0 title:@"vc0" image:@"home" selecImage:@"home_s"];
    [self setChildVc:vc1 title:@"vc1" image:@"home" selecImage:@"home_s"];
    [self setChildVc:vc2 title:@"vc2" image:@"home" selecImage:@"home_s"];
}

- (void)setChildVc:(UIViewController *)vc title:(NSString *)title image:(NSString*)image selecImage:(NSString*)selecImage
{
    //创建个导航控制器
    UINavigationController *nav = [[UINavigationController  alloc] initWithRootViewController:vc];
    nav.hidesBottomBarWhenPushed = YES;
    [self addChildViewController:nav];
    
    //设置子控制器tabbaritem
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];// 必须调用imageWithRenderingMode方法，不然图标的颜色会被默认的蓝色覆盖
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:selecImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
}

@end
