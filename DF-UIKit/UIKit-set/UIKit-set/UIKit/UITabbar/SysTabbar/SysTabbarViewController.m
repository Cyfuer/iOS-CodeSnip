//
//  SysTabbarViewController.m
//  UIKit-set
//
//  Created by Cyfuer on 16/6/8.
//  Copyright © 2016年 Cyfuer. All rights reserved.
//

#import "SysTabbarViewController.h"
#import "ViewController.h"
#import "AppDelegate.h"

@interface SysTabbarViewController ()

@property (weak, nonatomic) IBOutlet UIButton *backButton;
@end

@implementation SysTabbarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // button back to rootViewController
    CGFloat red = random()%254;
    CGFloat green = random()%254;
    CGFloat blue = random()%254;
    self.backButton.backgroundColor = [UIColor colorWithRed:red/255 green:green/255 blue:blue/255 alpha:0.8];
}

@end
