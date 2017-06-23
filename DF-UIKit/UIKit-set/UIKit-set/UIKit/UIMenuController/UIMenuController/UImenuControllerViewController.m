//
//  UImenuControllerViewController.m
//  UIKit-set
//
//  Created by Cyfuer on 16/6/28.
//  Copyright © 2016年 Cyfuer. All rights reserved.
//

#import "UImenuControllerViewController.h"

@interface UImenuControllerViewController ()

@end

@implementation UImenuControllerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     //取出cell
     UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
     
     UIMenuController *menu = [UIMenuController   sharedMenuController];
     
     //设置菜单内容
     menu.menuItems = @[
     [[UIMenuItem alloc] initWithTitle:@"顶" action:@selector(ding:)],
     [[UIMenuItem alloc] initWithTitle:@"回复" action:@selector(reply:)],
     [[UIMenuItem alloc] initWithTitle:@"举报" action:@selector(warn:)]
     
     ];
     
     
     //显示位置
     CGRect rect = CGRectMake(0, cell.bounds.size.height*0.5, cell.bounds.size.width, 1);
     [menu setTargetRect:rect inView:cell];
     
     //显示出来
     [menu setMenuVisible:YES animated:YES];
     */
}

- (BOOL)canBecomeFirstResponder {
    return YES;
}

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    if (!self.isFirstResponder) {
        if (action == @selector(ding:)
            || action == @selector(reply:)
            || action == @selector(warn:)) return  NO;
    }
    return [super canPerformAction:action withSender:sender];
}

- (void)ding:(UIMenuController *)menu {

}

- (void)reply:(UIMenuController *)menu {
    
}
        
- (void)warn:(UIMenuController *)menu {
    
}


@end
