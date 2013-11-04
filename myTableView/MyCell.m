//
//  MyCell.m
//  myTableView
//
//  Created by macbook on 13/10/28.
//  Copyright (c) 2013年 teiron. All rights reserved.
//

#import "MyCell.h"
#import "MyScrollView.h"

static NSInteger static_row = 0;
static NSMutableArray *static_softNameArray = nil;

@implementation MyCell

- (id)initWithScrollView:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // 创建ScrollView (第一行Cell显示)
        _myScrollView = [[MyScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, 95)];
        [self addSubview:_myScrollView];   // 不是添加到这个View中去
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        // 图标
        _softImage = [[UIImageView alloc]initWithFrame:CGRectMake(12, 9, 32, 32)];
        NSString *imgName = [NSString stringWithFormat:@"iphone%d.png", static_row];  // 减去ScrollView那一行
        _softImage.image = [UIImage imageNamed:imgName];
        [self addSubview:_softImage];
        
        // 名字
        _softName = [[UILabel alloc]initWithFrame:CGRectMake(53, 8, 200, 11)];
        _softName.text = [static_softNameArray objectAtIndex:static_row];
        _softName.font = [UIFont boldSystemFontOfSize:10];
        [self addSubview:_softName];
        
        // 得分
        _softScore = [[UILabel alloc]initWithFrame:CGRectMake(53, 23, 60, 8)];
        _softScore.text = @"得分 5.0分";
        _softScore.font = [UIFont systemFontOfSize:7];
        //        _softScore.textColor = [UIColor colorWithRed:0 green:0 blue:225 alpha:1]; // 不起作用
        _softScore.textColor = [UIColor blueColor];
        [self addSubview:_softScore];
        
        // 详情
        _softDetail = [[UILabel alloc]initWithFrame:CGRectMake(53, 34, 200, 8)];
        _softDetail.text = @"版本1.2.06 | 28.76M | 总下载 9999.9万";
        _softDetail.font = [UIFont systemFontOfSize:7];
        _softDetail.textColor = [UIColor grayColor];
        [self addSubview:_softDetail];
        
        // 下载按钮
        _softDownLoad = [[UIButton alloc]initWithFrame:CGRectMake(270, 16, 38, 18)];
        [_softDownLoad setTitle:@"下 载" forState:UIControlStateNormal];
        UIImage *btnBackImg = [UIImage imageNamed:@"222.png"]; // button_blue.png
        [_softDownLoad setBackgroundImage:btnBackImg forState:UIControlStateNormal];
        [_softDownLoad setTintColor:[UIColor whiteColor]];
        _softDownLoad.titleLabel.font = [UIFont boldSystemFontOfSize:9];
        [_softDownLoad addTarget:self action:@selector(downLoadButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_softDownLoad];
    }
    return self;
}

// 创建、复用，或选中某个Cell时都会回调。
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
//    static int i = 1;
//    NSLog(@"You Select one cell %d time", i++);
}

// 刷新一条cell的内容
- (void)flushCell:(NSInteger)row
{
    NSString *imgName = [NSString stringWithFormat:@"iphone%d.png", row%17]; // 资源里一共有17个不同的图标
    _softImage.image = [UIImage imageNamed:imgName];
    _softName.text = [static_softNameArray objectAtIndex:static_row]; // 名字
    _softScore.text = @"得分 5.0分"; // 得分
    _softDetail.text = @"版本1.2.06 | 28.76M | 总下载 9999.9万"; // 详情
}


+(void) setCellRow:(NSInteger)row
{
    static_row = row;
}

+(void) copySoftNameArray:(NSMutableArray *)array
{
    static_softNameArray = [[NSMutableArray alloc]initWithArray:array];
}

// 具体什么时候会调用？？？
// override point. called by layoutIfNeeded automatically. As of iOS 6.0, when constraints-based layout is used the base implementation applies the constraints-based layout, otherwise it does nothing.
- (void)layoutSubviews
{
    [super layoutSubviews];
//    static int i = 1;
//    NSLog(@"call layoutSubviews %d time", i++);
}

// 下载按钮
-(IBAction)downLoadButton:(id)sender
{
    NSLog(@"You press 下载  button");
}


- (void)dealloc
{
    [_softImage release];
    [_softName release];
    [_softScore release];
    [_softDetail release];
    [_softDownLoad release];
    [super dealloc];
    
}
@end
