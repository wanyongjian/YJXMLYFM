//
//  FindRadioViewModel.m
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/9/18.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "FindRadioViewModel.h"
#import "FindRadioRequest.h"

@implementation FindRadioViewModel

- (instancetype)init{
    if (self = [super init]) {
        self.radioUpdateSignal = [RACSubject subject];
    }
    return self;
}

- (void)refreshData{
    RACSignal *radioSignal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
       [self requestRadioData:^{
           [subscriber sendNext:nil];
       }];
        return nil;
    }];
    
    
    [radioSignal subscribeNext:^(id x) {
        [self.radioUpdateSignal sendNext:nil];
    }];
}

- (void)requestRadioData:(void(^)())complete{
    
    [FindRadioRequest requestFindRadio:^(id response) {
       /** 数据转模型*/
        [FindRadioModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"topRadios":@"radioTopModel",@"categories":@"radioCategoryModel",@"localRadios":@"radioLocalModel"};
        }];
        
        self.radioModel = [FindRadioModel mj_objectWithKeyValues:response[@"data"]];
        complete();
    }];
}
@end
