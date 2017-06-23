//
//  ImgTextField.m
//  UIKit-set
//
//  Created by apple on 16/9/19.
//  Copyright © 2016年 Cyfuer. All rights reserved.
//

#import "ImgTextField.h"

@implementation ImgTextField

#pragma mark - Setter
- (void)setLeftImg:(UIImage *)leftImg {
    if (leftImg) {
        _leftImg = leftImg;
        
        // 左侧视图添加到textfield中
        self.leftView = [self getImgViewByImg:leftImg];
        self.leftViewMode = UITextFieldViewModeAlways;
    }
}

- (void)setRightImg:(UIImage *)rightImg {
    if (rightImg) {
        _rightImg = rightImg;
        
        // 左侧视图添加到textfield中
        self.rightView = [self getImgViewByImg:rightImg];
        self.rightViewMode = UITextFieldViewModeAlways;
    }
}

- (UIView *)getImgViewByImg:(UIImage *)leftImg {
    // 左侧视图初始化
    CGRect rect = CGRectMake(0, 0, leftImg.size.width + 10, leftImg.size.height);
    UIView *view = [[UIView alloc] initWithFrame:rect];
    
    // 左侧视图添加图片
    UIImageView *imgView = [[UIImageView alloc] initWithImage:leftImg];
    imgView.center = CGPointMake(view.bounds.size.width / 2, view.bounds.size.height / 2);
    [view addSubview:imgView];
    
    return view;
}

@end
