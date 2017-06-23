//
//  VertifyCodeButtonVC.m
//  UIKit-set
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 Cyfuer. All rights reserved.
//

#import "VertifyCodeButtonVC.h"
#import "VertifyCodeButton.h"

@interface VertifyCodeButtonVC ()

@end

@implementation VertifyCodeButtonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initVertifyCodeButton];
}

- (void)initVertifyCodeButton {
    VertifyCodeButton *button = [[VertifyCodeButton alloc] init];
    button.timeInterval = 3;
    [self.view addSubview:button];
    
    // 模拟交互
    [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(changeBtnStatus:) userInfo:button repeats:YES];
}

- (void)changeBtnStatus:(NSTimer *)timer {
    VertifyCodeButton *button = (VertifyCodeButton *)timer.userInfo;
    if (button.status == ReadyToGetCode) {
        button.status = GettingCode;
    } else if (button.status == GettingCode) {
        button.status = GettedCode;
    }
}

@end
