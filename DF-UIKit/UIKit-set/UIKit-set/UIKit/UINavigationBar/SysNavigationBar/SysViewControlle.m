//
//  SysViewControlle.m
//  UIKit-set
//
//  Created by Cyfuer on 16/6/12.
//  Copyright © 2016年 Cyfuer. All rights reserved.
//

#import "SysViewControlle.h"
#import "SysSubViewController.h"

@interface SysViewControlle () <UITableViewDataSource, UITableViewDelegate> {
    NSArray *tableData;
}

@property (strong, nonatomic) UITableView *table;

@end

@implementation SysViewControlle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"原生UINavigationController的封装";
    [self setRightNavBarItemWithTitle:@"返回" action:@selector(backAction)];
    
    tableData = @[
                  // 1.原生返回按钮的控制比较方便，在当前控制器随便什么地方想隐藏就隐藏，想显示就显示
                  @"1.原生返回按钮的控制",
                  
                  // 2.添加左侧按钮时原生返回按钮会被覆盖掉，所以不用担心返回按钮的显示
                  @"2.自定义左侧按钮",
                  
                  // 3.不管自定义的视图height有多高，视图的center的y的值都是 （状态栏20 + 导航栏中点22）
                  @"3.自定义左侧视图",
                  
                  // 4.根据视图数组从左往右依次添加
                  @"4.自定义多个左侧视图",
                  
                  // 5.titleView的 center.x 是导航栏的中点，center.y 是 44（状态栏20 + 导航栏中点22）
                  @"5.自定义titleview",
                  
                  // 6.
                  @"6.自定义右侧按钮",
                  
                  // 7.
                  @"7.自定义右侧视图",
                  
                  // 8.根据视图数组从右往左依次添加
                  @"8.自定义多个右侧视图",
                  
                  // 9.动画显示prompt文字，导航栏高度变高，在title的上面显示prompt，如果想要隐藏，必须设prompt为nil
                  @"9.prompt",
                  
                  // 10.后添加的会把前面的覆盖掉，都是在同一个navigationItem，它只有三个位置：leftBarButtonItems、rightBarButtonItems、titleView，就像小轿车一样，一个座位被另一人占了，前一个人就没座位得滚下车了
                  @"10.重复自定义左侧按钮",
                  
                  // 11.根据图片大小生成对应大小的按钮
                  @"11.自定义左侧图片按钮",
                  
                  // 12.想怎么藏怎么藏，但存在一种特例，界面A不显示导航栏，跳转到B后显示了导航栏，返回回来的时候得记得隐藏
                  @"12.导航栏显示隐藏的控制",
                  
                  // 13.translucent 为 YES 时有半透明效果
                  @"13.导航栏背景色",
                  
                  // 14.默认返回按钮被覆盖了
                  @"14.不隐藏默认返回按钮时添加自定义左侧按钮",
                  
                  // 15.视图A跳转至视图B时，A的导航栏的设置会自动清空
                  @"15.连续两层视图的修改会互相影响吗？不会",
                  
                  // 16.也是会被覆盖掉的，一个萝卜一个坑，不管是左侧按钮还是左侧自定义视图，都需要leftBarButtonItems这个坑，但只能坐一个
                  @"16.自定义左侧按钮自定义左侧视图列表"
                  ];
    [self.view addSubview:self.table];
    [self.table reloadData];
}

#pragma mark - Private
- (void)backAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - UITableViewDataSource && UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return tableData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = tableData[indexPath.row];
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    SysSubViewController *vc = [SysSubViewController new];
    vc.type = indexPath.row + 1;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Getter
- (UITableView *)table {
    if (!_table) {
        UITableView *table = [[UITableView alloc] initWithFrame:self.view.bounds];
        table.delegate = self;
        table.dataSource = self;
        
        _table = table;
    }
    return _table;
}

@end
