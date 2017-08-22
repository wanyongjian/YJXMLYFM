//
//  FindRecommendViewModel.h
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/22.
//  Copyright © 2017年 eco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLYFindRecommendModel.h"

@interface FindRecommendViewModel : NSObject

@property (nonatomic, strong) XMLYFindRecommendModel *recommendModel;
/**  更新数据信号量 */
@property (nonatomic,strong) RACSubject *updateContentSignal;

- (void)refreshDataSource;
@end
