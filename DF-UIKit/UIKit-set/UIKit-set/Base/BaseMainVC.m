//
//  BaseMainVC.m
//  UIKit-set
//  
//  Created by Cyfuer on 16/6/17.
//  Copyright © 2016年 Cyfuer. All rights reserved.
//

#import "BaseMainVC.h"
#import "TableItemCell.h"
#import "TableItem.h"

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
    TableItem *item = self.array[indexPath.row];
    UIViewController *vc = [item.classObj new];
    vc.title = item.title;
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UITableViewDataSource && UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    TableItemCell *cell = [tableView dequeueReusableCellWithIdentifier:[TableItemCell description]];
    
    if (self.array.count > indexPath.row) {
        TableItem *item = self.array[indexPath.row];
        item.index = indexPath.row + 1;
        cell.item = item;
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
        [table registerNib:[UINib nibWithNibName:[TableItemCell description] bundle:[NSBundle mainBundle]] forCellReuseIdentifier:[TableItemCell description]];
        table.estimatedRowHeight = 44;
        table.rowHeight = 44;
        table.delegate = self;
        table.dataSource = self;
        
        _table = table;
    }
    return _table;
}

@end
