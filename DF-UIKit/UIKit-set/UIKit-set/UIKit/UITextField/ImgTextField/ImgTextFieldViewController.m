//
//  ImgTextFieldViewController.m
//  UIKit-set
//
//  Created by apple on 16/9/19.
//  Copyright © 2016年 Cyfuer. All rights reserved.
//

#import "ImgTextFieldViewController.h"
#import "ImgTextField.h"

@interface ImgTextFieldViewController ()

@end

@implementation ImgTextFieldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ImgTextField *tf = [[ImgTextField alloc] initWithFrame:CGRectMake(10, 80, 200, 60)];
    tf.layer.borderWidth = .5;
    tf.layer.borderColor = [UIColor lightGrayColor].CGColor;
    tf.leftImg = [UIImage imageNamed:@"code"];
    [self.view addSubview:tf];

}

@end
