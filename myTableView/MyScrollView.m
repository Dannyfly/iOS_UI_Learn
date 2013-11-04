//
//  MyScrollView.m
//  myTableView
//
//  Created by macbook on 13/10/30.
//  Copyright (c) 2013年 teiron. All rights reserved.
//

#import "MyScrollView.h"

@implementation MyScrollView

@synthesize _myScrollView;
@synthesize _myPageControl;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        _myScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(5, 0, 310, 100)];
        _myScrollView.delegate = self;
        
        _imageViewArray = [NSArray arrayWithObjects:
                           [UIImage imageNamed:@"image1.png"],
                           [UIImage imageNamed:@"image2.png"],
                           [UIImage imageNamed:@"image3.png"],
                           [UIImage imageNamed:@"image4.png"], nil];
        
        for (int i=0; i<_imageViewArray.count; i++)
        {
            CGRect frame;
            frame.origin.x = _myScrollView.frame.size.width * i;
            frame.origin.y = 0;
            frame.size = _myScrollView.frame.size;
            UIImageView *subView = [[UIImageView alloc]initWithFrame:frame];
            subView.image = [_imageViewArray objectAtIndex:i];
            [_myScrollView addSubview:subView];
            [subView release];
        }
        
        // 设置ScrollView
        _myScrollView.pagingEnabled = YES;
        _myScrollView.contentSize = CGSizeMake(_myScrollView.frame.size.width*_imageViewArray.count, _myScrollView.frame.size.height);
        _myScrollView.showsHorizontalScrollIndicator = NO;
        _myScrollView.showsVerticalScrollIndicator = NO;
        _myScrollView.scrollsToTop = NO;
        _myScrollView.bounces = NO;
        _myScrollView.delegate = self;
        [self addSubview:_myScrollView];
        
        // 添加在self.view上,而不是ScrollView上
        _myPageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(130, 80, 40, 10)];
        _curPage = _myPageControl.currentPage = 0;             // 当前页为0
        _myPageControl.numberOfPages = _imageViewArray.count;
        [_myPageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
        [self addSubview:_myPageControl];
        
    }
    return self;
}

// TableView拉动回来后，调用此函数刷新PageControl（或者根本就不用刷新？？？？）
- (void)refreshPage
{
    for (int i=0; i<_imageViewArray.count; i++)
    {
        CGRect frame;
        frame.origin.x = _myScrollView.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = _myScrollView.frame.size;
        UIImageView *subView = [[UIImageView alloc]initWithFrame:frame];
        subView.image = [_imageViewArray objectAtIndex:i];
        [_myScrollView addSubview:subView];
        [subView release];
    }
    
}

#pragma mark - UIScrollView Delegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat pageWidth = _myScrollView.frame.size.width;
    // 在滚动超过页面宽度的50%的时候，切换到新的页面
    int page = floor((_myScrollView.contentOffset.x + pageWidth/2)/pageWidth) ;
    _curPage = _myPageControl.currentPage = page;
    CGRect frame = _myPageControl.frame;
    frame.origin.x += _myScrollView.frame.size.width * page;
}

// 改变page后,修改响应的ScrollView显示的图片
- (IBAction)changePage:(id)sender
{
    CGRect frame;
    frame.origin.x = _myScrollView.frame.size.width * _myPageControl.currentPage;
    frame.origin.y = 0;
    frame.size = _myScrollView.frame.size;
    [_myScrollView scrollRectToVisible:frame animated:YES];
}


- (void)dealloc
{
    [super dealloc];
    [_myScrollView release];
    [_myPageControl release];
    [_imageViewArray release];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
