//
//  XMLYFindCategoryRequest.m
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/9/15.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "XMLYFindCategoryRequest.h"
#define kCategoryFooterAPI @"http://adse.ximalaya.com/ting?appid=0&device=iPhone&name=find_banner&network=WIFI&operator=3&scale=2&version=5.4.27"
#define kCategoryItemsAPI @"http://mobile.ximalaya.com/mobile/discovery/v2/categories?channel=ios-b1&code=43_110000_1100&device=iPhone&picVersion=13&scale=2&version=5.4.27"


@implementation XMLYFindCategoryRequest


+ (void)requestFoot:(void (^)(id))response{
    [XMLYBaseRequest requestDataWithURL:kCategoryFooterAPI Paraments:nil response:^(id success) {
        response(success);
    } failue:^(id failue) {
        
    }];
}

+ (void)requestCategory:(void (^)(id))response{
    [XMLYBaseRequest requestDataWithURL:kCategoryItemsAPI Paraments:nil response:^(id success) {
        response(success);
    } failue:^(id failue) {
        
    }];
}
@end
