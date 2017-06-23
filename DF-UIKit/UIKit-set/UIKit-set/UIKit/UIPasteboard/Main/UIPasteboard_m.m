//
//  UIPasteboard_m.m
//  UIKit-set
//
//  Created by Cyfuer on 16/6/28.
//  Copyright © 2016年 Cyfuer. All rights reserved.
//

#import "UIPasteboard_m.h"
#import "UIPasteboardVC.h"
#import "TableItem.h"

@interface UIPasteboard_m ()

@end

@implementation UIPasteboard_m

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UIPasteboard";
    self.array = @[
                   instanceItem(@"原生UIPasteboard", nil, [UIPasteboardVC class]),
                   ];
}

@end
