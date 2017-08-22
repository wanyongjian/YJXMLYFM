//
//  FindRecommendViewModel.m
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/22.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "FindRecommendViewModel.h"
#import "XMLYFindAPI.h"

@interface FindRecommendViewModel()


@end
@implementation FindRecommendViewModel

- (instancetype)init{
    if (self = [super init]) {
        self.updateContentSignal = [RACSubject subject];
    }
    return self;
}


- (void)refreshDataSource{
    @weakify(self)
    RACSignal *signalRecommend = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self)
        [self requestRecommend:^{
            [subscriber sendNext:nil];
        }];
        return nil;
    }];
    
   [[RACSignal combineLatest:@[signalRecommend]] subscribeNext:^(id x) {
       [self.updateContentSignal sendNext:nil];
   }];
}

- (void)requestRecommend:(void(^)())complete{
    [XMLYFindAPI requestWithRecommend:^(id response) {
        
        [XMLYFocusImagesModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"list":@"XMLYFocusImagesDetailModel"};
        }];
        self.recommendModel = [XMLYFindRecommendModel mj_objectWithKeyValues:response];
        complete();
    }];
}
@end
