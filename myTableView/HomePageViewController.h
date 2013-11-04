//
//  ViewController.h
//  myTableView
//
//  Created by macbook on 13/10/24.
//  Copyright (c) 2013年 teiron. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyTableView;
@class MyTopBar;

@interface HomePageViewController : UIViewController 
{
    MyTableView  *_myTableView;
    MyTopBar     *_myTopBar;
}

@end
