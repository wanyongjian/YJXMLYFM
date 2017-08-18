//
//  FindSubTitleView.h
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/17.
//  Copyright © 2017年 eco. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FindSubTitleViewDelegate <NSObject>

@optional
- (void)subTitleSelectedAtIndex:(NSInteger)index;

@end

@interface FindSubTitleView : UIView

@property (nonatomic,weak) id<FindSubTitleViewDelegate> delegate;

- (void)transToIndex:(NSInteger)index;
@end
