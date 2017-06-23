//
//  UINavigationBar_m.m
//  UIKit-set
//
//  Created by Cyfuer on 16/6/12.
//  Copyright © 2016年 Cyfuer. All rights reserved.
//

#import "UINavigationBar_m.h"

#import "SysNavigationController.h"
#import "SysViewControlle.h"

@interface UINavigationBar_m ()

@end

@implementation UINavigationBar_m
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UITabbar";
    
    self.array = @[
              @"原生UINavigationController的封装",
              ];
}

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *index = self.array[indexPath.row];
    
    if ([index isEqualToString:@"原生UINavigationController的封装"]) {
        SysViewControlle *vc = [[SysViewControlle alloc] init];
        SysNavigationController *nav = [[SysNavigationController alloc] initWithRootViewController:vc];
        nav.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        [self presentViewController:nav animated:YES completion:nil];
    }
}

@end
