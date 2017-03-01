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
#import "announceSecondPageScrollView.h"
//
#import <MobileCoreServices/MobileCoreServices.h>

@interface annoounceSecondPageViewController ()<announceSecondPageDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    lzhReturnView *returnView;
    UIImagePickerController *imagePickerController;
    BOOL didAppear;
}

@property (strong,nonatomic)anounceSecondPageView *anounceView;

@property (strong,nonatomic)announceSecondPageScrollView *secondWriteView;

@end

@implementation annoounceSecondPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self addReturnView];
    [self addAnnounceView];
    [self addSecondWriteView];
   
    NSLog(@"发布view标题：%@",self.announceTypeStr);
    // Do any additional setup after loading the view.
}
-(void)viewDidAppear:(BOOL)animated{
    if(didAppear == NO){
        NSLog(@"照片控制器初始化（保证界面切换流畅性）");
        [self initImageController];
        didAppear = YES;
    }
}

//添加上部返回view
- (void)addReturnView{
    returnView = [[lzhReturnView alloc]initWithFrame:CGRectMake(0, STATUSBAR_HEIGHT, self.view.frame.size.width,NAVIGATION_HEIGHT)];
    [returnView.ownButt setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     returnView.ownTitleLabel.text = self.announceTypeStr;
    [returnView.ownButt addTarget:self action:@selector(returnHandler:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:returnView];
}
//添加填写第一个视图
- (void)addAnnounceView{
    self.anounceView = [[anounceSecondPageView alloc]initWithFrame:CGRectMake(0, returnView.frame.origin.y + returnView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - (returnView.frame.origin.y + returnView.frame.size.height)) delegate:self];
    [self.view addSubview:self.anounceView];
}
//
- (void)addSecondWriteView{
    self.secondWriteView = [[announceSecondPageScrollView alloc]initWithFrame:CGRectMake(self.view.frame.size.width, returnView.frame.origin.y + returnView.frame.size.height, self.view.frame.size.width, self.view.frame.size.height - (returnView.frame.origin.y + returnView.frame.size.height))];
    [self.secondWriteView.previousButt addTarget:self action:@selector(previouButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.secondWriteView.commitButt addTarget:self action:@selector(commitButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.secondWriteView];
}

//初始化相册控制器
-(void)initImageController{
    imagePickerController = [[UIImagePickerController alloc]init];
    imagePickerController.delegate = self;
    imagePickerController.allowsEditing = YES;
    imagePickerController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
}
-(void)returnHandler:(UIButton*)_b{
        [UIView animateWithDuration:0.5 animations:^{
            self.anounceView.transform = CGAffineTransformMakeTranslation(self.view.frame.size.width, 0);
            self.secondWriteView.transform = CGAffineTransformMakeTranslation(self.view.frame.size.width, 0);
            self.windowView.transform = CGAffineTransformIdentity;
        } completion:^(BOOL finished) {
            [self dismissViewControllerAnimated:NO completion:^{
            }];
        }];
}
//
//（点击下一步）(代理)
-(void)clickNextStep{
    [UIView animateWithDuration:1 animations:^{
        self.secondWriteView.transform = CGAffineTransformMakeTranslation(-self.secondWriteView.bounds.size.width, 0);
    }];
}
//上一步（非代理）
-(void)previouButtonClick:(UIButton*)_b{
    NSLog(@"点击了上一步");
    [UIView animateWithDuration:1 animations:^{
        self.secondWriteView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
    }];
}
//提交（非代理）
-(void)commitButtonClick:(UIButton*)_b{
    NSLog(@"点击了提交");
    //网络提交数据
}



//显示底部选取控件(代理方法)
-(void)displayChoosePhotoAlert{
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
    if([mediaType isEqualToString:(NSString*)kUTTypeImage]){//是图片
        UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
        //转换为了JPEG
        NSData *imageData = UIImageJPEGRepresentation(image, 1);
        UIImage *jpegImage = [UIImage imageWithData:imageData];
        if(picker.sourceType == UIImagePickerControllerSourceTypeCamera){
            //拍照保存到相册
            UIImageWriteToSavedPhotosAlbum(jpegImage, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
        }else if(picker.sourceType == UIImagePickerControllerSourceTypePhotoLibrary){//直接从相册选取
        }
        //添加图片
        [self setImage:jpegImage];
    }
    [picker dismissViewControllerAnimated:NO completion:^{
    }];
}
//用户点击了取消（pickerControlller上的）
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [picker dismissViewControllerAnimated:NO completion:^{
    }];
}

//保存相册陈功的回调（自己写的方法）
- (void) image: (UIImage *) image didFinishSavingWithError:(NSError *) error contextInfo: (void *)contextInf{
    if(error){
        NSLog(@"相册保存失败");
    }else{
        NSLog(@"相册保存成功");
    }
}
//设置图片
- (void)setImage:(UIImage*)image{
    UIImage *image2 = [image copy];
    //只是设置图片，最后提交的时候再上传到后台
    [self.anounceView.photoButt setImage:image2 forState:UIControlStateNormal];
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
