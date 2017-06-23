//
//  UIButton_m.m
//  UIKit-set
//
//  Created by apple on 16/7/15.
//  Copyright © 2016年 Cyfuer. All rights reserved.
//

#import "UIButton_m.h"

#import "UIButtonVC.h"
#import "VertifyCodeButtonVC.h"
#import "LogoButtonVC.h"
#import "TableItem.h"

@interface UIButton_m ()

@end

@implementation UIButton_m

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UIButton";
    self.array = @[
                   instanceItem(@"原生UIButton", nil, [UIButtonVC class]),
                   instanceItem(@"倒计时按钮", nil, [VertifyCodeButtonVC class]),
                   instanceItem(@"图标两行字按钮", nil, [LogoButtonVC class]),
                   ];
}

@end
