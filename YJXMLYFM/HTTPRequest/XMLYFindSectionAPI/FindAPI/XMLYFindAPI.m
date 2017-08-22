//
//  XMLYFindAPI.m
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/22.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "XMLYFindAPI.h"

#define kRecommendAPI @"http://mobile.ximalaya.com/mobile/discovery/v4/recommends?channel=ios-b1&device=iPhone&includeActivity=true&includeSpecial=true&scale=2&version=5.4.21"

@implementation XMLYFindAPI


+ (void)requestWithRecommend:(void (^)(id))complete{
    
    [XMLYBaseRequest requestDataWithURL:kRecommendAPI Paraments:nil response:^(id success) {
        complete(success);
    } failue:^(id failue) {
        
    }];
}
@end
