//
//  MyTopBar.h
//  myTableView
//
//  Created by macbook on 13/11/1.
//  Copyright (c) 2013年 teiron. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MyButton;

@interface MyTopBar : UIView
{
    MyButton *_softWareButton;  // top tabbar 中由3个按钮组成
    MyButton *_gameButton;
    MyButton *_subjectButton;
}

@end
