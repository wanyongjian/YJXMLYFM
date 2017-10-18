//
//  FindRankAPI.m
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/10/18.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "FindRankAPI.h"

static NSString *const kXMLYRankAPI = @"http://mobile.ximalaya.com/mobile/discovery/v2/rankingList/group?channel=ios-b1&device=iPhone&includeActivity=true&includeSpecial=true&scale=2&version=5.4.27";

@implementation FindRankAPI

+ (void)requestRankResponse:(void (^)(id))response{
    [XMLYBaseRequest requestDataWithURL:kXMLYRankAPI Paraments:nil response:^(id success) {
        response(success);
    } failue:^(id failue) {
        
    }];
}
@end
