//
//  FindRecommedHeaderView.m
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/22.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "FindRecommedHeaderView.h"
#import "XMLYFindRecommendModel.h"
#import "XMLYFindHotGuessModel.h"
#import "HeaderIconView.h"

@interface FindRecommedHeaderView () <SDCycleScrollViewDelegate>

@property (nonatomic, strong) SDCycleScrollView *scrollImgview;
@property (nonatomic, strong) UIScrollView *scrollHotView;
@end

@implementation FindRecommedHeaderView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = RGB(0xe6e7e9, 1);
        [self addSubview:self.scrollImgview];
        [self addSubview:self.scrollHotView];
    }
    return self;
}

- (UIView *)scrollImgview{
    if (!_scrollImgview) {
        _scrollImgview = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreenWidth, 150) delegate:self placeholderImage:nil];
    }
    return _scrollImgview;
}

- (UIScrollView *)scrollHotView{
    if (!_scrollHotView) {
        _scrollHotView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 150, kScreenWidth, 90)];
        _scrollHotView.showsHorizontalScrollIndicator = NO;
        _scrollHotView.pagingEnabled = NO;
        _scrollHotView.backgroundColor = [UIColor whiteColor];
        
    }
    return _scrollHotView;
}


/**  传入的是XMLYFocusImagesDetailModel模型数组，需要取出里面url */
- (void)setImgUrlArray:(NSMutableArray *)imgUrlArray{
    NSMutableArray *urlArray = [@[] mutableCopy];
    for (XMLYFocusImagesDetailModel *model in imgUrlArray) {
        [urlArray addObject:model.pic];
    }
    self.scrollImgview.imageURLStringsGroup = urlArray;
}

- (void)setHotArray:(NSMutableArray *)hotArray{
    _hotArray = hotArray;
    for (NSInteger i=0; i<hotArray.count; i++) {
        HeaderIconView *view = [[HeaderIconView alloc]initWithFrame:CGRectMake(i*70, 0, 70, 90)];
        
        XMLYHotDiscoveryColumnsDetailModel *model = hotArray[i];
        view.detailModel = model;
        [_scrollHotView addSubview:view];
    }
    
    self.scrollHotView.contentSize = CGSizeMake(hotArray.count*70, 90);
}
@end
