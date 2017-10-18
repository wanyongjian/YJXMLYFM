//
//  FindViewController.m
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/17.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "FindViewController.h"
#import "FindSubTitleView.h"
#import "XMLYFindFactory.h"
#import "XMLYFindAPI.h"


@interface FindViewController () <FindSubTitleViewDelegate,UIPageViewControllerDelegate,UIPageViewControllerDataSource>

@property (nonatomic, strong) FindSubTitleView *titleView;
/** 存放发现界面controller数组*/
@property (nonatomic, strong) NSMutableArray *controllers;
/** UIPageviewcontroller*/
@property (nonatomic, strong) UIPageViewController *pageViewController;

@property (nonatomic, strong) NSMutableArray *subTitleArray;
@end



@implementation FindViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titleView.delegate = self;
    [self.view addSubview:self.titleView];
    [self.view addSubview:self.pageViewController.view];
    [self addChildViewController:self.pageViewController];
    [self layoutViews];
    [XMLYFindAPI requestWithRecommend:^(id response) {
        
    }];
}

- (void)layoutViews{
    [self.pageViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.titleView.mas_bottom);
        make.bottom.mas_equalTo(self.view.mas_bottom).offset(-49);
    }];
}

#pragma mark - subTitle代理方法
- (void)subTitleSelectedAtIndex:(NSInteger)index{
    NSLog(@"点中了---- %ld", (long)index);
    [self.pageViewController setViewControllers:@[[self.controllers objectAtIndex:index]] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

#pragma mark - pageviewcontroller代理方法
/** 下一个控制器 */
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
    
    NSInteger index = [self.controllers indexOfObject:viewController];
    if (index == self.controllers.count-1 || index == NSNotFound) {
        return nil;
    }
    index++;
    return [self.controllers objectAtIndex:index];
}
/** 上一个控制器 */
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
    
    NSInteger index = [self.controllers indexOfObject:viewController];
    if (index == 0 || index == NSNotFound) {
        return nil;
    }
    index--;
    return [self.controllers objectAtIndex:index];
    
}
/** 拖动切换控制器完成 */
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed{
    NSInteger index = [self.controllers indexOfObject:pageViewController.viewControllers.firstObject];
    [self.titleView transToIndex:index];
}

#pragma mark - lazyload
- (UIPageViewController *)pageViewController{
    if (!_pageViewController) {
        
        NSDictionary *options = [NSDictionary dictionaryWithObject:[NSNumber numberWithInteger:UIPageViewControllerSpineLocationNone] forKey:UIPageViewControllerOptionSpineLocationKey];
        _pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:options];
        _pageViewController.delegate = self;
        _pageViewController.dataSource = self;
        [_pageViewController setViewControllers:@[self.controllers.firstObject] direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
        
    }
    return _pageViewController;
}

/** 推荐 分类 广播 榜单 主播*/
- (NSMutableArray *)controllers{
    if (!_controllers) {
        _controllers = [@[] mutableCopy];
        
        for (NSInteger i=0; i<self.subTitleArray.count; i++) {
            XMLYBaseController *controller = [XMLYFindFactory findSubtitleControllerWithIdentifier:self.subTitleArray[i]];
            [_controllers addObject:controller];
        }
    }
    return _controllers;
}
- (FindSubTitleView *)titleView{
    if (!_titleView) {
        _titleView  = [[FindSubTitleView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, 40)];
    }
    return _titleView;
}

- (NSMutableArray *)subTitleArray{
    if (!_subTitleArray) {
        _subTitleArray = [[NSMutableArray alloc]initWithObjects:@"推荐",@"分类",@"广播",@"榜单",@"主播", nil];
    }
    return _subTitleArray;
}
@end
