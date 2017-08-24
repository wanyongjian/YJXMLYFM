//
//  XMLYBaseModel.h
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/22.
//  Copyright © 2017年 eco. All rights reserved.
//

#import <Foundation/Foundation.h>
@class  XMLYEditorRecommendAlbumsModel, XMLYEditorRecommendAlbumsDetailModel;

@interface XMLYBaseModel : NSObject

@end


@interface XMLYEditorRecommendAlbumsModel : NSObject
@property (nonatomic, assign) NSInteger ret;
@property (nonatomic, copy) NSString *title;
@property (nonatomic,copy) NSString *hasMore;
@property (nonatomic, strong) NSMutableArray <XMLYEditorRecommendAlbumsDetailModel*>*list;
@end

@interface XMLYEditorRecommendAlbumsDetailModel : NSObject
@property (nonatomic,assign) NSInteger serialState;
@property (nonatomic,assign) NSInteger playsCounts;
@property (nonatomic,assign) NSInteger commentsCount;
@property (nonatomic,assign) NSInteger albumId;
@property (nonatomic,assign) NSInteger id;
@property (nonatomic,assign) NSInteger uid;
@property (nonatomic,assign) NSInteger tracks;
@property (nonatomic,assign) NSInteger refundSupportType;
@property (nonatomic,assign) NSInteger priceTypeId;
@property (nonatomic,assign) NSInteger isFinished;
@property (nonatomic,assign) NSInteger trackId;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *tags;
@property (nonatomic,copy) NSString *nickname;
@property (nonatomic,copy) NSString *coverMiddle;
@property (nonatomic,copy) NSString *intro;
@property (nonatomic,copy) NSString *isPaid;
@property (nonatomic,copy) NSString *coverSmall;
@property (nonatomic,copy) NSString *coverLarge;
@property (nonatomic,copy) NSString *provider;
@property (nonatomic,copy) NSString *isVipFree;
@property (nonatomic,copy) NSString *isDraft;
@property (nonatomic,copy) NSString *albumCoverUrl290;
@end
