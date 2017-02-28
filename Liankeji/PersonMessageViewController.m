//
//  PersonMessageViewController.m
//  Liankeji
//
//  Created by liuchen on 2017/2/28.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "PersonMessageViewController.h"
#import "appCommonAttributes.h"
#import "PersonMessageCell.h"
#import "lzhReturnView.h"
#import "cityPickerView.h"


#define HEIGHTOFIMAGE 100
#define HEIGHTOFOTHER 50

@interface PersonMessageViewController ()<UITableViewDelegate,UITableViewDataSource,cityPickerDelegate>

@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) NSArray *personArray;
//存放当前选中的cell
@property (nonatomic,strong) NSIndexPath *indexPathOfCell;

@end

@implementation PersonMessageViewController

- (void)viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    //添加底层颜色
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建视图
    [self createView];
}

#pragma mark - 创建视图
- (void)createView{

    //存放数据
    self.personArray = @[@"头像",@"昵称",@"个性签名",@"地区",@"性别",@"手机号",@"公司",@"邮箱",@"履历",@"详细地址"];
    //添加导航栏
    lzhReturnView *returnView = [[lzhReturnView alloc]initWithFrame:CGRectMake(0, STATUSBAR_HEIGHT, SCREEN_WIDTH, 44)];
    returnView.backgroundColor = RGBA(0, 177, 251, 1);
    [returnView.ownButt setImage:[UIImage imageNamed:@"nav1.png"] forState:UIControlStateNormal];
    [returnView.ownButt setTitle:@"" forState:UIControlStateNormal];
    returnView.lcSearchButton.hidden = NO;
    returnView.lcSearchButton.userInteractionEnabled = YES;
    [returnView.ownButt addTarget:self action:@selector(dissmiss) forControlEvents:UIControlEventTouchUpInside];
    returnView.ownTitleLabel.text = @"个人信息";
    returnView.ownTitleLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:returnView];
    //添加tableView
    [self.view addSubview:self.tableView];
}

#pragma mark - 返回按钮跳转方法
- (void)dissmiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 创建视图
- (UITableView *)tableView{
    
    if (_tableView == nil) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, STATUSBAR_HEIGHT+44, SCREEN_WIDTH, HEIGHTOFIMAGE+HEIGHTOFOTHER*9) style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.showsVerticalScrollIndicator = NO;
    }
    return _tableView;
}

#pragma mark - tableView的协议方法
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row == 0) {
        return 100;
    }else{
        return 40;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0) {
        NSString *identity1 = @"personMessageCell1";
        PersonMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:identity1];
        if (cell == nil) {
            cell = [[PersonMessageCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identity1];
        }
        cell.textLabel.text = self.personArray[indexPath.row];
        cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        cell.picImageView.image = [UIImage imageNamed:@"u=933971716,719375787&fm=23&gp=0.jpg"];
        return cell;
    }else{
        NSString *identity2 = @"personMessageCell2";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identity2];
        if (cell == nil) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identity2];
        }
    
        cell.textLabel.textColor = [UIColor blackColor];
        cell.textLabel.text = self.personArray[indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        cell.detailTextLabel.textColor = [UIColor blackColor];
        cell.detailTextLabel.textColor = [UIColor blackColor];
        cell.detailTextLabel.text = @"暂定";
        cell.detailTextLabel.font = [UIFont systemFontOfSize:15];
        cell.detailTextLabel.textAlignment = NSTextAlignmentRight;
        return cell;
    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    switch (indexPath.row) {
        case 0:
            
            break;
        case 1:
            
            break;
        case 2:
            
            break;
        case 3:
            //地区选择
            self.indexPathOfCell = indexPath;
            [self displayAddressPickerView];
            break;
        case 4:
            
            break;
        case 5:
            
            break;
        case 6:
            
            break;
        case 7:
            
            break;
        case 8:
            
            break;
        case 9:
            
            break;
        default:
            break;
    }
}

#pragma mark - 地区选择
//弹出地点选择器
- (void)displayAddressPickerView{
    cityPickerView *cityPicker = [[cityPickerView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    cityPicker.ownCityDelegate = self;
    [self.view addSubview:cityPicker];
    
}
//地区点击完成的代理方法
-(void)getCityInformation:(NSString *)_province city:(NSString *)_city area:(NSString *)_area{
    NSLog(@"你选择的地区为%@,%@,%@",_province,_city,_area);
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:self.indexPathOfCell];
    cell.detailTextLabel.text = _city;
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
