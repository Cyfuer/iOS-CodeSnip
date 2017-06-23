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

@interface UIButton_m ()

@end

@implementation UIButton_m

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UIButton";
    self.array = @[
                   @"原生UIButton",
                   @"倒计时按钮",
                   @"图标两行字按钮"
                   ];
}

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *index = self.array[indexPath.row];
    
    if ([index isEqualToString:@"原生UIButton"]) {
        UIButtonVC *vc = [[UIButtonVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
        
    } else if ([index isEqualToString:@"倒计时按钮"]) {
        VertifyCodeButtonVC *vc = [[VertifyCodeButtonVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    } else if ([index isEqualToString:@"图标两行字按钮"]) {
        LogoButtonVC *vc = [[LogoButtonVC alloc] init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

@end
