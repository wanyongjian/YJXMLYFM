//
//  XMLYFindCellFactory.h
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/25.
//  Copyright © 2017年 eco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FindBaseCell.h"

#import "FindCellFee.h"
#import "FindCellLive.h"
#import "FindSpecialCell.h"

typedef NS_ENUM(NSInteger,FindCellTYpe) {
    FindCellTypeFee = 0,
    FindCellTypeLive = 1,
    FindCellTypeSpecial = 2
};

@interface XMLYFindCellFactory : NSObject

+ (FindBaseCell*)cellByFactory:(UITableView*)tableView type:(FindCellTYpe)type;
@end
