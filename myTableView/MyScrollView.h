//
//  MyScrollView.h
//  myTableView
//
//  Created by macbook on 13/10/30.
//  Copyright (c) 2013年 teiron. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyScrollView : UIScrollView <UIScrollViewDelegate>
{
    UIScrollView    *_myScrollView;
    UIPageControl   *_myPageControl;
    NSArray         *_imageViewArray;
    
@public
    NSInteger       _curPage;
}

@property (retain, nonatomic) NSMutableArray    *_myimageList;
@property (retain, nonatomic) UIScrollView      *_myScrollView;
@property (retain, nonatomic) UIPageControl     *_myPageControl;

- (void)refreshPage;

- (IBAction)changePage:(id)sender; // 连接分页控件的value changed事件

@end
