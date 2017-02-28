//
//  annoounceSecondPageViewController.m
//  Liankeji
//
//  Created by mac on 2017/1/17.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "annoounceSecondPageViewController.h"
#import "anounceSecondPageView.h"
#import "lzhAlertControllerViewController.h"
#import "lzhReturnView.h"
#import "appCommonAttributes.h"
//
#import <MobileCoreServices/MobileCoreServices.h>

@interface annoounceSecondPageViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    lzhReturnView *returnView;
    UIImagePickerController *imagePickerController;
}

@end

@implementation annoounceSecondPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addReturnView];
    [self addAnnounceView];
    [self initImageController];
    // Do any additional setup after loading the view.
}
//添加上部返回view
- (void)addReturnView{
    returnView = [[lzhReturnView alloc]initWithFrame:CGRectMake(0, STATUSBAR_HEIGHT, self.view.frame.size.width,NAVIGATION_HEIGHT)];
    [returnView.ownButt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [returnView.ownButt addTarget:self action:@selector(returnHandler:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:returnView];
}
//添加第一个视图
- (void)addAnnounceView{
    self.anounceView = [[anounceSecondPageView alloc]initWithFrame:CGRectMake(0, returnView.frame.origin.y + returnView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - (returnView.frame.origin.y + returnView.frame.size.height)) delegate:nil];
    self.anounceView.ownTitleLabel.text = @"发布技术";
    [self.view addSubview:self.anounceView];
}
//初始化相册控制器
-(void)initImageController{
    imagePickerController = [[UIImagePickerController alloc]init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES;
    imagePickerController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    //imagePickerController.showsCameraControls = YES;//显示照相机标准的控件库

}

-(void)returnHandler:(UIButton*)_b{
        [UIView animateWithDuration:0.5 animations:^{
            self.anounceView.transform = CGAffineTransformMakeTranslation(self.view.frame.size.width, 0);
             self.windowView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [self dismissViewControllerAnimated:NO completion:^{
            }];
        }];
}
-(void)choosePhoto{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"上传图片" message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    UIAlertAction *selectPhotoAction = [UIAlertAction actionWithTitle:@"从相册选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        NSLog(@"相册选取图片");
        [self presentViewController:imagePickerController animated:YES completion:^{
            [alertController dismissViewControllerAnimated:NO completion:^{
            }];
        }];
    }];
    UIAlertAction *PhotoAction = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //拍照
        if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){//支持拍照
            NSLog(@"支持拍照");
            imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:imagePickerController animated:YES completion:^{
                [alertController dismissViewControllerAnimated:NO completion:^{
                }];
            }];
        }else{
            NSLog(@"不支持拍照");
        }
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:selectPhotoAction];
    [alertController addAction:PhotoAction];
    [self presentViewController:alertController animated:YES completion:^{
    }];
}
//image picker 代理


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    if([mediaType isEqualToString:(NSString*)kUTTypeImage]){
        UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
        [self uploadImage:image];
    }
    [picker dismissViewControllerAnimated:YES completion:^{
    }];
}
- (void)uploadImage:(UIImage*)image{
    //只是设置图片，最后提交的时候再上传到后台
    [self.anounceView.photoButt setImage:image forState:UIControlStateNormal];
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
