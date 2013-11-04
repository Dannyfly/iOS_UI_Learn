//
//  MyTableView.h
//  myTableView
//
//  Created by macbook on 13/10/31.
//  Copyright (c) 2013年 teiron. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyCell;

@interface MyTableView : UIView <UITableViewDataSource, UITableViewDelegate>
{
    MyCell          *_myCell;           // 定制的Cell
    UITableView     *_myTableView;      // TableView
    NSMutableArray  *_softNameList;     // 软件名字列表
    NSInteger       _curRowNumber;      // 当前cell的行号
}

@end
