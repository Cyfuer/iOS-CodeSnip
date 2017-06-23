//
//  ImgTextField.h
//  UIKit-set
//
//  Created by apple on 16/9/19.
//  Copyright © 2016年 Cyfuer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImgTextField : UITextField

@property (strong, nonatomic) UIImage *leftImg;// 直接通过图片生成左侧子视图

@property (strong, nonatomic) UIImage *rightImg;// 直接通过图片生成右侧子视图

@end
