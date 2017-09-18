//
//  FindRadioModel.h
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/9/18.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "XMLYBaseModel.h"


@class radioTopModel,radioCategoryModel,radioLocalModel;
@interface FindRadioModel : XMLYBaseModel


@property (nonatomic, strong) NSMutableArray <radioTopModel *> *topRadios;
@property (nonatomic, strong) NSMutableArray <radioCategoryModel *> *categories;
@property (nonatomic, strong) NSMutableArray <radioLocalModel *> *localRadios;
@property (nonatomic, copy) NSString *location;
@end



#pragma mark -
@interface radioTopModel : NSObject
@property (nonatomic, copy) NSString *name;
@end



#pragma mark -
@interface radioCategoryModel : NSObject
@property (nonatomic, copy) NSString *name;
@end


#pragma mark -
@interface  radioLocalModel : NSObject
@property (nonatomic, copy) NSString *name;
@end
