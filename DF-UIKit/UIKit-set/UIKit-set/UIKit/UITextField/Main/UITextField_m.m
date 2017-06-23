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

@interface UITextField_m ()

@end

@implementation UITextField_m

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UITextField";
    self.array = @[
                   @"原生UITextField",
                   @"ImgTextField"
                   ];
}

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *index = self.array[indexPath.row];
    
    if ([index isEqualToString:@"原生UITextField"]) {
        [self.navigationController pushViewController:[UITextfieldVC new] animated:YES];
    } else if ([index isEqualToString:@"ImgTextField"]) {
        [self.navigationController pushViewController:[ImgTextFieldViewController new] animated:YES];
    }
}

@end
