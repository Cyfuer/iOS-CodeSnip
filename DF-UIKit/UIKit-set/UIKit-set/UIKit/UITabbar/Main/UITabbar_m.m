//
//  UITabbar_m.m
//  UIKit-set
//
//  Created by Cyfuer on 16/6/8.
//  Copyright © 2016年 Cyfuer. All rights reserved.
//

#import "UITabbar_m.h"

#import "AppDelegate.h"
#import "SysTabbarController.h"
#import "TableItem.h"

@interface UITabbar_m ()

@end

@implementation UITabbar_m

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UITabbar";
    self.array = @[
                   instanceItem(@"原生Tabbar的封装及Tabbar视图定制", nil, [SysTabbarController class]),
                   ];
}

@end
