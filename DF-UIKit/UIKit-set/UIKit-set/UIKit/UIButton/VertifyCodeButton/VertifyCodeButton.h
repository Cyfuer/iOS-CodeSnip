//
//  VertifyCodeButton.h
//  UIKit-set
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 Cyfuer. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^getCodeAction)(id);

typedef NS_ENUM(NSInteger, VertifyCodeButtonStatus) {
    
    ReadyToGetCode = 0, // 准备获取状态
    GettingCode,// 正在获取状态，该状态下无法自动切换状态至GettedCode，需要在获取成功验证码后手动设置为GettedCode，按钮不可交互
    GettedCode // 成功获取状态，该状态自动进入倒计时，按钮不可交互,倒计时结束自动切换至 ReadyToGetCode
};

@interface VertifyCodeButton : UIButton


@property (assign, nonatomic) NSInteger timeInterval;// 倒计时时间，默认60s

@property (assign, nonatomic) VertifyCodeButtonStatus status;//倒计时按钮状态，默认ReadyToGetCode

@property (strong, nonatomic) getCodeAction getCodeAction;// 按钮处于获取验证码或重新获取验证码状态时点击会调用

@end
