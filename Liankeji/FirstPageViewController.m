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
#import "lzhReturnLabelHeight.h"
#import "LcPersonalMessageViewController.h"
#import "firstPageSecondViewControllerForClickScienceCell.h"
#import "lzhZhuanjiawendaTableViewCell.h"

//
//滚动视图高度
#define SCROLLVIEW_HEIGHT SCREEN_HEIGHT * 0.374
//中间按钮组整体的高度
#define BUTTON_GROUP_HEIGHT SCREEN_HEIGHT * 0.287
//公告
#define ANNOUNCE_HEIGHT SCREEN_HEIGHT * 0.067
//科技圈view高度
#define SCIENCE_HEADER_HEIGHT SCREEN_HEIGHT * 0.1

@interface FirstPageViewController ()<FFScrollViewDelegate,groupButtonDelegate,VierticalScrollViewDelegate,secondCellPraiseDelegate,UITableViewDelegate,UITableViewDataSource,segumentDelegate>

@property (strong,nonatomic)NSMutableArray *newsArr;
//表视图
@property (strong,nonatomic)UITableView *tableView;
//表头
@property (strong,nonatomic)UIView *tableHeaderView;
//表头高度
@property (assign,nonatomic) CGFloat tableHeaderHeight;

@property (assign,nonatomic)CGFloat segumentIndex;

@end

@implementation FirstPageViewController
NSArray *testStrArr;
NSArray *testCommentStrArr;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableHeaderHeight = SCROLLVIEW_HEIGHT + ANNOUNCE_HEIGHT + BUTTON_GROUP_HEIGHT;
    self.automaticallyAdjustsScrollViewInsets = NO;
    testStrArr = @[@"亿欧8月25日消息：今天上午，2016中国民营企业500强发布会在北京召开。榜单显示，华为控股有限公司以营收总额3590.09亿排名第一.",@"韩美以朝鲜发展核武器为军演理由，发誓“要严惩朝鲜挑衅”，粉碎一切核攻击。朝鲜则迅速做出强硬回击，“警告南朝鲜傀儡党羽和敌对势力不要轻举妄动”，并称美韩军演不停，不放弃妄图侵略朝鲜的野心",@"朝鲜将继续强化以核武力为核心的自卫国防力量。双方的交锋，不停地给东北亚令人焦虑的“烧烤”模式增添燃料，再加上“萨德”，让局势更加复杂不放弃妄图侵略朝鲜的野心，朝鲜将继续强化以核武力为核心的自卫国防力量。双方的交锋，不停地给东北亚令人焦虑的“烧烤”模式增添燃料，再加上“萨德”，让局势更加复杂"];
    testCommentStrArr = @[@"三季度开始阶段考试都是三季度开始阶段考试都是三季度开始阶段考试都是三季度开始阶段考试都是",@"活动空间设计都是科技的会计师的会计师可活动空间设计都是活动空间设计都是",@"霍建华进货价高合金钢喻户发的发的规范和推广后台有"];
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
    if(self.segumentIndex != index){
        //NSLog(@"点击分隔控制符：%li",index);
         [self.tableView reloadData];
    }
    self.segumentIndex = index;
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
    if(indexPath.section == 0){
        cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        NSArray *announceArr = [NSArray arrayWithObjects:@"今人不见古时月",@"今月曾经照古人",@"古人今人若流水",@"共看明月皆如此", nil];
        if(cell1 == nil){
            cell1 = [[firstTableViewCellOfFirstPage alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell1" delegate:self cellHeight:self.tableHeaderHeight announceArr:announceArr tableView:self.tableView];
        }
         parentCell = cell1;
    }else if (indexPath.section == 1){
            CGFloat contentLableheight = [lzhReturnLabelHeight getLabelHeight:testStrArr[indexPath.row] fontSize:15 width:SCREEN_WIDTH * 0.95];
            if(self.segumentIndex == 0){
                firstPageSecondCell *cell3 = [tableView dequeueReusableCellWithIdentifier:@"cell3"];
                if(cell3 == nil){
                     cell3 = [[firstPageSecondCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell3" targetView:self.tableView changeLabelHeight:contentLableheight commentViewContentArr:testCommentStrArr dellegate:self];
                    [cell3.userImageButt addTarget:self action:@selector(clickImageButton:) forControlEvents:UIControlEventTouchUpInside];
                }
                cell3.contentLabel.text = testStrArr[indexPath.row];
                parentCell = cell3;
               
            }else{
                lzhZhuanjiawendaTableViewCell *cell4 = [tableView dequeueReusableCellWithIdentifier:@"cell4"];
                if(cell4 == nil){
                    cell4 = [[lzhZhuanjiawendaTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell4" contentHeight:contentLableheight];
                }
                cell4.commentNameLab.text = @"迟建勇";
                cell4.commentJobLab.text = @"建筑";
                cell4.commentTimeLab.text = @"2017-03-06";
                  [cell4.questionButt setTitle:@"提问" forState:UIControlStateNormal];
                [cell4.lookButt setTitle:@"20元查看" forState:UIControlStateNormal];
                cell4.questionContentLabel.text = testStrArr[indexPath.row];
                parentCell = cell4;
            }
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
//

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    //NSLog(@"表头高度%lf",self.tableHeaderView.bounds.size.height);
    CGFloat height = 0;
    if(section == 0){
        
    }else if (section == 1){
        height = SCIENCE_HEADER_HEIGHT;
    }
    return height;
}

//

//cell高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = 0;
    if(indexPath.section == 0){
        height = self.tableHeaderHeight;
    }else if (indexPath.section == 1){
       CGFloat lableheight = [lzhReturnLabelHeight getLabelHeight:testStrArr[indexPath.row] fontSize:15 width:SCREEN_WIDTH * 0.95];
        CGFloat commentToTalHeight = 0;
        for(NSInteger i = 0 ; i < testCommentStrArr.count; i ++){
            CGFloat commentHeight = [lzhReturnLabelHeight getLabelHeight: testCommentStrArr[i] fontSize:12 width:SCREEN_WIDTH * 0.7];
            commentToTalHeight += commentHeight;
        }
        if(self.segumentIndex == 0){
            height = lableheight +SCREEN_HEIGHT * (0.067 +0.037) + commentToTalHeight + 15 + SCREEN_WIDTH * 0.95;
        }else if (self.segumentIndex == 1){
            height = SCREEN_HEIGHT * 0.082 + 5 + 5 + lableheight + 25;
        }
    }
    return  height;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    firstPageSecondViewControllerForClickScienceCell *vc = [[firstPageSecondViewControllerForClickScienceCell alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}
//科技圈点击头像
- (void)clickImageButton:(UIButton*)_b{
    LcPersonalMessageViewController *vc = [[LcPersonalMessageViewController alloc]init];
    [self presentViewController:vc animated:YES completion:nil];
}

//科技圈cell
//点赞
-(void)clickPraiseButton:(UILabel *)praiseLabel{
    praiseLabel.text = @"点赞（122）";
    NSLog(@"点赞");
}
//评论
-(void)clickCommentButton:(UILabel *)commentLabel{
    commentLabel.text = @"12";
    NSLog(@"评论");
}
//举报
-(void)clickJuBaoButton:(UILabel *)JuBaoLabel{
    JuBaoLabel.text = @"0";
    NSLog(@"举报");
}

//
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
