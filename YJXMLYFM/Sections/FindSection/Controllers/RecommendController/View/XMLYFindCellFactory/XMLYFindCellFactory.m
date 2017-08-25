//
//  XMLYFindCellFactory.m
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/25.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "XMLYFindCellFactory.h"

@implementation XMLYFindCellFactory

+ (FindBaseCell *)cellByFactory:(UITableView *)tableView type:(FindCellTYpe)type{
    FindBaseCell *cell;
    if (type == FindCellTypeFee) {
        NSString *useID = NSStringFromClass([FindCellFee class]);
        cell = [tableView dequeueReusableCellWithIdentifier:useID];
        if (!cell) {
            cell = [[FindCellFee alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:useID];
        }
    }else if (type == FindCellTypeLive){
        NSString *useID = NSStringFromClass([FindCellLive class]);
        cell = [tableView dequeueReusableCellWithIdentifier:useID];
        if (!cell) {
            cell = [[FindCellLive alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:useID];
        }
    }else if (type == FindCellTypeSpecial){
        NSString *useID = NSStringFromClass([FindSpecialCell class]);
        cell = [tableView dequeueReusableCellWithIdentifier:useID];
        if (!cell) {
            cell = [[FindSpecialCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:useID];
        }
    }
    
    return cell;
}
@end
