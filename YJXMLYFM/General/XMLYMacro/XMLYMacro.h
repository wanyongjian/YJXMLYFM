//
//  XMLYMacro.h
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/15.
//  Copyright © 2017年 eco. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 * 系统宏定义
 */
#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

#define kTabbarHeight 49

/**
 * 颜色相关
 */
#define RGB(c,a) [UIColor colorWithRed:((c&0xFF0000)>>16)/255.f green:((c&0xFF00)>>8)/255.f blue:(c&ff)/255.f alpha:a]

@interface XMLYMacro : NSObject
@end
