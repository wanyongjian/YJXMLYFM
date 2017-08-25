//
//  FindCellFee.m
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/23.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "FindCellFee.h"
#import "FindCellFeeItemView.h"

@interface FindCellFee ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIImageView *findSectionLogo;
@property (nonatomic, strong) UIButton *moreBtn;
@property (nonatomic, strong) FindCellFeeItemView *leftItemView;
@property (nonatomic, strong) FindCellFeeItemView *rightItemView;
@property (nonatomic, strong) FindCellFeeItemView *middleItemView;
@end




@implementation FindCellFee

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addSubview:self.titleLabel];
        [self addSubview:self.findSectionLogo];
        [self addSubview:self.moreBtn];
        
        [self addSubview:self.leftItemView];
        [self addSubview:self.middleItemView];
        [self addSubview:self.rightItemView];
    }
    return self;
}

- (void)setHotRecommendModel:(XMLYHotRecommendDetailModel *)hotRecommendModel{
    _hotRecommendModel = hotRecommendModel;
    self.titleLabel.text = hotRecommendModel.title;
    
    for (NSInteger i=0; i<hotRecommendModel.list.count; i++) {
        XMLYEditorRecommendAlbumsDetailModel *model = hotRecommendModel.list[i];
        
        if (i==0) {
            [self.leftItemView.imageView sd_setImageWithURL:[NSURL URLWithString:model.coverMiddle] placeholderImage:[UIImage imageNamed:@"find_usercover"]];
            self.leftItemView.titleLabel.text = model.intro;
            self.leftItemView.authorLabel.text = model.title;
        }else if (i==1){
            [self.middleItemView.imageView sd_setImageWithURL:[NSURL URLWithString:model.coverMiddle] placeholderImage:[UIImage imageNamed:@"find_usercover"]];
            self.middleItemView.titleLabel.text = model.intro;
            self.middleItemView.authorLabel.text = model.title;
        }else if (i==2){
            [self.rightItemView.imageView sd_setImageWithURL:[NSURL URLWithString:model.coverMiddle] placeholderImage:[UIImage imageNamed:@"find_usercover"]];
            self.rightItemView.titleLabel.text = model.intro;
            self.rightItemView.authorLabel.text = model.title;
        }
    }
}

- (void)setRecommendModel:(XMLYEditorRecommendAlbumsModel *)recommendModel{
    _recommendModel = recommendModel;
    self.titleLabel.text = recommendModel.title;
    
    for (NSInteger i=0; i<recommendModel.list.count; i++) {
        XMLYEditorRecommendAlbumsDetailModel *model = recommendModel.list[i];
        if (i==0) {
            [self.leftItemView.imageView sd_setImageWithURL:[NSURL URLWithString:model.coverMiddle] placeholderImage:[UIImage imageNamed:@"find_usercover"]];
            self.leftItemView.titleLabel.text = model.intro;
            self.leftItemView.authorLabel.text = model.title;
        }else if (i==1){
            [self.middleItemView.imageView sd_setImageWithURL:[NSURL URLWithString:model.coverMiddle] placeholderImage:[UIImage imageNamed:@"find_usercover"]];
            self.middleItemView.titleLabel.text = model.intro;
            self.middleItemView.authorLabel.text = model.title;
        }else if (i==2){
            [self.rightItemView.imageView sd_setImageWithURL:[NSURL URLWithString:model.coverMiddle] placeholderImage:[UIImage imageNamed:@"find_usercover"]];
            self.rightItemView.titleLabel.text = model.intro;
            self.rightItemView.authorLabel.text = model.title;
        }
    }
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
    
    [_middleItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(93);
        make.bottom.mas_equalTo(self.mas_bottom);
        make.top.mas_equalTo(_titleLabel.mas_bottom).offset(17);
        make.centerX.mas_equalTo(self.mas_centerX);
    }];
    
    [_leftItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(93);
        make.bottom.mas_equalTo(self.mas_bottom);
        make.top.mas_equalTo(_titleLabel.mas_bottom).offset(17);
        make.right.mas_equalTo(_middleItemView.mas_left).offset(-(kScreenWidth-93*3)/4);
    }];
    
    [_rightItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(93);
        make.bottom.mas_equalTo(self.mas_bottom);
        make.top.mas_equalTo(_titleLabel.mas_bottom).offset(17);
        make.left.mas_equalTo(_middleItemView.mas_right).offset((kScreenWidth-93*3)/4);
    }];
}
#pragma mark - lazyload

- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = [UIColor blackColor];
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

- (FindCellFeeItemView *)leftItemView{
    if (!_leftItemView) {
        _leftItemView = [[FindCellFeeItemView alloc]init];
    }
    return _leftItemView;
}

- (FindCellFeeItemView *)middleItemView{
    if (!_middleItemView) {
        _middleItemView = [[FindCellFeeItemView alloc]init];
    }
    return _middleItemView;
}
- (FindCellFeeItemView *)rightItemView{
    if (!_rightItemView) {
        _rightItemView = [[FindCellFeeItemView alloc]init];
    }
    return _rightItemView;
}

@end
