//
//  FirstPageViewController.m
//  Liankeji
//
//  Created by 李自豪 on 16/11/29.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "FirstPageViewController.h"
#import "ShareNetWorkState.h"
#import "ShareUrlString.h"
#import "ShareHomePath.h"
#import "ShareDataBase.h"
#import "NewsTestModel.h"
#import "GetCellHeight.h"
#import "sateliteMenuCenterButton.h"
#import "CenterSmallView.h"
#import "firstPageSecondCell.h"
#import "newAnnouncementView.h"
#import "scinenceHeaderView.h"
#import "appCommonAttributes.h"
#import "centerButtonGroupViewController.h"
#import "searchViewController.h"
#import "lzhTableHeaderViewForFirstPage.h"
#import "firstTableViewCellOfFirstPage.h"
#import "GetCellHeight.h"
#import "LcPersonalMessageViewController.h"
//
//滚动视图高度
#define SCROLLVIEW_HEIGHT SCREEN_HEIGHT * 0.374
//中间按钮组整体的高度
#define BUTTON_GROUP_HEIGHT SCREEN_HEIGHT * 0.287
//公告
#define ANNOUNCE_HEIGHT SCREEN_HEIGHT * 0.067
//科技圈view高度
#define SCIENCE_HEADER_HEIGHT SCREEN_HEIGHT * 0.1

@interface FirstPageViewController ()<FFScrollViewDelegate,groupButtonDelegate,VierticalScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,segumentDelegate>

@property (strong,nonatomic)NSMutableArray *newsArr;
//表视图
@property (strong,nonatomic)UITableView *tableView;
//表头
@property (strong,nonatomic)UIView *tableHeaderView;
//表头高度
@property (assign,nonatomic) CGFloat tableHeaderHeight;
@end

@implementation FirstPageViewController
NSArray *testStrArr;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableHeaderHeight = SCROLLVIEW_HEIGHT + ANNOUNCE_HEIGHT + BUTTON_GROUP_HEIGHT;
    self.automaticallyAdjustsScrollViewInsets = NO;
    testStrArr = @[@"亿欧8月25日消息：今天上午，2016中国民营企业500强发布会在北京召开。榜单显示，华为控股有限公司以营收总额3590.09亿排名第一.",@"韩美以朝鲜发展核武器为军演理由，发誓“要严惩朝鲜挑衅”，粉碎一切核攻击。朝鲜则迅速做出强硬回击，“警告南朝鲜傀儡党羽和敌对势力不要轻举妄动”，并称美韩军演不停，不放弃妄图侵略朝鲜的野心",@"朝鲜将继续强化以核武力为核心的自卫国防力量。双方的交锋，不停地给东北亚令人焦虑的“烧烤”模式增添燃料，再加上“萨德”，让局势更加复杂不放弃妄图侵略朝鲜的野心，朝鲜将继续强化以核武力为核心的自卫国防力量。双方的交锋，不停地给东北亚令人焦虑的“烧烤”模式增添燃料，再加上“萨德”，让局势更加复杂"];
    self.newsArr = [[NSMutableArray alloc]initWithCapacity:2];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initTableView];
}

//轮播点击
-(void)scrollViewDidClickedAtPage:(NSInteger)pageNumber{
    NSLog(@"你点击了轮播中的%li",pageNumber);
}
-(void)clickTitleButton:(UIButton *)button{
    NSLog(@"点击最新公告：%li",button.tag);
}

//中间按钮点击事件
-(void)groupButtonClickHandler:(NSInteger)buttonIndex{
    NSLog(@"buttonGroup:%li",buttonIndex);
    centerButtonGroupViewController *detailVC = [[centerButtonGroupViewController alloc]init];
    [self presentViewController:detailVC animated:YES completion:nil];
}
-(void)clickSegumentIndex:(NSInteger)index{
    NSLog(@"点击分隔控制符：%li",index);
}

//初始化tableView
- (void)initTableView{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NAVIGATION_HEIGHT + STATUSBAR_HEIGHT  , SCREEN_WIDTH, self.view.frame.size.height - NAVIGATION_HEIGHT - STATUSBAR_HEIGHT) style:UITableViewStylePlain];
    [self.view addSubview:_tableView];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

//没有数据，先写死了
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger rowNum = 0;
    if(section == 0){
        rowNum = 1;
    }else{
        rowNum = testStrArr.count;
    }
    return rowNum;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *parentCell = nil;
    firstTableViewCellOfFirstPage *cell1 = nil;
    firstPageSecondCell *cell2 = nil;
    if(indexPath.section == 0){
        cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        NSArray *announceArr = [NSArray arrayWithObjects:@"今人不见古时月",@"今月曾经照古人",@"古人今人若流水",@"共看明月皆如此", nil];
        if(cell1 == nil){
            cell1 = [[firstTableViewCellOfFirstPage alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1" delegate:self cellHeight:self.tableHeaderHeight announceArr:announceArr tableView:self.tableView];
        }
         parentCell = cell1;
    }else if (indexPath.section == 1){
        cell2 = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        if(nil == cell2){
            cell2 = [[firstPageSecondCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell2" targetView:self.tableView changeLabelHeight:[self lzhGetCellLabelHeight:testStrArr[indexPath.row]]];
            [cell2.viewModel1.imageButt addTarget:self action:@selector(clickImageButton:) forControlEvents:UIControlEventTouchUpInside];
            NSLog(@"cell2 为空");
        }
        cell2.contentLabel.text = testStrArr[indexPath.row];
        parentCell = cell2;
    }
       return parentCell;
}
//设置表头
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *headerView = nil;
    if(section == 0){
        
    }else if (section == 1){
        scinenceHeaderView *scienceView = [[scinenceHeaderView alloc]initWithFrame:CGRectMake(0, -SCIENCE_HEADER_HEIGHT, self.tableView.frame.size.width, SCIENCE_HEADER_HEIGHT)];
        scienceView.targetDelegate = self;
        headerView = scienceView;
    }
    //self.tableHeaderView =  [self crateTableHeaderView];
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    //NSLog(@"表头高度%lf",self.tableHeaderView.bounds.size.height);
    CGFloat height = 0;
    if(section == 0){
        
    }else if (section == 1){
        height = SCIENCE_HEADER_HEIGHT;
    }
    return height;
}

//cell高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = 0;
    if(indexPath.section == 0){
        height = self.tableHeaderHeight;
    }else if (indexPath.section == 1){
        height = [self lzhGetCellLabelHeight:testStrArr[indexPath.row]] + 50 + 20 + 5 + 5 + SCREEN_HEIGHT * 0.287 + 15;
    }
    return  height;
}

- (CGFloat)lzhGetCellLabelHeight:(NSString*)contentStr{
    UILabel *modelLabel = [[UILabel alloc]init];
    modelLabel.font = [UIFont systemFontOfSize:15];
    CGFloat h =  [[GetCellHeight ShareCellHeight] cellHeight:modelLabel content:contentStr Cellwidth:self.tableView.frame.size.width - 2 * 5];
    return h;
}
//点击头像
- (void)clickImageButton:(UIButton*)_b{
    LcPersonalMessageViewController *vc = [[LcPersonalMessageViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}

//
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
