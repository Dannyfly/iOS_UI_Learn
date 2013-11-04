//
//  MyCell.h
//  myTableView
//
//  Created by macbook on 13/10/28.
//  Copyright (c) 2013年 teiron. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyScrollView;

// 定制的TableViewCell子类
@interface MyCell : UITableViewCell  // 继承UITableViewCell干嘛呢？  好像没用到多少其回调方法
                                     // delegate 应该由MyTableView来实现 !
{
    // 一个定制Cell里应该有的内容
    UIImageView     *_softImage;        // 图标
    UILabel         *_softName;         // 名字
    UILabel         *_softScore;        // 得分
    UILabel         *_softDetail;       // 详情
    UIButton        *_softDownLoad;     // 下载按钮
    
    MyScrollView    *_myScrollView;     // 第一个Cell中的ScrollView
}

-(void) flushCell:(NSInteger)row;           // 刷新一条cell的内容
-(IBAction)downLoadButtonClick:(id)sender;  // 下载按钮响应函数

+(void) setCellRow:(NSInteger)row;          // 设置行号
+(void) copySoftNameArray:(NSArray *)array;  // 设置名字数组

- (id)initWithScrollView:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;   // 创建ScrollView那个Cell

@end
