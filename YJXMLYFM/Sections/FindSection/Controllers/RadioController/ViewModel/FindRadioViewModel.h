//
//  FindRadioViewModel.h
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/9/18.
//  Copyright © 2017年 eco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FindRadioModel.h"

@interface FindRadioViewModel : NSObject

@property (nonatomic, strong) RACSubject *radioUpdateSignal;
@property (nonatomic, strong) FindRadioModel *radioModel;
- (void)refreshData;
@end
