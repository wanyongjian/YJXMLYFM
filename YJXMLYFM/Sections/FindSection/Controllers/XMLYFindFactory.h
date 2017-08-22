//
//  XMLYFindFactory.h
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/21.
//  Copyright © 2017年 eco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLYBaseController.h"

@interface XMLYFindFactory : NSObject

+ (XMLYBaseController *)findSubtitleControllerWithIdentifier:(NSString *)identifier;
@end
