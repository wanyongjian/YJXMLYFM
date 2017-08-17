//
//  FindSubTitleView.m
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/17.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "FindSubTitleView.h"

#define kSystemOriginColor [UIColor colorWithRed:0.96f green:0.39f blue:0.26f alpha:1.00f]
#define kSystemBlackColor  [UIColor colorWithRed:0.38f green:0.39f blue:0.40f alpha:1.00f]


@interface FindSubTitleView ()

@property (nonatomic, strong) NSMutableArray *titleArray;
@property (nonatomic, strong) NSMutableArray *titleButtonArray;
@property (nonatomic, strong) UIView *sliderView;
@end





@implementation FindSubTitleView


- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        
        [self addSubview:self.sliderView];
        [self createButtonWithTitle:self.titleArray];
    }
    return self;
}

- (void)createButtonWithTitle:(NSMutableArray *)titleArray{
    
    CGFloat divWidth = kScreenWidth/titleArray.count;
    for (NSInteger i=0; i<titleArray.count; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:button];
        [self.titleButtonArray addObject:button];
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:kSystemBlackColor forState:UIControlStateNormal];
        [button setTitleColor:kSystemOriginColor forState:UIControlStateSelected];
        button.titleLabel.font = [UIFont systemFontOfSize:15];
        button.frame = CGRectMake(divWidth*i, 0, divWidth, 38);
        [button addTarget:self action:@selector(titleButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    /**  初始选中第一个*/
    [self titleButtonClicked:self.titleButtonArray[0]];
}

- (void)titleButtonClicked:(UIButton *)sender{
    sender.selected = YES;
    
    NSInteger index = [self.titleButtonArray indexOfObject:sender];
    for (UIButton *btn in self.titleButtonArray) {
        if (btn == sender) {
            continue;
        }
        btn.selected = NO;
    }
    
    /** sliderview 动画 */
    [UIView animateWithDuration:0.25 animations:^{
        self.sliderView.frame = CGRectMake(CGRectGetMinX(sender.frame)+sender.frame.size.width/2-15, 38, 30, 2);
    }];
    
    if ([self.delegate respondsToSelector:@selector(subTitleSelectedAtIndex:)]) {
        [self.delegate subTitleSelectedAtIndex:index];
    }
}


- (NSMutableArray *)titleArray{
    if (!_titleArray) {
        _titleArray = [[NSMutableArray alloc]initWithObjects:@"推荐",@"分类",@"广播",@"榜单",@"主播", nil];
    }
    return _titleArray;
}
- (NSMutableArray *)titleButtonArray{
    if (!_titleButtonArray) {
        _titleButtonArray = [@[] mutableCopy];
    }
    return _titleButtonArray;
}

- (UIView *)sliderView{
    if (!_sliderView) {
        _sliderView = [[UIView alloc]init];
        _sliderView.backgroundColor = kSystemOriginColor;
        _sliderView.frame = CGRectMake(kScreenWidth/self.titleButtonArray.count/2-30/2, 38, 30, 2);
    }
    return _sliderView;
}
@end
