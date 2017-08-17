//
//  FindViewController.m
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/17.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "FindViewController.h"
#import "FindSubTitleView.h"

@interface FindViewController () <FindSubTitleViewDelegate>

@property (nonatomic, strong) FindSubTitleView *titleView;
@end

@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleView.delegate = self;
    [self.view addSubview:self.titleView];
    
    UIPageViewController
}


#pragma mark - 代理方法
- (void)subTitleSelectedAtIndex:(NSInteger)index{
    NSLog(@"点中了---- %ld", (long)index);
}

#pragma mark - lazyload

- (FindSubTitleView *)titleView{
    if (!_titleView) {
        _titleView  = [[FindSubTitleView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, 40)];
    }
    return _titleView;
}
@end
