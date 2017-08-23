//
//  FindCellFeeItemView.m
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/23.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "FindCellFeeItemView.h"

@implementation FindCellFeeItemView

- (instancetype)init{
    if (self = [super init]) {
        [self addSubview:self.imageView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.authorLabel];
        [self addSubview:self.playIconImgview];
    }
    return  self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self);
        make.height.mas_equalTo(93);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_imageView.mas_left);
        make.right.mas_equalTo(_imageView.mas_right);
        make.top.mas_equalTo(_imageView.mas_bottom).offset(12);
        make.height.mas_equalTo(35);
    }];
    
    [_playIconImgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.width.mas_equalTo(10);
        make.left.mas_equalTo(_imageView.mas_left);
        make.top.mas_equalTo(_titleLabel.mas_bottom).offset(10);
    }];
    
    [_authorLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(15);
        make.left.mas_equalTo(_playIconImgview.mas_left).offset(5);
        make.right.mas_equalTo(_imageView.mas_right);
        make.centerY.mas_equalTo(_playIconImgview.mas_centerY);
    }];
}

#pragma mark - lazyload
- (UIImageView *)imageView{
    if (!_imageView) {
        _imageView  = [[UIImageView alloc]init];
    }
    return _imageView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.numberOfLines = 2;
    }
    return _titleLabel;
}

- (UILabel *)authorLabel{
    if (!_authorLabel) {
        _authorLabel = [[UILabel alloc]init];
        _authorLabel.font = [UIFont systemFontOfSize:10];
        _authorLabel.textColor = [UIColor darkGrayColor];
    }
    return _authorLabel;
}

- (UIImageView *)playIconImgview{
    if (!_playIconImgview) {
        _playIconImgview  = [[UIImageView alloc]init];
        [_playIconImgview setImage:[UIImage imageNamed:@"find_specialicon"]];
    }
    return _playIconImgview;
}

@end
