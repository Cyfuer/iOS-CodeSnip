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

@interface UITabbar_m ()

@end

@implementation UITabbar_m

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UITabbar";
    self.array = @[
                   @"原生Tabbar的封装及Tabbar视图定制",
                   ];
}

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *index = self.array[indexPath.row];
    
    if ([index isEqualToString:@"原生Tabbar的封装及Tabbar视图定制"]) {
        [self.navigationController pushViewController:[SysTabbarController new] animated:YES];
    }
}

@end
