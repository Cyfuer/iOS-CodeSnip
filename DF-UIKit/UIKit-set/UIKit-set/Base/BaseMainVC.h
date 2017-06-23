//
//  BaseMainVC.h
//  UIKit-set
//  视图控制器，每个话题主界面的基类，比如UITabbar这个话题，显示着各种Tabbar列表的界面
//  Created by Cyfuer on 16/6/17.
//  Copyright © 2016年 Cyfuer. All rights reserved.
//

#import "BaseVC.h"

@interface BaseMainVC : BaseVC

@property (strong, nonatomic) NSArray *array;// 列表数据

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath;// 子类通过重写该方法自定义点击不同条目时的操作

@end
