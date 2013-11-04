//
//  MyTopBar.m
//  myTableView
//
//  Created by macbook on 13/11/1.
//  Copyright (c) 2013年 teiron. All rights reserved.
//

#import "MyTopBar.h"
#import "MyButton.h"

static float x;
static float y;
static float width;
static float height;

@implementation MyTopBar

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        x = frame.origin.x;
        y = frame.origin.y;
        width = frame.size.width;
        height = frame.size.height;
        
        CGFloat curWidth = frame.size.width-4.0;
        _softWareButton = [[MyButton alloc]initWithFrame:CGRectMake(1, 1, curWidth/3.0, frame.size.height-2.0) imageIndex:kSoftWareTag];
        _gameButton = [[MyButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_softWareButton.frame)+1, 1, curWidth/3.0, frame.size.height-2.0) imageIndex:kGameTag];
        _subjectButton = [[MyButton alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_gameButton.frame)+1, 1, curWidth/3.0, frame.size.height-2.0) imageIndex:kSubjectTag];
        
        [self addSubview:_softWareButton];
        [self addSubview:_gameButton];
        [self addSubview:_subjectButton];
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // 画长方形
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    

    // 设置颜色，仅填充4条边
    CGContextSetStrokeColorWithColor(ctx, [[UIColor colorWithRed:0.75 green:0.75 blue:0.75 alpha:1.0] CGColor]);
    // 设置线宽为1
    CGContextSetLineWidth(ctx, 1.0);
    
    // 设置长方形4个顶点
    CGPoint poins[] = {CGPointMake(1, 1),CGPointMake(width-1, 1),CGPointMake(width-1, height-1),CGPointMake(1, height-1)};
    CGContextAddLines(ctx,poins,4);
    
    CGContextClosePath(ctx);
    CGPoint one[] = {CGPointMake(103, 1), CGPointMake(103, 23)};
    CGContextAddLines(ctx, one, 2);
    CGContextClosePath(ctx);
    CGPoint two[] = {CGPointMake(207, 1), CGPointMake(207, 23)};
    CGContextAddLines(ctx, two, 2);
    CGContextClosePath(ctx);
    CGContextStrokePath(ctx);
    
    
    self.backgroundColor = [UIColor clearColor];
}


- (void)dealloc
{
    [super dealloc];
    [_softWareButton release];
    [_gameButton release];
    [_subjectButton release];
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
