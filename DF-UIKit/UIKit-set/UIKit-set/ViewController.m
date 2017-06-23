//
//  ViewController.m
//  UIKit-set
//
//  Created by Cyfuer on 16/6/8.
//  Copyright © 2016年 Cyfuer. All rights reserved.
//

#import "ViewController.h"

#import "UITabbar_m.h"
#import "UINavigationBar_m.h"
#import "UITextField_m.h"
#import "UIMenuController_m.h"
#import "UIPasteboard_m.h"
#import "UIButton_m.h"

@interface ViewController () <UITableViewDelegate,UITableViewDataSource> {
    NSArray *array;
}

@property (strong, nonatomic) UITableView *table;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UIKit";
    
    array = @[
              @{@"title":@"UITabbar",
                @"detail":@"    选项卡"},
              
              @{@"title":@"UINavigationBar",
                @"detail":@"    导航条"},
              
              @{@"title":@"UITextField",
                @"detail":@"    输入框"},
              
              @{@"title":@"UIMenuController",
                @"detail":@"    菜单卡"},
              
              @{@"title":@"UIPasteboard",
                @"detail":@"    黏贴板"},
              
              @{@"title":@"UIButton",
                @"detail":@"    按钮"}
              ];
    [self.view addSubview:self.table];
}

#pragma mark - UITableViewDataSource && UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    if (array.count > indexPath.row) {
        NSDictionary *dict = array[indexPath.row];
        NSString *title = dict[@"title"];
        NSString *detail = dict[@"detail"];
        cell.textLabel.text = title;
        cell.detailTextLabel.text = detail;
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *class = array[indexPath.row][@"title"];
    NSString *className = [NSString stringWithFormat:@"%@_m",class];
    [self.navigationController pushViewController:[NSClassFromString(className) new] animated:YES];
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
