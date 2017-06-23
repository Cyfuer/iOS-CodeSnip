//
//  UITextfieldVC.m
//  UIKit-set
//
//  Created by Cyfuer on 16/6/17.
//  Copyright © 2016年 Cyfuer. All rights reserved.
//

#import "UITextfieldVC.h"

@interface UITextfieldVC ()

@property (strong, nonatomic) UITextField *textField;

@end

@implementation UITextfieldVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"原生UITextField";
    
    [self.view addSubview:self.textField];
}

#pragma mark - Getter
- (UITextField *)textField {
    if (!_textField) {
        UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 80, self.view.bounds.size.width - 20, 40)];
        
        // 修改背景颜色
        textField.backgroundColor = [UIColor purpleColor];
        
        // 修改光标颜色
        textField.tintColor = [UIColor redColor];
        
        _textField = textField;
    }
    return _textField;
}

@end
