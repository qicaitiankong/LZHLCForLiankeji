//
//  centerButtonGroupViewController.m
//  Liankeji
//
//  Created by mac on 2017/1/9.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "centerButtonGroupViewController.h"
#import "ZHQScrollMenu.h"
#import "appCommonAttributes.h"
#import "cityPickerView.h"
#import "lzhReturnView.h"
#import "lzhPickerView.h"
#import "lzhShadeButton.h"
#import "lzhSearchView.h"
#import "lzhFirstPageFindZhuanjiaTableViewCell.h"
#import "lzhReturnLabelHeight.h"
#import "AnswerOfExpertsViewController.h"

@interface centerButtonGroupViewController ()<cityPickerDelegate,categoryButtonClickDelegate,pickerCompannyDelegate,lzhSearchDele,UITableViewDelegate,UITableViewDataSource>{
    //企业类型
    NSArray *categoryTitleArr ;
    //行业类型
    NSArray *jobArr;
    ZHQScrollMenu *categoryButtonGroup;
    //遮罩
    lzhShadeButton *shadowButt;
    //选择器
    lzhPickerView *pickerView;
    //当前点击的按钮标签
    NSInteger currentSelectButtTag;
    //
    UITableView *myTableView;
    //
    lzhSearchView *searchView;
    
    
}
@end

@implementation centerButtonGroupViewController
NSString *tetsStr;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    categoryTitleArr = @[@"个人独资",@"合伙企业",@"公司"];
    jobArr = @[@"软件",@"养殖",@"工业",@"制造业"];
    tetsStr = @"健康的时间考虑的技术开发附近看到了实际付款了都是九分裤老司机法律手段而我如何或热日金额可进入可进入可任务一威武热我欧瑞欧日欧";
    //
    [self setReturnButton];
    [self initSearchView];
    [self AddButtonGroup];
    //
    [self initTableView];
    // Do any additional setup after loading the view.
}
//返回按钮
- (void)setReturnButton{
    [self.returnView.ownButt addTarget:self action:@selector(returnButtonHandler:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.returnView];
}
//返回按钮点击
- (void)returnButtonHandler:(UIButton*)_b{
    [self dismissViewControllerAnimated:YES completion:nil];
}
//
- (void)initSearchView{
    searchView = [[lzhSearchView alloc]initWithFrame:CGRectMake(0, self.returnView.frame.origin.y + self.returnView.frame.size.height, self.view.frame.size.width, 40)];
    searchView.targetDele = self;
    [self.view addSubview:searchView];
    
    
}

//添加上部按钮组
- (void)AddButtonGroup{
    NSArray *titleArr = @[@"地区",@"企业类型",@"行业",@"筛选"];
   categoryButtonGroup = [[ZHQScrollMenu alloc]initWithFrame:CGRectMake(0, searchView.frame.origin.y + searchView.frame.size.height, self.view.frame.size.width, 40) delegate:self];
    categoryButtonGroup.repeatClick = YES;
    [self.view addSubview:categoryButtonGroup];
    categoryButtonGroup.lineView.hidden = YES;
    categoryButtonGroup.norMalTitleColor = [UIColor grayColor];
    categoryButtonGroup.changeTitleColor = [UIColor grayColor];
    [categoryButtonGroup addButton:titleArr titleFontSize:14];

}
//
-(void)initTableView{
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, categoryButtonGroup.frame.origin.y + categoryButtonGroup.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - categoryButtonGroup.frame.origin.y - categoryButtonGroup.frame.size.height) style:UITableViewStylePlain];
    [self.view addSubview:myTableView];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [myTableView reloadData];
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat height = 0;
    height = [lzhReturnLabelHeight getLabelHeight:tetsStr fontSize:13 width:SCREEN_WIDTH * 0.75];
    return 15 + SCREEN_HEIGHT * 0.052 + height + 20;
}

//
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //自定义cell
    lzhFirstPageFindZhuanjiaTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"searchCell01"];
    if(nil == cell){
        CGFloat height2 = 0;
        height2 = [lzhReturnLabelHeight getLabelHeight:tetsStr fontSize:13 width:SCREEN_WIDTH * 0.75];
        cell = [[lzhFirstPageFindZhuanjiaTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"searchCell01" contentLabelHeight:height2];
        [cell.userButt addTarget:self action:@selector(clickUserButt:) forControlEvents:UIControlEventTouchUpInside];
    }
    cell.userNameLabel.text = @"迟建勇";
    cell.jobLabel.text = @"航天航空";
    cell.homePlace.text = @"青岛大学";
    cell.contentLabel.text = tetsStr;
    cell.beginMoneyLabel.text = @"100元起价";
    cell.purchasePersonNumberLabel.text = @"999购买";
    return cell;
}
//点击了专家头像
-(void)clickUserButt:(UIButton*)_b{
    AnswerOfExpertsViewController *answerVC = [[AnswerOfExpertsViewController alloc]init];
    [self presentViewController:answerVC animated:YES completion:^{
    }];
}

//
//按钮点击
-(void)categoryButtonHandler:(NSInteger)tag{
    currentSelectButtTag = tag;
    switch (tag) {
        case 0:
            //NSLog(@"点击地区按钮");
            [self displayAddressPickerView];
            break;
        case 1:
            //NSLog(@"点击第二个按钮");
            [self displayOtherPickerView:categoryTitleArr];
            break;
        //行业
        case 2:
            [self displayOtherPickerView:jobArr];
            break;
        case 3:
            //进行筛选
            [self clickFilterHandler];
            break;
        default:
            break;
    }
}
//点击搜索按钮
-(void)clickSearchButt:(UIButton *)_b{
    NSLog(@"你在点击搜索按钮");
}

//弹出地点选择器
- (void)displayAddressPickerView{
    cityPickerView *cityPicker = [[cityPickerView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    cityPicker.ownCityDelegate = self;
    [self.view addSubview:cityPicker];
    
}
//地区点击完成的代理方法
-(void)getCityInformation:(NSString *)_province city:(NSString *)_city area:(NSString *)_area{
    NSLog(@"你选择的地区为%@,%@,%@",_province,_city,_area);
     [categoryButtonGroup setButtonTitle:_area index:currentSelectButtTag];

}
//处理第二个与第三个的点击弹出的内容
- (void)displayOtherPickerView:(NSArray*)titleArr{
     shadowButt = [[lzhShadeButton alloc]initWithFrame:CGRectMake(0, self.returnView.frame.origin.y + self.returnView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height -self.returnView.frame.origin.y - self.returnView.frame.size.height )];
    [self.view addSubview:shadowButt];
    
    pickerView = [[lzhPickerView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width * 0.6, 150) titleArr:titleArr];
    pickerView.targetDelegate = self;
    pickerView.center = self.view.center;
    [self.view addSubview:pickerView];
}
//点击筛选
-(void)clickFilterHandler{
    NSLog(@"进行筛选");
}

//点击选择器按钮
-(void)getPickerInfomation:(NSString *)selectInfomation buttonTag:(NSInteger)tag{
    if(tag == 0){
       //取消按钮
        [self removePickerAndShadow];
    }else{
        NSLog(@"select string = %@",selectInfomation);
        //确认按钮
        [categoryButtonGroup setButtonTitle:selectInfomation index:currentSelectButtTag];
        [self removePickerAndShadow];
    }
}
//移除选择器，遮罩
- (void)removePickerAndShadow{
    [pickerView removeFromSuperview];
    [shadowButt removeFromSuperview];
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
