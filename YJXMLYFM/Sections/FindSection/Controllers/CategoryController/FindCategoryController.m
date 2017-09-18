//
//  FindCategoryController.m
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/18.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "FindCategoryController.h"
#import "FindCategoryViewModel.h"
#import "FindCategoryCell.h"
@interface FindCategoryController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) FindCategoryViewModel *viewModel;
@property (nonatomic, strong) UIView *headView;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation FindCategoryController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self.viewModel.updateContentSignal subscribeNext:^(id x) {
//        [self.tableView reloadData];
//    }];
//    [self.viewModel refreshData];
//    [self.view addSubview:self.tableView];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    [self.viewModel.updateContentSignal subscribeNext:^(id x) {
        [self.tableView reloadData];
    }];
    [self.viewModel refreshData];
    [self.view addSubview:self.tableView];
    [self layoutViews];
}

- (void)layoutViews{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}
#pragma mark - 代理方法 tableview
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.viewModel numberOfSections];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 10)];
    view.backgroundColor = RGB(0xf3f3f3, 1);
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.viewModel numberOfRowInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reuse = @"findCategory";
    FindCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:reuse];
    if (!cell) {
        cell = [[FindCategoryCell alloc]init];
        
        NSInteger index = indexPath.section * 6 + indexPath.row*2;
        cell.leftListModel = self.viewModel.categoryListItem.list[index];
        if (index < self.viewModel.categoryListItem.list.count) {
            cell.rightListModel = self.viewModel.categoryListItem.list[index+1];
        }
    }
    
    return cell;
}

#pragma mark - lazyload
- (FindCategoryViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[FindCategoryViewModel alloc]init];
    }
    return _viewModel;
}

- (UIView *)headView{
    if (!_headView) {
        _headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 250)];
    }
    return _headView;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor grayColor];
        _tableView.tableHeaderView = self.headView;
    }
    return _tableView;
}
@end
