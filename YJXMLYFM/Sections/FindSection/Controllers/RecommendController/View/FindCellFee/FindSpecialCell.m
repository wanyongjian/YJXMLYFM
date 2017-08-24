//
//  FindSpecialCell.m
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/24.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "FindSpecialCell.h"

@interface FindSpecialCell ()

@property (nonatomic,strong) UIImageView *imgView;
@property (nonatomic,strong) UILabel *titleLabel;
@property (nonatomic,strong) UILabel *subTitleLabel;
@property (nonatomic,strong) UILabel *introLabel;

@end

@implementation FindSpecialCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.imgView];
        [self addSubview:self.titleLabel];
        [self addSubview:self.subTitleLabel];
        [self addSubview:self.introLabel];
    }
    return self;
}

- (void)setSpecialModel:(XMLYSpecialColumnDetailModel *)specialModel{
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:specialModel.coverPath] placeholderImage:nil];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [_imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(5);
        make.left.mas_equalTo(self).offset(10);
        make.bottom.mas_equalTo(self).offset(-5);
        make.width.height.mas_equalTo(70);
    }];
    
    
}

#pragma mark - lazyload

- (UIImageView *)imgView{
    if (!_imgView) {
        _imgView = [[UIImageView alloc]init];
    }
    return _imgView;
}

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = [UIColor blackColor];
        _titleLabel.font = [UIFont systemFontOfSize:16];
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel{
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc]init];
        _subTitleLabel.textColor = [UIColor grayColor];
        _subTitleLabel.font = [UIFont systemFontOfSize:13];
    }
    return _titleLabel;
}

- (UILabel *)introLabel{
    if (!_introLabel) {
        _introLabel = [[UILabel alloc]init];
        _introLabel.textColor = [UIColor grayColor];
        _introLabel.font = [UIFont systemFontOfSize:13];
    }
    return _introLabel;
}
@end
