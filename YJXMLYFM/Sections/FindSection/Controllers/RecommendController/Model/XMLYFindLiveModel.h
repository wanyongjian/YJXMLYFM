//
//  XMLYFindLiveModel.h
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/24.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "XMLYBaseModel.h"

@class XMLYFindLiveDetailModel;
@interface XMLYFindLiveModel : XMLYBaseModel

@property (nonatomic, assign) NSInteger ret;
@property (nonatomic, strong) NSMutableArray <XMLYFindLiveDetailModel *> *data;
@end

@interface XMLYFindLiveDetailModel : XMLYBaseModel

@property (nonatomic, assign) NSInteger chatId;
@property (nonatomic, assign) NSInteger endTs;
@property (nonatomic, assign) NSInteger id;
@property (nonatomic, assign) NSInteger onlineCount;
@property (nonatomic, assign) NSInteger playCount; //播放总量
@property (nonatomic, assign) NSInteger scheduleId;
@property (nonatomic, assign) NSInteger startTs;
@property (nonatomic, assign) NSInteger status;
@property (nonatomic, copy) NSString *coverPath; //图片路径
@property (nonatomic, copy) NSString *name;      //名字
@property (nonatomic, copy) NSString *shortDescription; //描述
@end
