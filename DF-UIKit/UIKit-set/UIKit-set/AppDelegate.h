//
//  AppDelegate.h
//  UIKit-set
//
//  Created by Cyfuer on 16/6/8.
//  Copyright © 2016年 Cyfuer. All rights reserved.
//

/**
 *  新增UI类步骤（以UITabbar为例）
 *
 *      1.在 文件夹UIKit 新建文件夹，命名 UITabbar（如果文件夹存在，直接跳到步骤5）
 *      2.在 文件夹UITabbar 里新建一个 文件夹Main
 *      3.在 文件夹Main 中添加管理类 UITabbar_m(继承BaseMainVC)，展现关于UITabbar所有课题的列表，点击跳转到对于课题
 *      4.点击进入类ViewController，找到方法viewDidLoad，在变量array按照格式添加一个条目                                            
            
            @{@"title":@"类名",
              @"detail":@"描述"}
 
 *      5.在 文件夹UITabbar 新建文件夹存放研究的课题即可
 *      6.在 类UITabbar_m 中的展示数组添加新建课题
 */

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;


@end

