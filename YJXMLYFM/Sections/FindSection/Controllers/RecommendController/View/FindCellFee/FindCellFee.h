//
//  FindCellFee.h
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/23.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "FindBaseCell.h"
#import "XMLYFindRecommendModel.h"
#import "XMLYFindHotGuessModel.h"

@interface FindCellFee : FindBaseCell

@property (nonatomic, strong) XMLYEditorRecommendAlbumsModel *recommendModel;
@property (nonatomic, strong) XMLYHotRecommendDetailModel *hotRecommendModel;
@end
