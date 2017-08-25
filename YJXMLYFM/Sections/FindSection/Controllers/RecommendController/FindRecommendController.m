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

#import "XMLYFindCellFactory.h"


#define kSectionEditCommend 0   //小编推荐
#define kSectionLive 1          //直播
#define kSectionGuess 2         //猜你喜欢
#define kSectionCityColumn 3    //城市歌单
#define kSectionSpecial 4       //精品歌单
#define kSectionHotRecommend 5  //热门推荐
#define kSectionMore 6          //更多

#define kSectionEditCommendHeight 230
#define kSectionLiveHeight        227
#define kSectionSpecialHeight     80
#define kSectionMoreHeight        60

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
    }else if (indexPath.section == kSectionHotRecommend){
        return kSectionEditCommendHeight;
    }
    else if (indexPath.section == kSectionMore){
        return kSectionMoreHeight;
    }
    return 0;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 8;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == kSectionSpecial) {
        return self.viewModel.recommendModel.specialColumn.list?self.viewModel.recommendModel.specialColumn.list.count:0;
    }else if (section == kSectionHotRecommend){
        return  self.viewModel.hotGuessModel.hotRecommends.list?self.viewModel.hotGuessModel.hotRecommends.list.count:0;
    }
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
        FindCellFee *cell = (FindCellFee *)[XMLYFindCellFactory cellByFactory:tableView type:FindCellTypeFee];
        cell.recommendModel = self.viewModel.recommendModel.editorRecommendAlbums;
        return cell;
    }else if(indexPath.section == kSectionLive){
        FindCellLive *cell = (FindCellLive *)[XMLYFindCellFactory cellByFactory:tableView type:FindCellTypeLive];
        cell.liveModel = self.viewModel.liveModel;
        return cell;
    }else if(indexPath.section == kSectionGuess){
        FindCellFee *cell = (FindCellFee *)[XMLYFindCellFactory cellByFactory:tableView type:FindCellTypeFee];
        cell.recommendModel = self.viewModel.hotGuessModel.guess;
        return cell;
    }else if(indexPath.section == kSectionCityColumn){
        FindCellFee *cell = (FindCellFee *)[XMLYFindCellFactory cellByFactory:tableView type:FindCellTypeFee];
        cell.recommendModel = self.viewModel.hotGuessModel.cityColumn;
        return cell;
    }else if(indexPath.section == kSectionSpecial){
        FindSpecialCell *cell = (FindSpecialCell *)[XMLYFindCellFactory cellByFactory:tableView type:FindCellTypeSpecial];
        XMLYSpecialColumnDetailModel *specialModel = self.viewModel.recommendModel.specialColumn.list[indexPath.row];
        cell.specialModel = specialModel;
        return cell;
    }else if(indexPath.section == kSectionHotRecommend){
        FindCellFee *cell = (FindCellFee *)[XMLYFindCellFactory cellByFactory:tableView type:FindCellTypeFee];
        cell.hotRecommendModel = self.viewModel.hotGuessModel.hotRecommends.list[indexPath.row];
        return cell;
    }else if(indexPath.section == kSectionMore){
        static NSString *reuseID = @"sectionMore";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseID];
        }
        cell.imageView.image = [UIImage imageNamed:@"find_gotocate"];
        cell.textLabel.text = @"查看更多分类";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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
