//
//  TabViewControllerVC.m
//  UIKit-set
//
//  Created by Cyfuer on 2017/6/23.
//  Copyright © 2017年 Cyfuer. All rights reserved.
//

#import "TabViewControllerVC.h"

#import "UIView+Frame.h" // 外部依赖
float const navH = 64;// 外部依赖

@interface TabViewControllerVC () <UIScrollViewDelegate>

@property (nonatomic,weak) UIScrollView * scrollview;/**存放所有的子控制器*/

@property (nonatomic,weak) UIButton * selectitleButton;/**选中标题按钮*/

@property (nonatomic,weak) UIView * titleView;/**标题栏*/

@property (nonatomic,weak) UIView * titlebottomView;/**标题栏底部指示器*/

@property (nonatomic,strong) NSMutableArray * titleButtons;/**存放所有的标题按钮*/

@end

@implementation TabViewControllerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpChildVcs];// 必须先设置好子控制器，后面的代码有用到
    [self setScrollview];
    [self setTitleView];
}

#pragma mark - Private
- (void)titleClick:(UIButton *)titlebutton {
    //控制器按钮的状态
    self.selectitleButton.selected = NO;
    titlebutton.selected = YES;
    self.selectitleButton = titlebutton;
    
    //标题栏底部控件的位置和尺寸
    [UIView animateWithDuration:0.25 animations:^{
        self.titlebottomView.width = titlebutton.titleLabel.width;
        self.titlebottomView.centerX = titlebutton.centerX;
    }];
    
    //让scrollview滚到对应的位置
    CGPoint offset = self.scrollview.contentOffset;
    offset.x = self.view.width *[self.titleButtons indexOfObject:titlebutton];
    [self.scrollview setContentOffset:offset animated:YES];
    
}

- (void)setUpChildVcs {
    UIViewController *all = [[UIViewController alloc]init];
    all.view.backgroundColor = [UIColor purpleColor];
    all.title = @"全部";
    [self addChildViewController:all];
    
    UIViewController*video = [[UIViewController alloc]init];
    video.view.backgroundColor = [UIColor lightGrayColor];
    video.title = @"视频";
    [self addChildViewController:video];
    
    UIViewController *voice = [[UIViewController alloc]init];
    voice.view.backgroundColor = [UIColor cyanColor];
    voice.title = @"声音";
    [self addChildViewController:voice];
    
    UIViewController *picture = [[UIViewController alloc]init];
    picture.view.backgroundColor = [UIColor orangeColor];
    picture.title = @"图片";
    [self addChildViewController:picture];
    
    UIViewController *word = [[UIViewController alloc]init];
    word.view.backgroundColor = [UIColor brownColor];
    word.title = @"段子";
    [self addChildViewController:word];
}

- (void)setTitleView
{
    //上部标题栏设置
    UIView *titleview = [[UIView alloc] init];
    titleview.backgroundColor = [UIColor colorWithWhite:1.0 alpha:0.5];
    titleview.frame = CGRectMake(0, navH, self.view.width, 35);
    [self.view addSubview:titleview];
    self.titleView = titleview;
    
    //设置标题栏内部标签按钮
    NSUInteger count = self.childViewControllers.count;
    CGFloat titleButtonH = titleview.height - 1;
    CGFloat titleButtonW = self.view.width /count;
    
    self.titleButtons = [NSMutableArray array];
    for (int i =0; i<count; i++) {
        UIButton *titleButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [titleButton setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [titleButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
        [titleview addSubview:titleButton];
        [self.titleButtons addObject:titleButton];
        
        //名称
        NSString *title = [self.childViewControllers[i] title];
        [titleButton setTitle:title forState:UIControlStateNormal];
        
        //frame
        titleButton.top = 0;
        titleButton.height = titleButtonH;
        titleButton.width = titleButtonW;
        titleButton.left = i * titleButton.width;
    }
    //标签栏底部指示器控件
    UIView *titlebottomView = [[UIView alloc] init];
    titlebottomView.backgroundColor = [self.titleButtons.lastObject titleColorForState:UIControlStateSelected];
    titlebottomView.height = 5;
    titlebottomView.top = titleview.height - titlebottomView.height;
    [titleview addSubview:titlebottomView];
    self.titlebottomView = titlebottomView;
    
    //默认点击最前的按钮
    UIButton *firsttitleButton = self.titleButtons.firstObject;
    [firsttitleButton.titleLabel sizeToFit];
    titlebottomView.width = firsttitleButton.titleLabel.width;
    titlebottomView.centerX = firsttitleButton.centerX;
    [self titleClick:firsttitleButton];
}


- (void)setScrollview{
    
    //不要自动调整scrollview的conteninset(64高度)
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UIScrollView *scrollview = [[UIScrollView alloc] init];
    scrollview.frame = self.view.bounds;
    scrollview.backgroundColor = [UIColor lightGrayColor];
    //遵守代理
    scrollview.delegate = self;
    
    //设置分页
    scrollview.pagingEnabled = YES;
    
    scrollview.contentSize = CGSizeMake(self.childViewControllers.count * self.view.width, 0);
    [self.view addSubview:scrollview];
    self.scrollview = scrollview;
    
    // 默认显示第0个控制器
    [self scrollViewDidEndScrollingAnimation:scrollview];
}

#pragma mark - UIScrollViewDelegate

//当scrollView滚动完毕就会调用这个方法
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
    
    int index = scrollView.contentOffset.x / scrollView.width;
    
    UIViewController *willshowChildVc = self.childViewControllers[index];
    
    // 添加子控制器view覆盖到scroollview上
    willshowChildVc.view.frame = scrollView.bounds;
    
    [scrollView addSubview:willshowChildVc.view];
    
}

//当减速完毕后才会调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    [self scrollViewDidEndScrollingAnimation:scrollView];
    //点击按钮
    int index = scrollView.contentOffset.x /scrollView.width;
    
    [self titleClick:self.titleButtons[index]];
    
    
}

@end
