//
//  XMLYFindHotGuessModel.h
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/23.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "XMLYBaseModel.h"
@class XMLYHotMemberModel,XMLYHotMemberDetailModel,XMLYHotRecommendsModel,XMLYHotRecommendsDetailModel,XMLYHotCityColumnModel,XMLYHotCityColumnDetailModel,XMLYHotGuessModel,XMLYHotGuessDetailModel,XMLYHotDiscoveryColumnsModel,XMLYHotDiscoveryColumnsDetailModel;

@interface XMLYFindHotGuessModel : XMLYBaseModel

@property (nonatomic,assign) NSInteger ret;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, strong) XMLYHotDiscoveryColumnsModel *discoveryColumns;
@end


@interface XMLYHotDiscoveryColumnsModel : XMLYBaseModel
@property (nonatomic,assign) NSInteger ret;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSMutableArray <XMLYHotDiscoveryColumnsDetailModel*> *list;
@end

@interface XMLYHotDiscoveryColumnsDetailModel : XMLYBaseModel
@property (nonatomic,assign) NSInteger id;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *bubbleText;
@property (nonatomic, copy) NSString *isExternalUrl;
@property (nonatomic, copy) NSString *contentType;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *enableShare;
@property (nonatomic, strong) NSMutableArray *properties;
@property (nonatomic, copy) NSString *coverPath;
@property (nonatomic, copy) NSString *sharePic;
@property (nonatomic,assign) NSInteger contentUpdatedAt;

@end
