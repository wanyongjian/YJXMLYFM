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
#import "FindCellLive.h"
#import "FindSpecialCell.h"


#define kSectionEditCommend 0 //小编推荐
#define kSectionLive 1  //直播
#define kSectionGuess 2 //猜你喜欢
#define kSectionCityColumn 3 //城市歌单
#define kSectionSpecial 4 //精品歌单

#define kSectionEditCommendHeight 230
#define kSectionLiveHeight 227
#define kSectionSpecialHeight 80

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
    }else if (indexPath.section == kSectionLive){
        return kSectionLiveHeight;
    }else if (indexPath.section == kSectionGuess){
        return kSectionEditCommendHeight;
    }else if (indexPath.section == kSectionCityColumn){
        return kSectionEditCommendHeight;
    }else if (indexPath.section == kSectionSpecial){
        return kSectionSpecialHeight;
    }
    return 50;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 8;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == kSectionSpecial) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 50)];
        view.backgroundColor = [UIColor blackColor];
        return view;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == kSectionSpecial) {
        return 50;
    }
    return 0;
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
    }else if(indexPath.section == kSectionLive){
        static NSString *useID = @"livecell";
        FindCellLive *cell = [tableView dequeueReusableCellWithIdentifier:useID];
        if (!cell) {
            cell = [[FindCellLive alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:useID];
        }
        cell.liveModel = self.viewModel.liveModel;
        return cell;
    }else if(indexPath.section == kSectionGuess){
        static NSString *useID = @"guesscell";
        FindCellFee *cell = [tableView dequeueReusableCellWithIdentifier:useID];
        if (!cell) {
            cell = [[FindCellFee alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:useID];
        }
        cell.recommendModel = self.viewModel.hotGuessModel.guess;
        return cell;
    }else if(indexPath.section == kSectionCityColumn){
        static NSString *useID = @"citycell";
        FindCellFee *cell = [tableView dequeueReusableCellWithIdentifier:useID];
        if (!cell) {
            cell = [[FindCellFee alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:useID];
        }
        cell.recommendModel = self.viewModel.hotGuessModel.cityColumn;
        return cell;
    }else if(indexPath.section == kSectionSpecial){
        static NSString *useID = @"specialcell";
        FindSpecialCell *cell = [tableView dequeueReusableCellWithIdentifier:useID];
        if (!cell) {
            cell = [[FindSpecialCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:useID];
        }
        XMLYSpecialColumnDetailModel *specialModel = self.viewModel.recommendModel.specialColumn.list[indexPath.row];
        cell.specialModel = specialModel;
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
