//
//  FindCategoryViewModel.m
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/9/15.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "FindCategoryViewModel.h"
#import "XMLYFindCategoryRequest.h"

@implementation FindCategoryViewModel

- (instancetype)init{
    if (self = [super init]) {
        self.updateContentSignal = [RACSubject subject];
    }
    return self;
}

- (void)refreshData{
    RACSignal *categoryFootSingal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
       
        [self requestCategoryFoot:^{
            [subscriber sendNext:nil];
        }];
        return nil;
    }];
    
    RACSignal *categoryItemSingal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
       [self requestCategoryItem:^{
           [subscriber sendNext:nil];
       }];
        return nil;
    }];
    
    [[RACSignal combineLatest:@[categoryFootSingal, categoryItemSingal]] subscribeNext:^(id x) {
        [self.updateContentSignal sendNext:nil];
    }];
}

- (void)requestCategoryFoot:(void(^)())complete{
    [XMLYFindCategoryRequest requestFoot:^(id response) {
        
        /** 转成模型 */
        complete();
    }];
}

- (void)requestCategoryItem:(void(^)())complete{
    [XMLYFindCategoryRequest requestCategory:^(id response) {
       /** 转成模型 */
        [XMLYFindCategoryModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"list":@"findCategoryListItemModel"};
        }];
        self.categoryListItem = [XMLYFindCategoryModel mj_objectWithKeyValues:response];
        complete();
    }];
}

- (NSInteger)numberOfSections{
    NSInteger row = self.categoryListItem.list.count /6;
    NSInteger colum = self.categoryListItem.list.count % 6;
    
    return colum == 0 ? row:row+1;
}

- (NSInteger)numberOfRowInSection:(NSInteger)section{
    NSInteger row = self.categoryListItem.list.count /6;
    if (section < row) {
        return 3;
    }else{
        return (self.categoryListItem.list.count%6)/2;
    }
}
@end
