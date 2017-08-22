//
//  XMLYBaseRequest.m
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/18.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "XMLYBaseRequest.h"
@implementation XMLYBaseRequest



+ (void)requestDataWithURL:(NSString *)url Paraments:(NSDictionary *)parament response:(void (^)(id))success failue:(void (^)(id))failue{
    
    NSURLSessionConfiguration *config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.timeoutIntervalForRequest = 30;
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:config];
    
    [manager GET:url parameters:parament progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        success(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failue(error);
    }];
    
    
}
@end
