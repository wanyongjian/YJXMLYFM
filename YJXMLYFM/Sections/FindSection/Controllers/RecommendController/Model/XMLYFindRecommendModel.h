//
//  XMLYFindRecommendModel.h
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/22.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "XMLYBaseModel.h"
@class XMLYFocusImagesModel,XMLYFocusImagesDetailModel, XMLYSpecialColumnModel, XMLYSpecialColumnDetailModel, XMLYEditorRecommendAlbumsModel, XMLYEditorRecommendAlbumsDetailModel;

@interface XMLYFindRecommendModel : XMLYBaseModel

@property (nonatomic, copy) NSString *msg;
@property (nonatomic, assign) NSInteger ret;
@property (nonatomic, strong) XMLYFocusImagesModel *focusImages;
@property (nonatomic, strong) XMLYSpecialColumnModel *specialColumn;
@property (nonatomic, strong) XMLYEditorRecommendAlbumsModel *editorRecommendAlbums;
@end


@interface XMLYFocusImagesModel : XMLYBaseModel
@property (nonatomic, assign) NSInteger ret;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSMutableArray <XMLYFocusImagesDetailModel *>*list;
@end

@interface  XMLYFocusImagesDetailModel : XMLYBaseModel
@property (nonatomic,assign) NSInteger liveId;
@property (nonatomic,assign) NSInteger roomId;
@property (nonatomic,copy) NSString *shortTitle;
@property (nonatomic,assign) NSInteger id;
@property (nonatomic,copy) NSString *pic;
@property (nonatomic,assign) NSInteger focusCurrentId;
@property (nonatomic,assign) NSInteger isShare;
@property (nonatomic,copy) NSString *is_External_url;
@property (nonatomic,assign) NSInteger type;
@property (nonatomic,copy) NSString *longTitle;
@end

@interface XMLYSpecialColumnModel : XMLYBaseModel
@property (nonatomic, assign) NSInteger ret;
@property (nonatomic, copy) NSString *title;
@property (nonatomic,copy) NSString *hasMore;
@property (nonatomic, strong) NSMutableArray <XMLYSpecialColumnDetailModel*>*list;
@end

@interface XMLYSpecialColumnDetailModel : XMLYBaseModel
@property (nonatomic,assign) NSInteger columnType;
@property (nonatomic,assign) NSInteger specialId;
@property (nonatomic,copy) NSString *subtitle;
@property (nonatomic,copy) NSString *coverPath;
@property (nonatomic,copy) NSString *title;
@property (nonatomic,copy) NSString *footnote;
@property (nonatomic,copy) NSString *contentType;
@end

@interface XMLYEditorRecommendAlbumsModel : XMLYBaseModel
@property (nonatomic, assign) NSInteger ret;
@property (nonatomic, copy) NSString *title;
@property (nonatomic,copy) NSString *hasMore;
@property (nonatomic, strong) NSMutableArray <XMLYEditorRecommendAlbumsDetailModel*>*list;
@end

@interface XMLYEditorRecommendAlbumsDetailModel : XMLYBaseModel
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
