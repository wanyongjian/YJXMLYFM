//
//  FindRecommendViewModel.h
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/22.
//  Copyright © 2017年 eco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLYFindRecommendModel.h"
#import "XMLYFindHotGuessModel.h"
#import "XMLYFindLiveModel.h"

@interface FindRecommendViewModel : NSObject
/**  热门数据*/
@property (nonatomic, strong) XMLYFindHotGuessModel *hotGuessModel;
/**  推荐数据*/
@property (nonatomic, strong) XMLYFindRecommendModel *recommendModel;
/**  直播数据*/
@property (nonatomic, strong) XMLYFindLiveModel *liveModel;
/**  更新数据信号量 */
@property (nonatomic,strong) RACSubject *updateContentSignal;

- (void)refreshDataSource;
@end
