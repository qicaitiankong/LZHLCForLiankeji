//
//  LcResumeTwoViewController.m
//  Liankeji
//
//  Created by liuchen on 2017/3/7.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "LcResumeTwoViewController.h"
#import "appCommonAttributes.h"
#import <Masonry.h>
#import "ChangeNavView.h"

@interface LcResumeTwoViewController ()<UITableViewDelegate,UITableViewDataSource>



@end

@implementation LcResumeTwoViewController

- (void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    //添加背景颜色
    self.view.backgroundColor = RGBA(230, 230, 230, 1);
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建视图
    [self createView];
}

#pragma mark - 创建视图
- (void)createView{

    NSString *title;
    if (self.judgeOfDelete == YES) {
        title = @"修改";
    }else{
        title = @"添加";
    }
    [self.view addSubview:self.resumeTwoTableView];
    ChangeNavView *changeNavView = [[ChangeNavView alloc]initWithFrame:CGRectMake(0, STATUSBAR_HEIGHT, SCREEN_WIDTH, 44) andTitle:title];
    [changeNavView.backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    changeNavView.preservationButton.hidden = YES;
    changeNavView.preservationButton.userInteractionEnabled= NO;
    [self.view addSubview:changeNavView];
}

#pragma mark - 懒加载tableView
- (UITableView *)resumeTwoTableView{

    if (_resumeTwoTableView == nil) {
        _resumeTwoTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, STATUSBAR_HEIGHT+44, SCREEN_WIDTH, SCREEN_HEIGHT-STATUSBAR_HEIGHT-44) style:UITableViewStyleGrouped];
        _resumeTwoTableView.delegate = self;
        _resumeTwoTableView.dataSource = self;
        _resumeTwoTableView.showsVerticalScrollIndicator = NO;
        _resumeTwoTableView.scrollEnabled = NO;
    }
    return _resumeTwoTableView;
}

#pragma mark - 返回按钮
- (void)back{

    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - tableView的点击方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    if (self.judgeOfDelete == YES) {
        return 4;
    }else{
        return 3;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    NSInteger num;
    if (self.judgeOfDelete == YES) {
        switch (section) {
            case 0:
                num = 2;
                break;
            case 1:
                num = 2;
                break;
            case 2:
                num = 1;
                break;
            case 3:
                num = 1;
                break;
            default:
                break;
        }
    }else{
        switch (section) {
            case 0:
                num = 2;
                break;
            case 1:
                num = 2;
                break;
            case 2:
                num = 1;
                break;
            default:
                break;
        }
    }
    return num;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return SCREEN_HEIGHT*0.08;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0 || indexPath.section == 1) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LcResumeTwoViewControllerCell1"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"LcResumeTwoViewControllerCell1"];
        }
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        if (indexPath.section == 0) {
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            if (indexPath.row == 0) {
                if (self.judgeOfType == YES) {
                    cell.textLabel.text = @"院校名称";
                    return cell;
                }else{
                    cell.textLabel.text = @"公司名称";
                    return cell;
                }
            }else{
                if (self.judgeOfType == YES) {
                    cell.textLabel.text = @"专业";
                    return cell;
                }else{
                    cell.textLabel.text = @"职位";
                    return cell;
                }
            }
        }else{
            
            if (indexPath.row == 0) {
                if (self.judgeOfType == YES) {
                    cell.textLabel.text = @"入学时间";
                    return cell;
                }else{
                    cell.textLabel.text = @"入职时间";
                    return cell;
                }
            }else{
                if (self.judgeOfType == YES) {
                    cell.textLabel.text = @"毕业时间";
                    return cell;
                }else{
                    cell.textLabel.text = @"离职时间";
                    return cell;
                }
            }
        }
    }else{
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"LcResumeTwoViewControllerCellPresent"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LcResumeTwoViewControllerCellPresent"];
        }
        if (self.judgeOfDelete == YES) {
            if (indexPath.section == 2) {
                cell.textLabel.textAlignment = NSTextAlignmentCenter;
                cell.backgroundColor = [UIColor redColor];
                cell.textLabel.text = @"保存";
                cell.textLabel.textColor = RGBA(0, 177, 251, 1);
                cell.textLabel.font = [UIFont systemFontOfSize:15];
                return cell;
            }else{
                cell.textLabel.textAlignment = NSTextAlignmentCenter;
                cell.textLabel.text = @"删除该条履历";
                cell.textLabel.textColor = [UIColor redColor];
                cell.textLabel.font = [UIFont systemFontOfSize:17];
                return cell;
            }
        }else{
            cell.textLabel.textAlignment = NSTextAlignmentCenter;
            cell.textLabel.text = @"保存";
            cell.textLabel.textColor = RGBA(0, 177, 251, 1);
            cell.textLabel.font = [UIFont systemFontOfSize:17];
            return cell;
        }
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
