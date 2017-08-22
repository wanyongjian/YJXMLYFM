//
//  FindRecommendController.m
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/18.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "FindRecommendController.h"
#import "FindRecommendViewModel.h"
#import "FindRecommedHeaderView.h"

@interface FindRecommendController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *headView;
@property (nonatomic, strong) FindRecommendViewModel *viewModel;
@property (nonatomic, strong) FindRecommedHeaderView *headerView;
@end


@implementation FindRecommendController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blueColor];
   
    [self addViews];
    [self layoutViews];
    
    [self.viewModel.updateContentSignal subscribeNext:^(id x) {
        NSLog(@"===== %@",self.viewModel.recommendModel.focusImages.list);
        self.headerView.imgUrlArray = self.viewModel.recommendModel.focusImages.list;
    }];
    
    [self.viewModel refreshDataSource];
}

- (void)addViews{
     [self.view addSubview:self.tableView];
}
- (void)layoutViews{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}
#pragma mark - tableview代理方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 8;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *useID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:useID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:useID];
    }
    return cell;
}
#pragma mark - lazyload
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headerView;
        [self.view addSubview:_tableView];
    }
    
    return _tableView;
}
- (FindRecommedHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[FindRecommedHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 250)];
    }
    return _headerView;
}

- (FindRecommendViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[FindRecommendViewModel alloc]init];
    }
    return _viewModel;
}
@end
