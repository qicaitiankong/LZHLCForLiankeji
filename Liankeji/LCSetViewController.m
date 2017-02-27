//
//  LCSetViewController.m
//  Liankeji
//
//  Created by liuchen on 2017/2/27.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "LCSetViewController.h"
#import "appCommonAttributes.h"

@interface LCSetViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong) UITableView *tableView;

@end

@implementation LCSetViewController

- (void)viewWillAppear:(BOOL)animated{

    self.title = @"设置";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

#pragma mark - 创建视图
- (UITableView *)tableView{

    //获取导航栏加电池栏的高度和
    CGFloat heightOfSet = NAVIGATIONOfSYSTEM_HEIGHT+STATUSBAR_HEIGHT;
    if (_tableView == nil) {
        //获取导航栏和电池栏的高度
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, heightOfSet, SCREEN_WIDTH, SCREEN_HEIGHT-heightOfSet-TABBAR_HEIGHT) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
        [self.view addSubview:_tableView];
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

    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *identity = @"LCSetCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identity];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
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
