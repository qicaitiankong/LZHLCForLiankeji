//
//  firstPageSecondViewControllerForClickScienceCell.m
//  Liankeji
//
//  Created by mac on 2017/3/3.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "firstPageSecondViewControllerForClickScienceCell.h"
#import "appCommonAttributes.h"
#import "lzhFirstPageScienceDetaileCellHeader.h"
#import "lzhReturnLabelHeight.h"
#import "lzhScienceDetaileCommentTableViewCell.h"
#import "lzhReturnView.h"


@interface firstPageSecondViewControllerForClickScienceCell ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *myTableView;
    lzhReturnView *returnView;
}

@end

@implementation firstPageSecondViewControllerForClickScienceCell
NSString  *testStr ;
 NSString *commentStr;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addReturnView];
    [self initTableView];
    testStr = @"亿欧8月25日消息：今天上午，2016中国民营企业500强发布会在北京召开。榜单显示，华为控股有限公司以营收总额3590.09亿排名第一";
    
    // Do any additional setup after loading the view.
}
//
- (void)addReturnView{
    returnView = [[lzhReturnView alloc]initWithFrame:CGRectMake(0, STATUSBAR_HEIGHT, self.view.frame.size.width, NAVIGATION_HEIGHT)];
    //returnView.ownButt.titleLabel.textColor = [UIColor blackColor];
    [returnView.ownButt addTarget:self action:@selector(returnHandler:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:returnView];
}

- (void)returnHandler:(UIButton*)_b{
        [self dismissViewControllerAnimated:YES completion:^{
        }];
}

//初始化tableView
- (void)initTableView{
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, returnView.frame.origin.y + returnView.frame.size.height , SCREEN_WIDTH, self.view.frame.size.height - returnView.frame.origin.y - returnView.frame.size.height) style:UITableViewStyleGrouped];
    myTableView.backgroundColor = [UIColor grayColor];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [self.view addSubview:myTableView];
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CGFloat contentheight = [lzhReturnLabelHeight getLabelHeight:testStr fontSize:15 width:self.view.frame.size.width];
    lzhFirstPageScienceDetaileCellHeader *header = [[lzhFirstPageScienceDetaileCellHeader alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, SCREEN_HEIGHT *0.067 * 2 + contentheight + 5 + 10) delegate:self contentHeight:contentheight];
    header.contentLabel.text = testStr;
    return header;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CGFloat contentheight = [lzhReturnLabelHeight getLabelHeight:testStr fontSize:15 width:SCREEN_WIDTH * 0.95];
    return SCREEN_HEIGHT *0.067 * 2 + contentheight + 5 + 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    lzhScienceDetaileCommentTableViewCell *cell = nil;
    cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if(nil == cell){
    commentStr = @"几点开始大家好收到货时看风景地方房价肯定是减肥都是垃圾费多少九分裤第十六届反馈的时间飞快的";
    CGFloat height = [lzhReturnLabelHeight getLabelHeight:commentStr fontSize:15 width:SCREEN_WIDTH * 0.95];
      cell = [[lzhScienceDetaileCommentTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell" contentLabelHeight:height];
    }
    cell.commentNameLab.text = @"迟建勇";
    cell.commentJobLab.text = @"建筑";
    cell.commentTimeLab.text = @"2017-12-03";
    cell.commentContentLabel.text = commentStr;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = [lzhReturnLabelHeight getLabelHeight:commentStr fontSize:15 width:SCREEN_WIDTH * 0.95];
    return SCREEN_HEIGHT * 0.082 + height + 5 + 5;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
