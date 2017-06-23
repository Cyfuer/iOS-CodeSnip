//
//  LogoButton.h
//  UIKit-set
//
//  Created by iflashbuy_dev on 2017/3/3.
//  Copyright © 2017年 Cyfuer. All rights reserved.
//

#import <UIKit/UIKit.h>

// 第一行文字的字体大小
#define kLogoButton_FirstLineTitle_Font ([UIFont systemFontOfSize:16])
// 第一行文字的字体颜色
#define kLogoButton_FirstLineTitle_Color ([UIColor whiteColor])

// 第二行文字的字体大小
#define kLogoButton_SecondLineTitle_Font ([UIFont systemFontOfSize:10])
// 第二行文字的字体颜色
#define kLogoButton_SecondLineTitle_Color ([UIColor whiteColor])

// 行间距
#define kLogoButton_Title_LineSpacing 10
// 图标跟标签的间距
#define kLogoButton_ImageAndLable_Spacing 9

@interface LogoButton : UIButton

@property (strong, nonatomic) NSString *firstLineTitle;
@property (strong, nonatomic) NSString *secondLineTitle;

@end
