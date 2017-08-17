//
//  RootController.m
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/15.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "RootController.h"
#import "FindViewController.h"


/** 播放按钮高出tabbar的长度*/
#define BtnPlusLength 10

@interface RootController ()

/** 控制器数组 */
@property (nonatomic, strong) NSMutableArray *controllerArray;
/** tabbar背景 */
@property (nonatomic, strong) UIImageView *tabbarBackImgview;
/** tabbar按钮数组 */
@property (nonatomic, strong) NSMutableArray *tabbarButtonArray;
/** tabbar按钮图片数组 */
@property (nonatomic, strong) NSMutableArray *buttonNormalImgArray;
@property (nonatomic, strong) NSMutableArray *buttonSelectImgArray;


@end




@implementation RootController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self customTabbar];
    [self addControllers];
    self.viewControllers = self.controllerArray;
    
}

- (void)customTabbar{
    self.tabBar.hidden = YES;
    [self.view addSubview:self.tabbarImgview];
   
    CGFloat divWidth = kScreenWidth/5.0f;
    
    for (NSInteger i=0; i<5; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.adjustsImageWhenHighlighted = NO;
        [button setImage:self.buttonNormalImgArray[i] forState:UIControlStateNormal];
        [button setImage:self.buttonSelectImgArray[i] forState:UIControlStateSelected];
        if (i == 2) { /** 播放按钮高出10像素 */
            button.frame = CGRectMake(kScreenWidth/2-(kTabbarHeight+BtnPlusLength)/2, -BtnPlusLength, kTabbarHeight+BtnPlusLength, kTabbarHeight+BtnPlusLength);
            [button setBackgroundImage:[UIImage imageNamed:@"tabbar_np_normal"] forState:UIControlStateNormal];
        }else{
            button.frame = CGRectMake(divWidth*i, 0, divWidth, kTabbarHeight);
        }
        [button addTarget:self action:@selector(tabbarButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self.tabbarImgview addSubview:button];
        [self.tabbarButtonArray addObject:button];
    }
}

- (void)tabbarButtonClicked:(UIButton *)sender{
    NSInteger index = [self.tabbarButtonArray indexOfObject:sender];
    sender.selected = YES;
    /** 其它按钮置为非选中状态 */
    for (UIButton *btn in self.tabbarButtonArray) {
        if (btn == sender) {
            continue;
        }
        btn.selected = NO;
    }
    
    if (index == 2) {
        /**  跳转到播放界面 */
    }else{
        self.selectedIndex = index;
    }
}

- (void)creatControllerWithController:(UIViewController *)controller property:(NSDictionary*)dict{
    
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:controller];
    controller.title = dict[@"title"];
    
    [self.controllerArray addObject:nav];
}

- (NSMutableArray *)controllerArray{
    if (!_controllerArray) {
        _controllerArray = [@[] mutableCopy];
    }
    return _controllerArray;
}

- (void)addControllers{
    FindViewController *findCon = [[FindViewController alloc]init];
    [self creatControllerWithController:findCon property:@{@"title":@"发现"}];
    
    UIViewController *subscribeCon = [[UIViewController alloc]init];
    [self creatControllerWithController:subscribeCon property:@{@"title":@"订阅"}];
    
    UIViewController *playCon = [[UIViewController alloc]init];
    [self creatControllerWithController:playCon property:@{@"title":@"播放"}];
    
    UIViewController *downloadCon = [[UIViewController alloc]init];
    [self creatControllerWithController:downloadCon property:@{@"title":@"下载"}];
    
    UIViewController *mineCon = [[UIViewController alloc]init];
    [self creatControllerWithController:mineCon property:@{@"title":@"我的"}];
}

- (UIImageView *)tabbarImgview{
    if (!_tabbarBackImgview) {
        _tabbarBackImgview = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tabbar_bg"]];
        _tabbarBackImgview.frame = CGRectMake(0, kScreenHeight-kTabbarHeight, kScreenWidth, kTabbarHeight);
        _tabbarBackImgview.userInteractionEnabled = YES;
    }
    return _tabbarBackImgview;
}

- (NSMutableArray *)tabbarButtonArray{
    if (!_tabbarButtonArray) {
        _tabbarButtonArray = [@[] mutableCopy];
    }
    return _tabbarButtonArray;
}

- (NSMutableArray *)buttonNormalImgArray{
    if (!_buttonNormalImgArray) {
        _buttonNormalImgArray = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"tabbar_find_n"],
                                                                        [UIImage imageNamed:@"tabbar_sound_n"],
                                                                        [UIImage imageNamed:@"tabbar_np_playnon"],
                                                                        [UIImage imageNamed:@"tabbar_download_n"],
                                                                        [UIImage imageNamed:@"tabbar_me_n"],nil];
        
    }
    return _buttonNormalImgArray;
}

- (NSMutableArray *)buttonSelectImgArray{
    if (!_buttonSelectImgArray) {
        _buttonSelectImgArray = [[NSMutableArray alloc] initWithObjects:[UIImage imageNamed:@"tabbar_find_h"],
                                                                         [UIImage imageNamed:@"tabbar_sound_h"],
                                                                         [UIImage imageNamed:@"tabbar_np_playnon"],
                                                                         [UIImage imageNamed:@"tabbar_download_h"],
                                                                         [UIImage imageNamed:@"tabbar_me_h"],nil];
    }
    return _buttonSelectImgArray;
}
@end
