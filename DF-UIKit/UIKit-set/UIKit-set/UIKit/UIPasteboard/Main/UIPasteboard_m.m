//
//  UIPasteboard_m.m
//  UIKit-set
//
//  Created by Cyfuer on 16/6/28.
//  Copyright © 2016年 Cyfuer. All rights reserved.
//

#import "UIPasteboard_m.h"
#import "UIPasteboardVC.h"

@interface UIPasteboard_m ()

@end

@implementation UIPasteboard_m

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"UIPasteboard";
    self.array = @[
                   @"原生UIPasteboard"
                   ];
}

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *index = self.array[indexPath.row];
    
    if ([index isEqualToString:@"原生UIPasteboard"]) {
        [self.navigationController pushViewController:[UIPasteboardVC new] animated:YES];
    }
}

@end
