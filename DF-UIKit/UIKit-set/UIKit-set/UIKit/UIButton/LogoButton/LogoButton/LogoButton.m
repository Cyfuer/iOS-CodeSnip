//
//  LogoButton.m
//  UIKit-set
//    NSFontAttributeName; //字体，value是UIFont对象
//    NSParagraphStyleAttributeName;//绘图的风格（居中，换行模式，间距等诸多风格），value是NSParagraphStyle对象
//    NSForegroundColorAttributeName;// 文字颜色，value是UIFont对象
//    NSBackgroundColorAttributeName;// 背景色，value是UIFont
//    NSLigatureAttributeName; //  字符连体，value是NSNumber
//    NSKernAttributeName; // 字符间隔
//    NSStrikethroughStyleAttributeName;//删除线，value是NSNumber
//    NSUnderlineStyleAttributeName;//下划线，value是NSNumber
//    NSStrokeColorAttributeName; //描绘边颜色，value是UIColor
//    NSStrokeWidthAttributeName; //描边宽度，value是NSNumber
//    NSShadowAttributeName; //阴影，value是NSShadow对象
//    NSTextEffectAttributeName; //文字效果，value是NSString
//    NSAttachmentAttributeName;//附属，value是NSTextAttachment 对象
//    NSLinkAttributeName;//链接，value是NSURL or NSString
//    NSBaselineOffsetAttributeName;//基础偏移量，value是NSNumber对象
//    NSUnderlineColorAttributeName;//下划线颜色，value是UIColor对象
//    NSStrikethroughColorAttributeName;//删除线颜色，value是UIColor
//    NSObliquenessAttributeName; //字体倾斜
//    NSExpansionAttributeName; //字体扁平化
//    NSVerticalGlyphFormAttributeName;//垂直或者水平，value是 NSNumber，0表示水平，1垂直
//  Created by iflashbuy_dev on 2017/3/3.
//  Copyright © 2017年 Cyfuer. All rights reserved.
//

#import "LogoButton.h"

@interface LogoButton ()

@property (strong, nonatomic) NSMutableAttributedString *firstAttrTitle;
@property (strong, nonatomic) NSMutableAttributedString *secondAttrTitle;

@end


@implementation LogoButton

- (void)drawRect:(CGRect)rect {
    self.titleLabel.textAlignment = NSTextAlignmentLeft;
    self.titleLabel.numberOfLines = 2;
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect {
    
    CGFloat h = contentRect.size.height;
    return CGRectMake(0, 0, h, h);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect {
   
    CGFloat h = contentRect.size.height;
    CGFloat w = contentRect.size.width;
    CGFloat marginX = h + kLogoButton_ImageAndLable_Spacing;
    return CGRectMake(marginX, 0, w - marginX, h);
}

- (void)setFirstLineTitle:(NSString *)firstLineTitle {
    _firstLineTitle = firstLineTitle;
    [self setTitle];
}

- (void)setSecondLineTitle:(NSString *)secondLineTitle {
    _secondLineTitle = [NSString stringWithFormat:@"\n%@",secondLineTitle];
    [self setTitle];
}

- (NSAttributedString *)firstAttrTitle{
    if (self.firstLineTitle) {
        NSMutableAttributedString * attrString = [[NSMutableAttributedString alloc] initWithString:self.firstLineTitle];
        // 设置字体颜色、大小
        NSDictionary * attributes = @{
                                      NSFontAttributeName:kLogoButton_FirstLineTitle_Font,
                                      NSForegroundColorAttributeName:kLogoButton_FirstLineTitle_Color,};
        [attrString setAttributes:attributes range:NSMakeRange(0,attrString.length)];
        return attrString;
    }
    return [[NSAttributedString alloc] initWithString:@"  "];
}

- (NSAttributedString *)secondAttrTitle{
    if (self.secondLineTitle) {
        NSMutableAttributedString * attrString = [[NSMutableAttributedString alloc] initWithString:self.secondLineTitle];
        // 设置字体颜色、大小
        NSDictionary * attributes = @{
                                      NSFontAttributeName:kLogoButton_SecondLineTitle_Font,
                                      NSForegroundColorAttributeName:kLogoButton_SecondLineTitle_Color,};
        [attrString setAttributes:attributes range:NSMakeRange(0,attrString.length)];
        
        return attrString;
    }
    return [[NSAttributedString alloc] initWithString:@"  "];
}

- (void)setTitle {
    NSMutableAttributedString *firstTitle = [self.firstAttrTitle mutableCopy];
    NSMutableAttributedString *secondTitle = [self.secondAttrTitle mutableCopy];
    [firstTitle appendAttributedString:secondTitle];
    
    // 设置行间距
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:kLogoButton_Title_LineSpacing];
    [firstTitle addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [firstTitle length])];
    
    
    [self setAttributedTitle:firstTitle forState:UIControlStateNormal];
}

@end
