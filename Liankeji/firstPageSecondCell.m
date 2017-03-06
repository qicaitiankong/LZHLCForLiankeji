//
//  firstPageHeaderCell.m
//  Liankeji
//
//  Created by 李自豪 on 16/12/16.
//  Copyright © 2016年 haichuanhuiwulianxinxi. All rights reserved.
//
//首页中科技头条的CELL

#import "firstPageSecondCell.h"
#import "appCommonAttributes.h"
#import <Masonry.h>
#import "lzhFirstpageSecondCellView1.h"
#import "lzhFirstPageSecondCellCommentView.h"
#import "lzhReturnLabelHeight.h"
#import "lzhNineButtonViewForScienceCell.h"

@interface firstPageSecondCell (){
    lzhFirstpageSecondCellView1 *viewModel1;
    firstPageSecondCellGroupview *groupView;
    CGFloat contentLabelHeight;
    NSMutableArray *commentArr;
    NSArray *commentContentArr;
    lzhNineButtonViewForScienceCell *buttonImageView;
    BOOL isfirst;
    BOOL isSecond;
    BOOL isThird;
}
@end

@implementation firstPageSecondCell
@synthesize contentLabel;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier targetView:(UIView*)_tableView changeLabelHeight:(CGFloat)height commentViewContentArr:(NSArray*)ContentArr dellegate:(id)delega{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        commentArr = [[NSMutableArray alloc]initWithCapacity:3];
        commentContentArr = [[NSMutableArray alloc]initWithCapacity:3];
        
        //self.backgroundColor = [UIColor grayColor];
        contentLabelHeight = height;
        commentContentArr = ContentArr;
        //
         viewModel1 = [[lzhFirstpageSecondCellView1 alloc]initWithFrame:CGRectMake(0, 0, _tableView.frame.size.width, 0.067 * SCREEN_HEIGHT)];
        self.userImageButt = viewModel1.imageButt;
        self.userNameLabel = viewModel1.nameLabel;
        self.userTimeLabel = viewModel1.timeLabel;
        [self.contentView addSubview:viewModel1];
        //
        contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(5, viewModel1.frame.origin.y + viewModel1.frame.size.height, _tableView.frame.size.width - 2 * 5, height)];
        contentLabel.numberOfLines = 0;
        contentLabel.font = [UIFont systemFontOfSize:15];
        contentLabel.backgroundColor = [UIColor whiteColor];
        contentLabel.textColor = [UIColor colorWithRed:161 / 255 green:161 / 255 blue:161 / 255 alpha:1];
        [self.contentView addSubview:contentLabel];
        //图片
        
        buttonImageView = [[lzhNineButtonViewForScienceCell alloc]initWithFrame:CGRectMake(contentLabel.frame.origin.x, contentLabel.frame.origin.y + contentLabel.frame.size.height, SCREEN_WIDTH * 0.95, SCREEN_WIDTH * 0.95)];
        [self.contentView addSubview:buttonImageView];
        //
      // groupView = [[firstPageSecondCellGroupview alloc]initWithFrame:CGRectMake(0, contentLabel.frame.origin.y + contentLabel.frame.size.height + 5, _tableView.frame.size.width, SCREEN_HEIGHT * 0.037)];
        groupView = [[firstPageSecondCellGroupview alloc]initWithFrame:CGRectMake(0, buttonImageView.frame.origin.y + buttonImageView.frame.size.height + 5, _tableView.frame.size.width, SCREEN_HEIGHT * 0.037)];
        groupView.targetDelegate = delega;
        [self.contentView addSubview:groupView];
        //
        for(NSInteger i = 0; i <ContentArr.count; i ++){
            lzhFirstPageSecondCellCommentView *commentView = [[lzhFirstPageSecondCellCommentView alloc]initWithFrame:CGRectMake(5, groupView.frame.origin.y + groupView.frame.size.height + 5, _tableView.frame.size.width - 2 * 5, 10)];
             commentView.commentLabel.text = commentContentArr[i];
            [commentArr addObject:commentView];
            [self.contentView addSubview:commentView];
        }
        [self addLZHConstrainss];
         NSLog(@"comment count:%li",commentArr.count);
    }
    //
    
    return self;
}

-(void)addLZHConstrainss{
    [viewModel1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView);
        make.width.mas_equalTo(SCREEN_WIDTH * 0.95);
        make.top.mas_equalTo(self.contentView);
        make.height.mas_equalTo(SCREEN_HEIGHT * 0.067);
        
    }];
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.contentView);
        make.width.mas_equalTo(SCREEN_WIDTH * 0.95);
        make.top.mas_equalTo(viewModel1.mas_bottom).offset(5);
        make.height.mas_equalTo(contentLabelHeight);
    }];
    //
    [buttonImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(contentLabel);
        make.top.mas_equalTo(contentLabel.mas_bottom);
        make.width.height.mas_equalTo(SCREEN_WIDTH * 0.95);
        
    }];
    //
    [groupView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(buttonImageView);
        make.top.mas_equalTo(buttonImageView.mas_bottom).offset(5);
//        make.left.right.mas_equalTo(contentLabel);
//        make.top.mas_equalTo(contentLabel.mas_bottom).offset(5);
        make.height.mas_equalTo(SCREEN_HEIGHT * 0.037);
    }];
   
    if(commentArr.count > 0){
        lzhFirstPageSecondCellCommentView *commentV1 = commentArr[0];
        CGFloat commentHeight =  [lzhReturnLabelHeight getLabelHeight:commentContentArr[0] fontSize:12 width:SCREEN_WIDTH * 0.7];
        [commentV1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(groupView.mas_bottom).offset(5);
            make.left.right.mas_equalTo(groupView);
            make.height.mas_equalTo(commentHeight);
        }];
        commentV1.commentLabel.text = commentContentArr[0];
        if(commentArr.count > 1){
            lzhFirstPageSecondCellCommentView *commentV2 = commentArr[1];
            CGFloat commentHeight2 =  [lzhReturnLabelHeight getLabelHeight:commentContentArr[1] fontSize:12 width:SCREEN_WIDTH * 0.7];
            [commentV2 mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.mas_equalTo(commentV1.mas_bottom);
                make.left.right.mas_equalTo(commentV1);
                make.height.mas_equalTo(commentHeight2);
            }];
            commentV2.commentLabel.text = commentContentArr[1];
            if(commentArr.count == 3){
                lzhFirstPageSecondCellCommentView *commentV3 = commentArr[2];
                CGFloat commentHeight3 =  [lzhReturnLabelHeight getLabelHeight:commentContentArr[2] fontSize:12 width:SCREEN_WIDTH * 0.7];
                NSLog(@"评论3高度：%lf",commentHeight3);
                [commentV3 mas_makeConstraints:^(MASConstraintMaker *make) {
                     NSLog(@"快内评论3高度：%lf",commentHeight3);
                    make.top.mas_equalTo(commentV2.mas_bottom);
                    make.left.right.mas_equalTo(commentV2);
                    make.height.mas_equalTo(commentHeight3);
                     NSLog(@"父亲LABELEview布局");
                }];
               
            }
        }
    }
}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
