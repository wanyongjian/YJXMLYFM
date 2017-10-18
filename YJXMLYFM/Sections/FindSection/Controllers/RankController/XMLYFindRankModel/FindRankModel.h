//
//  FindRankModel.h
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/10/18.
//  Copyright © 2017年 eco. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FindRankListModel,FindRankDetailModel,FindRankItemModel;

@interface FindRankModel : NSObject

@property (nonatomic, assign) NSInteger ret;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, strong) NSMutableArray <FindRankListModel *> *datas;

@end

@interface FindRankListModel : NSObject
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger ret;
@property (nonatomic, strong) NSMutableArray <FindRankDetailModel *> *list;
@end

@interface FindRankDetailModel : NSObject
@property (nonatomic, assign) NSInteger totalCount;
@property (nonatomic, assign) NSInteger firstId;
@property (nonatomic, assign) NSInteger pageSize;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSMutableArray <FindRankItemModel *> *firstKResults;
@property (nonatomic, assign) NSInteger top;
@property (nonatomic, assign) NSInteger period;
@property (nonatomic, copy) NSString *rankingRule;
@property (nonatomic, copy) NSString *calcPeriod;
@property (nonatomic, copy) NSString *orderNum;
@property (nonatomic, copy) NSString *pageId;
@property (nonatomic, copy) NSString *maxPageId;
@property (nonatomic, assign) NSInteger rankingListId;
@property (nonatomic, copy) NSString *coverPath;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *contentType;
@property (nonatomic, copy) NSString *isAllPaid;
@property (nonatomic, assign) NSInteger ret;
@property (nonatomic, copy) NSString *firstTitle;
@property (nonatomic, assign) NSInteger categoryId;
@property (nonatomic, copy) NSString *key;
@end

@interface FindRankItemModel : NSObject
@property (nonatomic, assign) NSInteger contentType;
@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *title;
@end
