//
//  FindRadioController.m
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/18.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "FindRadioController.h"
#import "FindRadioViewModel.h"

@interface FindRadioController ()

@property (nonatomic, strong) FindRadioViewModel *viewModel;
@property (nonatomic, strong) UITableView *tabelView;
@end

@implementation FindRadioController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    @weakify(self)
    [self.viewModel.radioUpdateSignal subscribeNext:^(id x) {
        @strongify(self)
        
        [self.tabelView reloadData];
    }];
    [self.viewModel refreshData];
}

- (FindRadioViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[FindRadioViewModel alloc]init];
    }
    return _viewModel;
}

@end
