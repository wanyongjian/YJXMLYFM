//
//  XMLYFindAPI.h
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/22.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "XMLYBaseRequest.h"

@interface XMLYFindAPI : XMLYBaseRequest


+ (void)requestWithRecommend:(void(^)(id response))complete;

+ (void)requestWithHotAndGuess:(void(^)(id response))complete;

+ (void)requestWithLiveRecommend:(void(^)(id response))complete;
@end
