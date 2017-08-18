//
//  XMLYBaseRequest.h
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/18.
//  Copyright © 2017年 eco. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XMLYBaseRequest : NSObject


+ (void)requestDataWithURL:(NSString *)url Paraments:(NSDictionary *)parament response:(void(^)(id success))success failue:(void(^)(id failue))failue;

@end
