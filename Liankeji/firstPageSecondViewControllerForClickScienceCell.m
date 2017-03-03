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

@interface firstPageSecondViewControllerForClickScienceCell ()<UITableViewDelegate,UITableViewDataSource>{
    UITableView *tableView;
}

@end

@implementation firstPageSecondViewControllerForClickScienceCell
NSString  *testStr ;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self initTableView];
    testStr = @"亿欧8月25日消息：今天上午，2016中国民营企业500强发布会在北京召开。榜单显示，华为控股有限公司以营收总额3590.09亿排名第一";
    
    // Do any additional setup after loading the view.
}

//初始化tableView
- (void)initTableView{
    tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NAVIGATION_HEIGHT + STATUSBAR_HEIGHT  , SCREEN_WIDTH, self.view.frame.size.height - NAVIGATION_HEIGHT - STATUSBAR_HEIGHT) style:UITableViewStyleGrouped];
    tableView.backgroundColor = [UIColor grayColor];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CGFloat contentheight = [lzhReturnLabelHeight getLabelHeight:testStr fontSize:15 width:self.view.frame.size.width];
    lzhFirstPageScienceDetaileCellHeader *header = [[lzhFirstPageScienceDetaileCellHeader alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, SCREEN_HEIGHT *0.067 +  contentheight) delegate:self contentHeight:contentheight];
    header.contentLabel.text = testStr;
    
    return header;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CGFloat contentheight = [lzhReturnLabelHeight getLabelHeight:testStr fontSize:15 width:self.view.frame.size.width];
    return SCREEN_HEIGHT *0.067 + contentheight;
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
