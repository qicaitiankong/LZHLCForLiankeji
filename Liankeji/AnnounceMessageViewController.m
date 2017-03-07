//
//  AnnounceMessageViewController.m
//  Liankeji
//
//  Created by liuchen on 2017/3/3.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "AnnounceMessageViewController.h"
#import "AnnounceMessageView.h"
#import "appCommonAttributes.h"
#import "TZImagePickerController.h"

@interface AnnounceMessageViewController ()<TZImagePickerControllerDelegate>

/** 图片数组 */
@property (nonatomic, strong) NSMutableArray *photoArr;

@end

@implementation AnnounceMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //创建视图
    [self createView];
}

//创建视图
- (void)createView{
    
    AnnounceMessageView *announceMessageView = [[AnnounceMessageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, STATUSBAR_HEIGHT+44+100+SCREEN_HEIGHT*0.3)];
    [announceMessageView.selectButton addTarget:self action:@selector(select) forControlEvents:UIControlEventTouchUpInside];
    [announceMessageView.navView.backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [announceMessageView.navView.preservationButton setTitle:@"保存" forState:UIControlStateNormal];
    [announceMessageView.navView.preservationButton addTarget:self action:@selector(upImageWithData) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:announceMessageView];
}


#pragma mark - 选择图片
- (void)select{

    TZImagePickerController *tzImageController = [[TZImagePickerController alloc]initWithMaxImagesCount:9 delegate:self];
    [tzImageController setDidFinishPickingPhotosHandle:^(NSArray<UIImage *> *photos, NSArray *assets, BOOL isSelectOriginalPhoto) {
        
    }];
    
    [self presentViewController:tzImageController animated:YES completion:nil];
}

#pragma mark - 回调方法
- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto {
    [self.photoArr addObjectsFromArray:photos];
    NSMutableArray *tempArr = [NSMutableArray array];
    if (self.photoArr.count >= 12) {
        for (NSInteger i= 0; i < 12; i++) {
            [tempArr addObject:self.photoArr[i]];
        }
        self.photoArr = tempArr;
    }
    
    
}

#pragma mark - 返回
- (void)back{

    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - 保存数据
- (void)upImageWithData{

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
