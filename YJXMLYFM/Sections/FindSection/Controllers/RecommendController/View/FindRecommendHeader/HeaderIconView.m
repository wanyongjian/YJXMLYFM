//
//  HeaderIconView.m
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/23.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "HeaderIconView.h"

@interface HeaderIconView ()

@property (nonatomic,strong) UIImageView *imgview;
@property (nonatomic,strong) UILabel *titleLabel;
@end

@implementation HeaderIconView

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.imgview];
        [self addSubview: self.titleLabel];
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_imgview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(43);
        make.height.mas_equalTo(43);
        make.top.mas_equalTo(self).offset(16);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
    
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self);
        make.height.mas_equalTo(15);
        make.top.mas_equalTo(_imgview.mas_bottom).offset(10);
    }];
    
    
}

- (void)setDetailModel:(XMLYHotDiscoveryColumnsDetailModel *)detailModel{
    _detailModel = detailModel;
    _titleLabel.text = detailModel.title;
    
    NSURL *imgUrl = [NSURL URLWithString:detailModel.coverPath];
    [_imgview sd_setImageWithURL:imgUrl placeholderImage:nil];
}

#pragma mark - lazyload
- (UIImageView *)imgview{
    if (!_imgview) {
        _imgview = [[UIImageView alloc]init];
    }
    return _imgview;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel  = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.textColor = [UIColor blackColor];
    }
    return _titleLabel;
}
@end
