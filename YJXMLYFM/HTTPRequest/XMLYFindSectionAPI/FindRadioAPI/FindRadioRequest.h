//
//  FindRadioRequest.h
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/9/18.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "XMLYBaseRequest.h"

@interface FindRadioRequest : XMLYBaseRequest

+ (void)requestFindRadio:(void(^)(id response))response;
@end
