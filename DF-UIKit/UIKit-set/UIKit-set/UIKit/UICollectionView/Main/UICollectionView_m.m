//
//  UICollectionView_m.m
//  UIKit-set
//
//  Created by Cyfuer on 2017/6/23.
//  Copyright © 2017年 Cyfuer. All rights reserved.
//

#import "UICollectionView_m.h"
#import "TableItem.h"
#import "UICollectionViewVC.h"

@interface UICollectionView_m ()

@end

@implementation UICollectionView_m

- (void)viewDidLoad {
    [super viewDidLoad];
    self.array = @[
                   instanceItem(@"原生UICollectionView", nil, [UICollectionViewVC class]),
                   ];
}

@end
