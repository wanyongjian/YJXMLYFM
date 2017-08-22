//
//  XMLYFindFactory.m
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/21.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "XMLYFindFactory.h"

#import "FindRecommendController.h"
#import "FindCategoryController.h"
#import "FindRadioController.h"
#import "FindRankController.h"
#import "FindAnchorController.h"

typedef NS_ENUM(NSInteger, XMLYFindTitle){
    XMLYFindTitleTypeRecommend  = 0, //推荐
    XMLYFindTitleTypeCategory   = 1, //分类
    XMLYFindTitleTypeRadio      = 2, //广播
    XMLYFindTitleTypeRank       = 3, //榜单
    XMLYFindTitleTypeAnchor     = 4, //主播
    XMLYFindTitleTypeUnknow     = 5  //未知
};

@implementation XMLYFindFactory


+ (XMLYBaseController *)findSubtitleControllerWithIdentifier:(NSString *)identifier{
    XMLYBaseController *controller = nil;
    XMLYFindTitle type = [self findTypeFromStr:identifier];
    if (type == XMLYFindTitleTypeRecommend) {
        controller = [[FindRecommendController alloc]init];
    }else if(type == XMLYFindTitleTypeCategory){
        controller = [[FindCategoryController alloc]init];
    }else if (type == XMLYFindTitleTypeRadio){
        controller = [[FindRadioController alloc]init];
    }else if (type == XMLYFindTitleTypeRank){
        controller = [[FindRankController alloc]init];
    }else if (type == XMLYFindTitleTypeAnchor){
        controller = [[FindAnchorController alloc]init];
    }
    return controller;
}

+ (XMLYFindTitle)findTypeFromStr:(NSString *)title{
    if ([title isEqualToString:@"推荐"]) {
        return XMLYFindTitleTypeRecommend;
    }else if([title isEqualToString:@"分类"]){
        return XMLYFindTitleTypeCategory;
    }else if ([title isEqualToString:@"广播"]){
        return XMLYFindTitleTypeRadio;
    }else if ([title isEqualToString:@"榜单"]){
        return XMLYFindTitleTypeRank;
    }else if ([title isEqualToString:@"主播"]){
        return XMLYFindTitleTypeAnchor;
    }else{
        return XMLYFindTitleTypeUnknow;
    }
}

@end
