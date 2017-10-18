//
//  FindRankController.m
//  YJXMLYFM
//
//  Created by wanyongjian on 2017/8/18.
//  Copyright © 2017年 eco. All rights reserved.
//

#import "FindRankController.h"
#import "FindRankAPI.h"
#import "FindRankModel.h"
#import "FindRankCell.h"

@interface FindRankController () <UITableViewDataSource,UITableViewDelegate>
@property (nonatomic, strong) FindRankModel *model;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation FindRankController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
    [self layoutSubview];
    
    [FindRankAPI requestRankResponse:^(id response) {
        
        [FindRankModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"datas":@"FindRankListModel"};
        }];
        
        [FindRankListModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"list":@"FindRankDetailModel"};
        }];
        
        [FindRankDetailModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{@"firstKResults":@"FindRankItemModel"};
        }];
        
        self.model = [FindRankModel mj_objectWithKeyValues:response];
        [self.tableView reloadData];
    }];
}

- (void)layoutSubview{
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.model.datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.model.datas[section].list.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 85;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 10)];
    view.backgroundColor = [UIColor blackColor];
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FindRankDetailModel *model = self.model.datas[indexPath.section].list[indexPath.row];
    FindRankCell *cell = [FindRankCell findRankModelCell:tableView];
    cell.model = model;
    return cell;
}
#pragma mark - lazyload
- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    }
    return _tableView;
}
@end
