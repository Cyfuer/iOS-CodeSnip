//
//  UIPasteboardVC.m
//  UIKit-set
//
//  Created by Cyfuer on 16/6/28.
//  Copyright © 2016年 Cyfuer. All rights reserved.
//

#import "UIPasteboardVC.h"

@interface UIPasteboardVC ()

@end

@implementation UIPasteboardVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)level {
    /*  
     *  系统级
     
     *  UIPasteboardNameGeneral
     *  UIPasteboardNameFind
     
     *  应用程序关闭或者卸载，数据都不会丢失
     
     */
    
    /*
     *  应用级
     
     *  通过pasteboardWithName:create：来创建
     
     *  可以让数据在应用程序关闭之后仍然保存在剪贴板中，但是应用程序卸载之后数据就会失去
     
     */
}

- (void)save {
    //存储数据
    UIPasteboard *pb = [UIPasteboard pasteboardWithName:@"testBoard" create:YES];
    NSDictionary *dict = [NSDictionary dictionaryWithObject:@"testData" forKey:@"content"];
    NSData *dictData = [NSKeyedArchiver archivedDataWithRootObject:dict];
    [pb setData:dictData forPasteboardType:@"myType"];
}

- (void)read {
    //获取就类似于这样：
    UIPasteboard *pb = [UIPasteboard pasteboardWithName:@"testBoard" create:YES];
    NSDictionary *dict = [NSKeyedUnarchiver unarchiveObjectWithData:[pb dataForPasteboardType:@"myType"]];
    NSString *content = [dict objectForKey:@"content"];
    NSLog(@"%@",content);
}


@end
