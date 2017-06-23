//
//  SysSubViewController.m
//  UIKit-set
//
//  Created by Cyfuer on 16/6/13.
//  Copyright © 2016年 Cyfuer. All rights reserved.
//

#import "SysSubViewController.h"

@interface SysSubViewController ()

@end

@implementation SysSubViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    switch (self.type) {
            
        case 1://原生返回按钮的控制
        {
            [self.navigationItem setHidesBackButton:YES animated:YES];
            self.title = @"fdajskjsakfjakjsdjfkajfaklsjfafjaksfjdaldjsfksajfkafd";
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.navigationItem setHidesBackButton:NO animated:YES];
            });
        }
            break;
        case 2:// 自定义左侧按钮
        {
            [self setLeftNavBarItemWithTitle:@"返回" action:@selector(back)];
            
            [self setBackButton];
        }
            break;
        case 3:// 自定义左侧视图
        {
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 64)];
            view.backgroundColor = [UIColor orangeColor];
            
            [self setLeftNavBarItemWithView:view];
            
            [self setBackButton];
        }
            break;
        case 4:// 自定义多个左侧视图
        {
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
            view.backgroundColor = [UIColor cyanColor];
            
            UIView *view0 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
            view0.backgroundColor = [UIColor purpleColor];
            
            UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
            view1.backgroundColor = [UIColor orangeColor];
            
            [self setLeftNavBarItemsWithViews:@[view,view0,view1]];
            
            [self setBackButton];
        }
            break;
        case 5:// 自定义titleview
        {
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
            view.backgroundColor = [UIColor redColor];
            
            [self setNavBarTitleViewWithView:view];
            
            [self setBackButton];
        }
            break;
            
        case 6:// 自定义右侧按钮
        {
            [self setRightNavBarItemWithTitle:@"右侧" action:@selector(back)];
        }
            break;
            
        case 7:// 自定义右侧视图
        {
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 20)];
            view.backgroundColor = [UIColor cyanColor];
            
            [self setRightNavBarItemWithView:view];
            
            [self setBackButton];
        }
            break;
            
        case 8:// 自定义多个右侧视图
        {
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
            view.backgroundColor = [UIColor cyanColor];
            
            UIView *view0 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
            view0.backgroundColor = [UIColor brownColor];
            
            UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
            view1.backgroundColor = [UIColor greenColor];
            
            [self setRightNavBarItemsWithViews:@[view,view0,view1]];
            
            self.navigationItem.prompt = @"dfashdaia";
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.navigationItem.prompt = nil;
            });
            
            [self setBackButton];
        }
            break;
            
        case 9://prompt
        {
            self.navigationItem.prompt = @"dfashdaia";
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.navigationItem.prompt = nil;
            });
            self.title = @"prompt";
        }
            break;
        case 10://重复自定义左侧按钮
        {
            [self setLeftNavBarItemWithTitle:@"aaaaa" action:@selector(back)];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self setLeftNavBarItemWithTitle:@"bbbbbb" action:@selector(back)];
            });
        }
            break;
        case 11://自定义左侧图片按钮
        {
            [self setLeftNavBarItemWithImage:[UIImage imageNamed:@"closeButton"] action:@selector(back)];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self setLeftNavBarItemWithImage:[UIImage imageNamed:@"goodsDetail_fanhui"] action:@selector(back)];
            });
        }
            break;
        case 12://导航栏显示隐藏的控制
        {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [self.navigationController setNavigationBarHidden:YES animated:YES];
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self.navigationController setNavigationBarHidden:NO animated:YES];
                });
            });
        }
            break;
        case 13://导航栏背景色
        {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.navigationController.navigationBar.translucent = YES;
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    self.navigationController.navigationBar.translucent = NO;
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        self.navigationController.navigationBar.barTintColor = [UIColor redColor];
                        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                            self.navigationController.navigationBar.barTintColor = [UIColor greenColor];
                        });
                    });
                });
            });
        }
            break;
        case 14://不隐藏默认返回按钮时添加自定义左侧按钮
        {
            UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                               initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                               target:nil action:nil];
            negativeSpacer.width = 0;
            
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
            button.backgroundColor = [UIColor clearColor];
            
            UIBarButtonItem *barItem = [[UIBarButtonItem alloc]initWithCustomView:button];
            
            [self.navigationItem setLeftBarButtonItems:@[negativeSpacer,barItem] animated:YES];
        }
            break;
            
        case 15:// 进入第一层自定义视图
        {
            [self setLeftNavBarItemWithTitle:@"aaaaa" action:@selector(back)];
            
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
            [button setTitle:@"返回" forState:UIControlStateNormal];
            [button addTarget:self action:@selector(goSecondVC) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:button];
        }
            break;
            
        case 16://自定义左侧按钮在自定义左侧视图列表
        {
            [self setRightNavBarItemWithTitle:@"back" action:@selector(back)];
            
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
                view.backgroundColor = [UIColor cyanColor];
                
                UIView *view0 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
                view0.backgroundColor = [UIColor cyanColor];
                
                UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
                view1.backgroundColor = [UIColor cyanColor];
                
                [self setRightNavBarItemsWithViews:@[view,view0,view1]];
                
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [self setRightNavBarItemWithTitle:@"back" action:@selector(back)];
                });
            });
        }
            break;
        case 150:// 进入第二层自定义视图
        {
            [self setRightNavBarItemWithTitle:@"bbbbbb" action:@selector(back)];
        }
            break;
            
        default:
            break;
    }
}

#pragma mark - Private

- (void)setBackButton {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)goSecondVC {
    SysSubViewController *vc = [SysSubViewController new];
    vc.type = 150;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
