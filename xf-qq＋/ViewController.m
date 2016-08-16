//
//  ViewController.m
//  xf-qq＋
//
//  Created by 朱晓峰 on 16/8/16.
//  Copyright © 2016年 朱晓峰. All rights reserved.
//

#import "ViewController.h"
#import "XFView.h"
@interface ViewController ()
@property (nonatomic, strong) UIView *coverView;

@property (nonatomic, strong) XFView *menuView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIBarButtonItem *btn=[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(menuClick:)];
    
    self.navigationItem.rightBarButtonItem=btn;
    [self createCover];
    
    [self createDownMenu];
}

- (void)createCover
{
    UIView *cover = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
    cover.tag = 1;
    cover.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
    [self.view addSubview:cover];
    
    cover.hidden = YES;
    
    self.coverView = cover;
}

- (void)createDownMenu
{
    //屏幕的宽度
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    //计算ableView的frame
    CGFloat ViewW = 150;
    CGFloat ViewH = 200;
    CGFloat ViewX = screenWidth - ViewW - 10;
    CGFloat ViewY = 64;
    
    XFView *menuView = [[XFView alloc]initWithFrame:CGRectMake(ViewX, ViewY, ViewW, ViewH)];
    [self.coverView addSubview:menuView];
    self.menuView = menuView;
    
    menuView.backgroundColor = [UIColor clearColor];
    self.menuView.hidden = YES;
    
}


- (void)menuClick:(UIBarButtonItem *)sender {
    
    if (self.menuView.hidden) {
        self.menuView.hidden = NO;
        self.coverView.hidden = NO;
    }else
    {
        self.menuView.hidden = YES;
        self.coverView.hidden = YES;
    }
}

@end
