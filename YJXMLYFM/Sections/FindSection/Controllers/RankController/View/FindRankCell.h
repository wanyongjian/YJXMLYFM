//
//  FindRankCell.h
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/10/18.
//  Copyright © 2017年 eco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FindRankModel.h"

@interface FindRankCell : UITableViewCell
@property (nonatomic, strong) FindRankDetailModel *model;

+ (instancetype)findRankModelCell:(UITableView *)tableView;
@end
