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

#import "FindCellFee.h"


#define kSectionEditCommend 0

#define kSectionEditCommendHeight 230

@interface FindRecommendController () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
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
        self.headerView.hotArray = self.viewModel.hotGuessModel.discoveryColumns.list;
        
        [self.tableView reloadData];
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == kSectionEditCommend) {
        return kSectionEditCommendHeight;
    }
    return 50;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 8;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == kSectionEditCommend) {
        static NSString *useID = @"editcell";
        FindCellFee *cell = [tableView dequeueReusableCellWithIdentifier:useID];
        if (!cell) {
            cell = [[FindCellFee alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:useID];
        }
        cell.recommendModel = self.viewModel.recommendModel.editorRecommendAlbums;
        return cell;
    }else{
        static NSString *useID = @"cell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:useID];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:useID];
        }
            return cell;
    }
    
    return [[UITableViewCell alloc]init];
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
