//
//  UITextField_m.m
//  UIKit-set
//
//  Created by Cyfuer on 16/6/17.
//  Copyright © 2016年 Cyfuer. All rights reserved.
//

#import "UITextField_m.h"

#import "UITextfieldVC.h"
#import "ImgTextFieldViewController.h"
#import "TableItem.h"

@interface UITextField_m ()

@end

@implementation UITextField_m

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UITextField";
    self.array = @[
                   instanceItem(@"原生UITextField", nil, [UITextfieldVC class]),
                   instanceItem(@"ImgTextField", nil, [ImgTextFieldViewController class]),
                   @"",
                   @""
                   ];
}

@end
