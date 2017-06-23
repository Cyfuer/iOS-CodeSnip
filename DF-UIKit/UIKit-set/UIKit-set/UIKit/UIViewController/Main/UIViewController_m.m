//
//  UIViewController_m.m
//  UIKit-set
//
//  Created by Cyfuer on 2017/6/23.
//  Copyright © 2017年 Cyfuer. All rights reserved.
//

#import "UIViewController_m.h"
#import "TableItem.h"
#import "UIViewControllerVC.h"
#import "TabViewControllerVC.h"
#import "UITabbarViewControllerVC.h"

@interface UIViewController_m ()

@end

@implementation UIViewController_m

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UIViewController";
    self.array = @[
                   instanceItem(@"原生UIViewController", nil, [UIViewControllerVC class]),
                   instanceItem(@"选项卡控制器", nil, [TabViewControllerVC class]),
                   instanceItem(@"原生UITabbarViewController", nil, [UITabbarViewControllerVC class]),
                   ];
}


@end
