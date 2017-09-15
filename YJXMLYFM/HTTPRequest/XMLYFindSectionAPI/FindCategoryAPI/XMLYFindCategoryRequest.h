//
//  XMLYFindCategoryRequest.h
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/9/15.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "XMLYBaseRequest.h"

@interface XMLYFindCategoryRequest : XMLYBaseRequest

+ (void)requestFoot:(void(^)(id response))response;
+ (void)requestCategory:(void(^)(id response))response;
@end
