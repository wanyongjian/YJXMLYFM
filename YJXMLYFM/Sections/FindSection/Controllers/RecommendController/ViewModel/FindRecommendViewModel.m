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
    
    RACSignal *signalHotAndGuss = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
       @strongify(self)
        [self requestHotAndGuess:^{
            [subscriber sendNext:nil];
        }];
        return nil;
    }];
    
    RACSignal *signalLive = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        @strongify(self);
        [self requestLive:^{
            [subscriber sendNext:nil];
        }];
        return nil;
    }];
    
   [[RACSignal combineLatest:@[signalRecommend,signalHotAndGuss,signalLive]] subscribeNext:^(id x) {
       [self.updateContentSignal sendNext:nil];
   }];
}

- (void)requestHotAndGuess:(void(^)())complete{
    [XMLYFindAPI requestWithHotAndGuess:^(id response) {
       
        [XMLYHotDiscoveryColumnsModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"list":@"XMLYHotDiscoveryColumnsDetailModel"};
        }];
        [XMLYEditorRecommendAlbumsModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"list":@"XMLYEditorRecommendAlbumsDetailModel"};
        }];
        
        [XMLYHotRecommendModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"list":@"XMLYHotRecommendDetailModel"};
        }];
        
        [XMLYHotRecommendDetailModel  mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"list":@"XMLYEditorRecommendAlbumsDetailModel"};
        }];
        
        self.hotGuessModel =  [XMLYFindHotGuessModel mj_objectWithKeyValues:response];
        complete();
    }];
}

- (void)requestRecommend:(void(^)())complete{
    [XMLYFindAPI requestWithRecommend:^(id response) {
        
        [XMLYFocusImagesModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"list":@"XMLYFocusImagesDetailModel"};
        }];
        
        [XMLYSpecialColumnModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"list":@"XMLYSpecialColumnDetailModel"};
        }];
        
        [XMLYEditorRecommendAlbumsModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"list":@"XMLYEditorRecommendAlbumsDetailModel"};
        }];
        self.recommendModel = [XMLYFindRecommendModel mj_objectWithKeyValues:response];
        complete();
    }];
}

- (void)requestLive:(void(^)())complete{
    [XMLYFindAPI requestWithLiveRecommend:^(id response) {
        [XMLYFindLiveModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"data":@"XMLYFindLiveDetailModel"};
        }];
        self.liveModel = [XMLYFindLiveModel mj_objectWithKeyValues:response];
        complete();
    }];
}
@end
