//
//  LCSetViewController.m
//  Liankeji
//
//  Created by liuchen on 2017/2/27.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "LCSetViewController.h"
#import "appCommonAttributes.h"
#import "PersonMessageViewController.h"
#import "lzhReturnView.h"
#import "LCSetView.h"
#import "CacheTool.h"

#define HEIGHTOFCELL 60
#define HEIGHTOFDEADVIEW 100

@interface LCSetViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation LCSetViewController


- (void)viewWillAppear:(BOOL)animated{
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加视图
    [self createView];
}

#pragma mark - 添加视图
- (void)createView{

    //添加导航栏
    lzhReturnView *returnView = [[lzhReturnView alloc]initWithFrame:CGRectMake(0, STATUSBAR_HEIGHT, SCREEN_WIDTH, 44)];
    returnView.backgroundColor = RGBA(0, 177, 251, 1);
    [returnView.ownButt setImage:[UIImage imageNamed:@"WechatIMG.png"] forState:UIControlStateNormal];
    returnView.lcSearchButton.hidden = NO;
    returnView.lcSearchButton.userInteractionEnabled = YES;
    [returnView.ownButt addTarget:self action:@selector(dissmiss) forControlEvents:UIControlEventTouchUpInside];
    returnView.ownTitleLabel.text = @"设置";
    returnView.ownTitleLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:returnView];
    
    [self.view addSubview:self.tableView];
}

#pragma mark - 返回按钮跳转方法
- (void)dissmiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 创建视图
- (UITableView *)tableView{

    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, STATUSBAR_HEIGHT+44, SCREEN_WIDTH, HEIGHTOFDEADVIEW+HEIGHTOFCELL*6) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
    }
    return _tableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 7;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return HEIGHTOFCELL;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *identity = @"LCSetCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    switch (indexPath.row) {
        case 0:{
            NSString *cachesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
            float numOfCache = [CacheTool folderSizeAtPath:cachesPath];
            cell.textLabel.text = [NSString stringWithFormat:@"%dM",(int)numOfCache];
            cell.textLabel.textColor = [UIColor blackColor];
            cell.textLabel.font = [UIFont systemFontOfSize:13];
        }
            break;
        case 1:
            cell.textLabel.text = @"编辑个人信息";
            cell.textLabel.textColor = [UIColor blackColor];
            cell.textLabel.font = [UIFont systemFontOfSize:13];
            break;
        case 2:
            cell.textLabel.text = @"关于链科技";
            cell.textLabel.textColor = [UIColor blackColor];
            cell.textLabel.font = [UIFont systemFontOfSize:13];
            break;
        case 3:
            cell.textLabel.text = @"检测新版本";
            cell.textLabel.textColor = [UIColor blackColor];
            cell.textLabel.font = [UIFont systemFontOfSize:13];
            break;
        case 4:
            cell.textLabel.text = @"帮助";
            cell.textLabel.textColor = [UIColor blackColor];
            cell.textLabel.font = [UIFont systemFontOfSize:13];
            break;
        case 5:
            cell.textLabel.text = @"用户协议";
            cell.textLabel.textColor = [UIColor blackColor];
            cell.textLabel.font = [UIFont systemFontOfSize:13];
            break;
        case 6:
            cell.textLabel.text = @"退出登录";
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.textLabel.textColor = [UIColor whiteColor];
            cell.backgroundColor = [UIColor redColor];
            cell.textLabel.font = [UIFont systemFontOfSize:17];
            cell.accessoryType = UITableViewCellAccessoryNone;
            break;
        default:
            break;
    }
    return cell;
}
#warning 后期数据填充-》dic;
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    NSDictionary *dic;
    LCSetView *setView = [[LCSetView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44) andSource:dic];
    return setView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return HEIGHTOFDEADVIEW;
}
#pragma mark - cell点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    switch (indexPath.row) {
        case 0:{
            [CacheTool clearCache:[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]];
            UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
            cell.textLabel.text = @"0M";
        }
            break;
        case 1:
            [self presentViewController:[PersonMessageViewController new] animated:YES completion:nil];
            break;
        case 2:
            
            break;
        case 3:
            
            break;
        case 4:
            
            break;
        case 5:
            
            break;
        case 6:
            
            break;
        default:
            break;
    }
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
