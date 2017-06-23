//
//  SysTabbar.m
//  UIKit-set
//
//  Created by Cyfuer on 16/6/8.
//  Copyright © 2016年 Cyfuer. All rights reserved.
//

#import "SysTabbar.h"

@interface SysTabbar ()

@property (strong, nonatomic) UIButton *addButton;

@end

@implementation SysTabbar

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        UIButton *publishbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [publishbtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [publishbtn setBackgroundImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateSelected];
        [publishbtn addTarget:self action:@selector(addClick) forControlEvents:UIControlEventTouchUpInside];
        [publishbtn sizeToFit];//设置图片的尺寸大小
        
        [self addSubview:publishbtn];
        self.addButton = publishbtn;
    }
    return self;
}

#pragma mark - OverRide
- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.addButton.center = CGPointMake(self.frame.size.width*0.5, self.frame.size.height*0.5);
    //按钮索引
    int index= 0;
    
    //按钮尺寸
    CGFloat tabBarButtonW = self.frame.size.width/5;
    CGFloat tabBarbuttonH = self.frame.size.height;
    CGFloat tabBarButtonY = 0;
    
    //设置4个tabbarButton位置
    //不是tabBarButton类型的就排除掉
    for (UIView *tabBarButton in self.subviews) {
        if (![NSStringFromClass(tabBarButton.class)isEqualToString:@"UITabBarButton"])continue;
        
        //计算按钮X的值
        CGFloat tabBarButtonX = index * tabBarButtonW;
        if (index>=2) {//如果前面有2个控件的位置了就加一个腾出为位置给按钮
            tabBarButtonX += tabBarButtonW;
        }
        //设置按钮的frame
        tabBarButton.frame = CGRectMake(tabBarButtonX, tabBarButtonY, tabBarButtonW, tabBarbuttonH);
        //增加所以条
        index++;
    }
}

#pragma mark - Private
- (void)addClick {
    
}


@end
