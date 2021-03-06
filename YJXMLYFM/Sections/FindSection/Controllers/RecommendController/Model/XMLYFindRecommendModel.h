//
//  XMLYFindRecommendModel.h
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/22.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "XMLYBaseModel.h"
@class XMLYFocusImagesModel,XMLYFocusImagesDetailModel, XMLYSpecialColumnModel, XMLYSpecialColumnDetailModel;

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


