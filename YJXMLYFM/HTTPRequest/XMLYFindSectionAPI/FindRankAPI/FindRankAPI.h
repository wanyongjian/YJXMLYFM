//
//  FindRankAPI.h
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/10/18.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "XMLYBaseRequest.h"

@interface FindRankAPI : XMLYBaseRequest
+ (void)requestRankResponse:(void(^)(id response))response;
@end
