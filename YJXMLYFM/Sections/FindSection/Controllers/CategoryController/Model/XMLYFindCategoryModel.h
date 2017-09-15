//
//  XMLYFindCategoryModel.h
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/9/15.
//  Copyright © 2017年 eco. All rights reserved.
//

#import <Foundation/Foundation.h>

@class findCategoryListItemModel;
@interface XMLYFindCategoryModel : NSObject

@property (nonatomic, assign) NSInteger ret;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, strong) NSMutableArray <findCategoryListItemModel *> *list;
@end

@interface findCategoryListItemModel : NSObject

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *coverPath;
@end
