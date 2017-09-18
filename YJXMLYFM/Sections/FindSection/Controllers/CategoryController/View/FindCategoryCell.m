//
//  FindCategoryCell.m
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/9/18.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "FindCategoryCell.h"

@interface FindCategoryCell ()

@property (nonatomic, strong) UIImageView *leftImage;
@property (nonatomic, strong) UILabel *leftLabel;
@property (nonatomic, strong) UIImageView *rightImage;
@property (nonatomic, strong) UILabel *rightLabel;
@property (nonatomic, strong) UIView *middleView;
@end

@implementation FindCategoryCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.middleView];
        [self addSubview:self.leftImage];
        [self addSubview:self.leftLabel];
        [self addSubview:self.rightImage];
        [self addSubview:self.rightLabel];
    }
    return self;
}

- (void)setLeftListModel:(findCategoryListItemModel *)leftListModel{
    [self.leftImage sd_setImageWithURL:[NSURL URLWithString:leftListModel.coverPath]];
    self.leftLabel.text = leftListModel.title;
}

- (void)setRightListModel:(findCategoryListItemModel *)rightListModel{
    [self.rightImage sd_setImageWithURL:[NSURL URLWithString:rightListModel.coverPath]];
    self.rightLabel.text = rightListModel.title;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_middleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(0.5);
        make.height.mas_equalTo(27);
        make.centerX.mas_equalTo(self);
        make.centerY.mas_equalTo(self);
    }];
    
    [_leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self).offset(25);
        make.centerY.mas_equalTo(self);
    }];
    
    [_leftImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_leftLabel.mas_right).offset(15);
        make.centerY.mas_equalTo(self);
        make.width.height.mas_equalTo(30);
    }];
    
    [_rightImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_middleView.mas_right).offset(25);
        make.centerY.mas_equalTo(self);
        make.width.height.mas_equalTo(30);
    }];
    
    [_rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_rightImage.mas_right).offset(15);
        make.centerY.mas_equalTo(self);
    }];
}

#pragma mark - lazyload
-  (UIView *)middleView{
    if (!_middleView) {
        _middleView = [[UIView alloc]init];
        _middleView.backgroundColor = [UIColor redColor];
    }
    return _middleView;
}

- (UIImageView *)leftImage{
    if (!_leftImage) {
        _leftImage = [[UIImageView alloc]init];
    }
    return _leftImage;
}

- (UILabel *)leftLabel{
    if (!_leftLabel) {
        _leftLabel = [[UILabel alloc]init];
        _leftLabel.font = [UIFont systemFontOfSize:14];
    }
    return _leftLabel;
}

- (UIImageView *)rightImage{
    if (!_rightImage) {
        _rightImage = [[UIImageView alloc]init];
    }
    return _rightImage;
}

- (UILabel *)rightLabel{
    if (!_rightLabel) {
        _rightLabel = [[UILabel alloc]init];
        _rightLabel.font = [UIFont systemFontOfSize:14];
    }
    return _rightLabel;
}
@end
