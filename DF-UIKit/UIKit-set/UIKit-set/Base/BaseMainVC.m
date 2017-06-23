//
//  BaseMainVC.m
//  UIKit-set
//  
//  Created by Cyfuer on 16/6/17.
//  Copyright © 2016年 Cyfuer. All rights reserved.
//

#import "BaseMainVC.h"

@interface BaseMainVC () <UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) UITableView *table;

@end

@implementation BaseMainVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.table];
}

#pragma mark - Private
- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // 子类重写
}

#pragma mark - UITableViewDataSource && UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    if (self.array.count > indexPath.row) {
        NSString *title = self.array[indexPath.row];
        cell.textLabel.text = [NSString stringWithFormat:@"%ld.%@",indexPath.row + 1,title];
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self didSelectRowAtIndexPath:indexPath];
}

#pragma mark - Setter
- (void)setArray:(NSArray *)array {
    _array = array;
    [self.table reloadData];
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
