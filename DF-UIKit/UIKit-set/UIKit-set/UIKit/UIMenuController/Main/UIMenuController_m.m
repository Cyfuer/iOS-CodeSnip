//
//  UIMenuController_m.m
//  UIKit-set
//
//  Created by Cyfuer on 16/6/28.
//  Copyright © 2016年 Cyfuer. All rights reserved.
//

#import "UIMenuController_m.h"
#import "UImenuControllerVC.h"
#import "TableItem.h"

@interface UIMenuController_m ()

@end

@implementation UIMenuController_m

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UImenuController";
    self.array = @[
                   instanceItem(@"原生UImenuController", nil, [UImenuControllerVC class]),
                   ];
}


@end
