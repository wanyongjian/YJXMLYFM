//
//  FindCategoryCell.h
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/9/18.
//  Copyright © 2017年 eco. All rights reserved.
//


#import "FindBaseCell.h"
#import "XMLYFindCategoryModel.h"

@interface FindCategoryCell : FindBaseCell

@property (nonatomic, strong) findCategoryListItemModel *leftListModel;
@property (nonatomic, strong) findCategoryListItemModel *rightListModel;
@end
