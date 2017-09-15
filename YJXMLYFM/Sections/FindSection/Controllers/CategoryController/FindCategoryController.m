//
//  FindCategoryController.m
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/18.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "FindCategoryController.h"
#import "FindCategoryViewModel.h"
@interface FindCategoryController ()

@property (nonatomic, strong) FindCategoryViewModel *viewModel;
@property (nonatomic, strong) UIView *headView;
@end

@implementation FindCategoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.viewModel.updateContentSignal subscribeNext:^(id x) {
        
    }];
    [self.viewModel refreshData];
}


#pragma mark - lazyload
- (FindCategoryViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[FindCategoryViewModel alloc]init];
    }
    return _viewModel;
}
@end
