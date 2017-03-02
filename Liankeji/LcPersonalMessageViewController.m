//
//  LcPersonalMessageViewController.m
//  Liankeji
//
//  Created by liuchen on 2017/3/2.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "LcPersonalMessageViewController.h"
#import "BasicMessageCell.h"
#import "appCommonAttributes.h"
#import "LcPersonalHeaderView.h"

#define HEIGHTOFCELL 50
#define WORDCOLOR RGBA(56, 56, 56, 0.8);

@interface LcPersonalMessageViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *basicArray;
@property (nonatomic,strong) NSArray *dynamicArray;

@end

@implementation LcPersonalMessageViewController

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加数据
    [self addDate];
    //创建视图
    [self createView];
    
}

#pragma mark - 添加数据
- (void)addDate{

    self.basicArray = @[@"基本信息",@"履历",@"城市",@"从事行业"];
    self.dynamicArray = @[@"个人动态",@"您家房子装修风格是什么样子的,花费多少",@"您家房子装修风格是什么样子的,花费多少",@"您家房子装修风格是什么样子的,花费多少"];
}

#pragma mark - 创建视图
- (void)createView{
    
    [self.view addSubview:self.tableView];
}

#pragma mark - tableView懒加载
- (UITableView *)tableView{

    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = RGBA(246, 246, 246, 1);
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
        LcPersonalHeaderView *lcpersonalHeaderView = [[LcPersonalHeaderView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT*0.33) andDic:nil];
        [lcpersonalHeaderView.backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
        _tableView.tableHeaderView = lcpersonalHeaderView;
    }
    return _tableView;
}

#pragma mark - tableView的协议方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return HEIGHTOFCELL;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            BasicMessageCell *basicMessageCell1 = [tableView dequeueReusableCellWithIdentifier:@"BasicMessageCell"];
            if (basicMessageCell1 == nil) {
                basicMessageCell1 = [[BasicMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BasicMessageCell" andImageName:@"基本信息呢.png" andText:self.basicArray[indexPath.row]];
            }
            basicMessageCell1.textLabel.font = [UIFont systemFontOfSize:15];
            basicMessageCell1.textLabel.textColor = WORDCOLOR;
            return basicMessageCell1;
        }else if (indexPath.row == 1){
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NormalCell"];
            if (cell == nil) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"NormalCell"];
            }
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = self.basicArray[indexPath.row];
            cell.textLabel.font = [UIFont systemFontOfSize:15];
            cell.textLabel.textColor = WORDCOLOR;
            return cell;
        }else{
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TwoLabelCell"];
            if (cell == nil) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"TwoLabelCell"];
            }
            cell.textLabel.text = self.basicArray[indexPath.row];
            cell.detailTextLabel.text = @"暂定";
            cell.detailTextLabel.textColor = WORDCOLOR;
            cell.detailTextLabel.font = [UIFont systemFontOfSize:15];
            cell.textLabel.font = [UIFont systemFontOfSize:15];
            cell.textLabel.textColor = WORDCOLOR;
            return cell;
        }
    }else{
        if (indexPath.row == 0) {
            BasicMessageCell *basicMessageCell2 = [tableView dequeueReusableCellWithIdentifier:@"BasicMessageCell"];
            if (basicMessageCell2 == nil) {
                basicMessageCell2 = [[BasicMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"BasicMessageCell" andImageName:@"个人动态.png" andText:self.dynamicArray[indexPath.row]];
            }
            basicMessageCell2.textLabel.font = [UIFont systemFontOfSize:15];
            basicMessageCell2.textLabel.textColor = WORDCOLOR;
            return basicMessageCell2;
        }else{
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NormalCell"];
            if (cell == nil) {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"NormalCell"];
            }
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            cell.textLabel.text = self.dynamicArray[indexPath.row];
            cell.textLabel.font = [UIFont systemFontOfSize:15];
            cell.textLabel.textColor = WORDCOLOR;
            return cell;
        }
    }
}


#pragma mark - 返回上一页
- (void)back{

    [self dismissViewControllerAnimated:YES completion:nil];
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
