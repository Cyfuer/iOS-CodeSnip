//
//  TableItem.m
//  UIKit-set
//
//  Created by Cyfuer on 2017/6/23.
//  Copyright © 2017年 Cyfuer. All rights reserved.
//

#import "TableItem.h"

@implementation TableItem

TableItem *instanceItem(NSString *title, NSString *detail, id classObj) {
    TableItem *item = [TableItem new];
    item.title = deal_emptystr_withDefaultStr(title, [classObj description]);
    item.detail = deal_emptystr_withDefaultStr(detail, @"暂无详情");
    item.classObj = classObj;
    return item;
}

BOOL isEmpty_str(NSString *string) {
    if ([string isKindOfClass:[NSString class]] || [string isKindOfClass:[NSNull class]]) {
        return (string == nil) || [string isEqual:[NSNull null]] || (string.length == 0) ;
    } else {
        return YES;
    }
}

NSString *deal_emptystr_withDefaultStr(NSString *displayStr, NSString *defaultStr) {
    if (isEmpty_str(displayStr)) {
        return defaultStr;
    } else {
        return displayStr;
    }
}

@end
