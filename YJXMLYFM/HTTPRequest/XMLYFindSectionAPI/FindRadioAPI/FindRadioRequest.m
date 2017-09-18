//
//  FindRadioRequest.m
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/9/18.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "FindRadioRequest.h"
static NSString *const kXMLYRadioAPI = @"http://live.ximalaya.com/live-web/v4/homepage?device=iPhone";
@implementation FindRadioRequest


+ (void)requestFindRadio:(void (^)(id))response{
    [XMLYBaseRequest requestDataWithURL:kXMLYRadioAPI Paraments:nil response:^(id success) {
        response(success);
    } failue:^(id failue) {
        
    }];
}
@end
