//
//  UIMenuController_m.m
//  UIKit-set
//
//  Created by Cyfuer on 16/6/28.
//  Copyright © 2016年 Cyfuer. All rights reserved.
//

#import "UIMenuController_m.h"
#import "UImenuControllerVC.h"

@interface UIMenuController_m ()

@end

@implementation UIMenuController_m

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UImenuController";
    self.array = @[
                   @"原生UImenuController"
                   ];
}

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *index = self.array[indexPath.row];
    
    if ([index isEqualToString:@"原生UImenuController"]) {
        [self.navigationController pushViewController:[UImenuControllerVC new] animated:YES];
    }
}

@end
