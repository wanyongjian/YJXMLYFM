//
//  FindRadioController.m
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/18.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "FindRadioController.h"
#import "FindRadioViewModel.h"
#import "FindRankCell.h"

@interface FindRadioController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) FindRadioViewModel *viewModel;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation FindRadioController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.tableView];
    [self layoutViews];
    
    @weakify(self)
    [self.viewModel.radioUpdateSignal subscribeNext:^(id x) {
        @strongify(self)
        
        [self.tableView reloadData];
    }];
    [self.viewModel refreshData];
}

- (void)layoutViews{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}
- (FindRadioViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[FindRadioViewModel alloc]init];
    }
    return _viewModel;
}

#pragma mark - tableview 代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reuse = @"radiocell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[UITableViewCell alloc]init];
    }
    return cell;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}
@end
