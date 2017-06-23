//
//  TableItemCell.m
//  UIKit-set
//
//  Created by Cyfuer on 2017/6/23.
//  Copyright © 2017年 Cyfuer. All rights reserved.
//

#import "TableItemCell.h"
#import "TableItem.h"

@interface TableItemCell ()

@property (weak, nonatomic) IBOutlet UILabel *indexLab;
@property (weak, nonatomic) IBOutlet UILabel *titleLab;
@property (weak, nonatomic) IBOutlet UILabel *detailLab;


@end

@implementation TableItemCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setItem:(TableItem *)item {
    _item = item;
    
    self.indexLab.text = [NSString stringWithFormat:@"%02ld", item.index];
    self.titleLab.text = item.title;
    self.detailLab.text = item.detail;
}

@end
