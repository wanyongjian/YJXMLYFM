//
//  FindCellLive.m
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/24.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "FindCellLive.h"

@interface FindCellLive () <SDCycleScrollViewDelegate>
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *findSectionLogo;
@property (nonatomic, strong) UIButton *moreBtn;

@property (nonatomic, strong) SDCycleScrollView *scrollView;
@property (nonatomic, strong) UILabel *peopleCountLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UILabel *subContentLabel;
@end




@implementation FindCellLive

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]){
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addSubview:self.titleLabel];
        [self addSubview:self.findSectionLogo];
        [self addSubview:self.moreBtn];
        
        [self addSubview:self.scrollView];
        [self addSubview:self.peopleCountLabel];
        [self addSubview:self.contentLabel];
        [self addSubview:self.subContentLabel];
    }
    return self;
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
    
}


- (void)setLiveModel:(XMLYFindLiveModel *)liveModel{
    
    /** 拼接图片URL数组*/
    NSMutableArray *imgUrlArray = [@[] mutableCopy];
    for (NSInteger i=0; i<liveModel.data.count; i++) {
        XMLYFindLiveDetailModel *detailModel = liveModel.data[i];
        NSString *url = detailModel.coverPath;
        [imgUrlArray addObject:url];
    }
    self.scrollView.imageURLStringsGroup = imgUrlArray;
    
    
    XMLYFindLiveDetailModel *firstModel = liveModel.data[0];
    self.peopleCountLabel.text = [NSString stringWithFormat:@"%ld人参加",(long)firstModel.playCount];
    self.contentLabel.text = firstModel.name;
    self.subContentLabel.text = firstModel.shortDescription;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(23);
        make.top.mas_equalTo(self).offset(18);
        make.height.mas_equalTo(15);
    }];
    [_findSectionLogo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.height.mas_equalTo(10);
        make.centerY.mas_equalTo(_titleLabel);
        make.left.mas_equalTo(self).mas_equalTo(10);
    }];
    
    [_moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(10);
        make.top.mas_equalTo(self).offset(12);
        make.right.mas_equalTo(self).offset(-10);
        make.height.mas_equalTo(25);
    }];
    
    [_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(10);
        make.right.mas_equalTo(self).offset(-10);
        make.top.mas_equalTo(_titleLabel.mas_bottom).offset(13);
        make.height.mas_equalTo(108);
    }];
    
    [_peopleCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(_scrollView.mas_right);
        make.height.mas_equalTo(14);
        make.width.mas_equalTo(78);
        make.top.mas_equalTo(_scrollView.mas_bottom).offset(14);
    }];
    
    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_scrollView.mas_left);
        make.right.mas_equalTo(_peopleCountLabel).offset(-10);
        make.centerY.mas_equalTo(_peopleCountLabel.mas_centerY);
        make.height.mas_equalTo(18);
    }];
    
    [_subContentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_scrollView.mas_left);
        make.right.mas_equalTo(_scrollView.mas_right);
        make.top.mas_equalTo(_contentLabel.mas_bottom).offset(10);
        make.height.mas_equalTo(14);
    }];
}


#pragma mark - lazyload

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.text = @"现场直播";
        _titleLabel.font = [UIFont systemFontOfSize:15];
    }
    return _titleLabel;
}

- (UIImageView *)findSectionLogo{
    if (!_findSectionLogo) {
        _findSectionLogo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"findsection_logo"]];
    }
    return _findSectionLogo;
}

- (UIButton *)moreBtn{
    if (!_moreBtn) {
        _moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_moreBtn setImage:[UIImage imageNamed:@"liveRadioSectionMore_Normal"] forState:UIControlStateNormal];
        _moreBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    }
    return _moreBtn;
}

- (SDCycleScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, kScreenWidth-20, 108) delegate:self placeholderImage:nil];
        _scrollView.autoScrollTimeInterval = 1;
        _scrollView.autoScroll = YES;
    }
    return _scrollView;
}

- (UILabel *)peopleCountLabel{
    if (!_peopleCountLabel) {
        _peopleCountLabel = [[UILabel alloc]init];
        _subContentLabel.textColor = [UIColor grayColor];
        _peopleCountLabel.font = [UIFont systemFontOfSize:11];
    }
    return _peopleCountLabel;
}

- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc]init];
        _contentLabel.textColor = [UIColor blackColor];
        _contentLabel.font = [UIFont systemFontOfSize:15];
    }
    return _contentLabel;
}

- (UILabel *)subContentLabel{
    if (!_subContentLabel) {
        _subContentLabel = [[UILabel alloc]init];
        _subContentLabel.textColor = [UIColor grayColor];
        _subContentLabel.font = [UIFont systemFontOfSize:12];
    }
    return _subContentLabel;
}
@end
