//
//  lzhRefresh.m
//  Liankeji
//
//  Created by mac on 2017/2/11.
//  Copyright © 2017年 haichuanhuiwulianxinxi. All rights reserved.
//

#import "lzhRefresh.h"

@implementation lzhRefresh
//背景图片
UIImageView *imageView = nil;
//鸽子图片
UIImageView *pigeonImageview = nil;

-(void)placeSubviews{
    [super placeSubviews];
    if(imageView == nil){
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        imageView.backgroundColor = [UIColor grayColor];
        [imageView setImage:[UIImage imageNamed:@"refresh_down_background.png"]];
        [self addSubview:imageView];
        //
        NSMutableArray *pigeonImageviewArr = [NSMutableArray arrayWithCapacity:12];
        for(NSInteger i = 0; i <12; i ++){
            NSString *name = [NSString stringWithFormat:@"ct_refresh_down_%li",i + 1];
            UIImage *pigeonImage = [UIImage imageNamed:name];
            [pigeonImageviewArr addObject:pigeonImage];
        }
        pigeonImageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width * 0.60,self.frame.size.height)];
        pigeonImageview.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 2);
        pigeonImageview.contentMode = UIViewContentModeScaleAspectFill;
        //pigeonImageview.backgroundColor = [UIColor redColor];
        pigeonImageview.animationImages = pigeonImageviewArr;
        [self addSubview:pigeonImageview];
        //单次最长刷新1min
        pigeonImageview.animationDuration = 3;
        pigeonImageview.animationRepeatCount = 20;
    }
}

-(void)beginRefreshing{
    [super beginRefreshing];
    if([pigeonImageview isAnimating] == NO){
         [pigeonImageview startAnimating];
    }
}
-(void)endRefreshing{
    [super endRefreshing];
    if([pigeonImageview isAnimating]){
        [pigeonImageview stopAnimating];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
