//
//  FindCategoryViewModel.h
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/9/15.
//  Copyright © 2017年 eco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLYFindCategoryModel.h"

@interface FindCategoryViewModel : NSObject

@property (nonatomic, strong) RACSubject *updateContentSignal;
@property (nonatomic, strong) XMLYFindCategoryModel *categoryListItem;

- (void)refreshData;
- (NSInteger)numberOfSections;
- (NSInteger)numberOfRowInSection:(NSInteger)section;
@end
