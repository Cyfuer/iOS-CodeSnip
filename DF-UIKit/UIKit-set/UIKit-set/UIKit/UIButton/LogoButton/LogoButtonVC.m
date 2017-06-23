//
//  LogoButtonVC.m
//  UIKit-set
//
//  Created by iflashbuy_dev on 2017/3/3.
//  Copyright © 2017年 Cyfuer. All rights reserved.
//

#import "LogoButtonVC.h"
#import "LogoButton.h"

@interface LogoButtonVC ()

@property (weak, nonatomic) IBOutlet LogoButton *logoBtn;

@end

@implementation LogoButtonVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.logoBtn setImage:[UIImage imageNamed:@"phone"] forState:UIControlStateNormal];
    self.logoBtn.firstLineTitle = @"fdsaaa";
    self.logoBtn.secondLineTitle = @"bbbbbb";
    self.logoBtn.backgroundColor = [UIColor blackColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
