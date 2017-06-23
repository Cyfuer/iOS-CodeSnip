//
//  ViewController.m
//  UIKit-set
//
//  Created by Cyfuer on 16/6/8.
//  Copyright © 2016年 Cyfuer. All rights reserved.
//

#import "ViewController.h"
#import "TableItem.h"
#import "UITabbar_m.h"
#import "UINavigationBar_m.h"
#import "UITextField_m.h"
#import "UIMenuController_m.h"
#import "UIPasteboard_m.h"
#import "UIButton_m.h"
#import "UIViewController_m.h"
#import "UICollectionView_m.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UIKit - set";
    self.array = @[
                   instanceItem(@"UITabbar", @"选项卡", [UITabbar_m class]),
                   instanceItem(@"UINavigationBar", @"导航条", [UITabbar_m class]),
                   instanceItem(@"UITextField", @"输入框", [UITabbar_m class]),
                   instanceItem(@"UIMenuController", @"菜单卡", [UITabbar_m class]),
                   instanceItem(@"UIPasteboard", @"黏贴板", [UITabbar_m class]),
                   instanceItem(@"UIButton", @"按钮", [UITabbar_m class]),
                   instanceItem(@"UIViewController", @"控制器", [UIViewController_m class]),
                   instanceItem(@"UICollectionView", @"瀑布流", [UICollectionView_m class]),
                   ];
}




@end
