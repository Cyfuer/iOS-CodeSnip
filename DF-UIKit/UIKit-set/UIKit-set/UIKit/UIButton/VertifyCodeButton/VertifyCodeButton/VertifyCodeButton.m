//
//  VertifyCodeButton.m
//  UIKit-set
//
//  Created by apple on 16/8/18.
//  Copyright © 2016年 Cyfuer. All rights reserved.
//

#import "VertifyCodeButton.h"

@interface VertifyCodeButton () {
    
    NSInteger time;// 当前倒计时时间
}

@end

@implementation VertifyCodeButton

#pragma mark - Private

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initTimeIntervar];
        
        [self initAppearance];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self initTimeIntervar];
    
    [self initAppearance];
}

- (void)initTimeIntervar {
    // 初始化倒计时时间
    if (self.timeInterval <= 0) {
        self.timeInterval = 60;
    }
}

- (void)initAppearance {
    self.status = ReadyToGetCode;
    
    self.layer.cornerRadius = 5;
    self.titleLabel.font = [UIFont systemFontOfSize:12];
    self.frame = CGRectMake(10, 70, 80, 25);
    
    [self setBackgroundColor:[UIColor lightGrayColor]];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [self addTarget:self action:@selector(Action:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)revealTransition:(CALayer *)layer {
    //1.创建转场动画对象
    CATransition *transition=[[CATransition alloc]init];
    
    //2.设置动画类型,注意对于苹果官方没公开的动画类型只能使用字符串，并没有对应的常量定义
    transition.type=@"reveal";
    
    //设置子类型
    transition.subtype=kCATransitionFromTop;
    //设置动画时常
    transition.duration=.7f;
    
    //3.设置转场后的新视图添加转场动画
    [layer addAnimation:transition forKey:@"KCTransitionAnimation"];
}

#pragma mark - Action
- (void)Action:(VertifyCodeButton *)sender {
    if (sender.status == ReadyToGetCode) {
        sender.status = GettingCode;
    }
}

- (void)countDown:(NSTimer *)timer {
    
    time -= 1;
    
    if (time < 0) {
        
        [timer invalidate];
        
        self.status = ReadyToGetCode;
        
    } else {
        
        NSString *title = [NSString stringWithFormat:@"%lds",time];
        
        [self setTitle:title forState:UIControlStateNormal];
        
        [self revealTransition:self.titleLabel.layer];
    }
}

- (void)getAnimation:(NSTimer *)timer {
    if (self.status == GettedCode) {
        [timer invalidate];
    } else {
        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
        [animation setDuration:1];
        [animation setAutoreverses:YES];    //这里设置是否恢复初始的状态,
        [animation setFromValue:[NSNumber numberWithInt:1.0]];  //设置透明度从1 到 0
        [animation setToValue:[NSNumber numberWithInt:0.6]];
        [self.layer addAnimation:animation forKey:@"opatity-animation"];
    }
}



// 点击获取验证码或重新获取验证码时调用
- (void)getcode {
    if (self.getCodeAction) {
        self.getCodeAction(self);
    }
}

#pragma mark - Setter
- (void)setStatus:(VertifyCodeButtonStatus)status {
    _status = status;
    
    if (status == ReadyToGetCode) {
        [self setTitle:@"获取验证码" forState:UIControlStateNormal];
        [self setUserInteractionEnabled:YES];
        [self getcode];
        
    } else if (status == GettingCode) {
        [self setTitle:@"获取中..." forState:UIControlStateNormal];
        [self setUserInteractionEnabled:NO];
        
        // 获取中动画
        [NSTimer scheduledTimerWithTimeInterval:1.2 target:self selector:@selector(getAnimation:) userInfo:nil repeats:YES];
        
    } else if (status == GettedCode) {
        [self setTitle:[NSString stringWithFormat:@"%lds",self.timeInterval] forState:UIControlStateNormal];
        [self setUserInteractionEnabled:NO];
        [self revealTransition:self.titleLabel.layer];
        
        // 开始倒计时
        time = self.timeInterval;
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(countDown:) userInfo:nil repeats:YES];
        
    }
}

- (void)setTimeInterval:(NSInteger)timeInterval {
    if (timeInterval < 0) {
        _timeInterval = 60;
    } else {
        _timeInterval = timeInterval;
    }
}


@end
