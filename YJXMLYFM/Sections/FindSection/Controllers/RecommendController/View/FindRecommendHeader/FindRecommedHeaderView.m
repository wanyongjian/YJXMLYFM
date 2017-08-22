//
//  FindRecommedHeaderView.m
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/22.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "FindRecommedHeaderView.h"
#import "XMLYFindRecommendModel.h"
#import "SDCycleScrollView.h"

@interface FindRecommedHeaderView () <SDCycleScrollViewDelegate>

@property (nonatomic, strong) SDCycleScrollView *scrollImgview;
@end

@implementation FindRecommedHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = RGB(0xe6e7e9, 1);
        [self addSubview:self.scrollImgview];
    }
    return self;
}

- (UIView *)scrollImgview{
    if (!_scrollImgview) {
        _scrollImgview = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreenWidth, 150) delegate:self placeholderImage:nil];
    }
    return _scrollImgview;
}

/**  传入的是XMLYFocusImagesDetailModel模型数组，需要取出里面url */
- (void)setImgUrlArray:(NSMutableArray *)imgUrlArray{
    NSMutableArray *urlArray = [@[] mutableCopy];
    for (XMLYFocusImagesDetailModel *model in imgUrlArray) {
        [urlArray addObject:model.pic];
    }
    self.scrollImgview.imageURLStringsGroup = urlArray;
}
@end
