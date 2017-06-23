//
//  TableItem.h
//  UIKit-set
//
//  Created by Cyfuer on 2017/6/23.
//  Copyright © 2017年 Cyfuer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableItem : NSObject

@property (copy, nonatomic) NSString *title;
@property (copy, nonatomic) NSString *detail;
@property (strong, nonatomic) id classObj;
@property (assign, nonatomic) NSInteger index;

TableItem *instanceItem(NSString *title, NSString *detail, id classObj);

@end
