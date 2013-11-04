//
//  MyButton.m
//  myTableView
//
//  Created by macbook on 13/11/1.
//  Copyright (c) 2013年 teiron. All rights reserved.
//

#import "MyButton.h"



@implementation MyButton

- (id)initWithFrame:(CGRect)frame imageIndex:(int)index
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImage *img;
        _buttonImage = [[UIImageView alloc]initWithFrame:CGRectMake(20, 2, 16, 16)];
        _buttonLabel = [[UILabel alloc]initWithFrame:CGRectMake(50, 2, 30, 18)];
        
        switch (index) {
            case kSoftWareTag:
                img = [UIImage imageNamed:@"software_black.png"];
                _buttonLabel.text = @"软件";
                break;
                
            case kGameTag:
                img = [UIImage imageNamed:@"game_black.png"];
                _buttonLabel.text = @"游戏";
                break;
                
            case kSubjectTag:
                img = [UIImage imageNamed:@"subject_black.png"];
                _buttonLabel.text = @"主题";
                break;
                
            default:
                break;
        }
        
        _buttonImage.image = img;
        [_buttonLabel setTag:index];        // 设置Button的Tag
        [self addSubview:_buttonImage];
        
        _buttonLabel.textColor = [UIColor blackColor];
        _buttonLabel.backgroundColor = [UIColor clearColor];
        [_buttonLabel setFont:[UIFont systemFontOfSize:12]];
        [self addSubview:_buttonLabel];
        
        self.tag = index;
        [self addTarget:self action:@selector(ButtonClickUp:) forControlEvents:UIControlEventTouchUpInside];
        [self addTarget:self action:@selector(ButtonClickDown:) forControlEvents:UIControlEventTouchDown];
        
        self.backgroundColor = [UIColor whiteColor];
        
    }
    return self;
}

- (IBAction)ButtonClickUp:(id)sender
{
    UIImage *img;
    if (nil != [sender viewWithTag:kSoftWareTag])
    {
        img = [UIImage imageNamed:@"software_black.png"];
        NSLog(@"You press down  软件  button");
    }
    else if (nil != [sender viewWithTag:kGameTag])
    {
        img = [UIImage imageNamed:@"game_black.png"];
        NSLog(@"You press down  游戏  button");
    }
    else if (nil != [sender viewWithTag:kSubjectTag])
    {
        img = [UIImage imageNamed:@"subject_black.png"];
        NSLog(@"You press down  主题  button");
    }
    
    _buttonImage.image = img;
    _buttonLabel.textColor = [UIColor blackColor];
    self.backgroundColor = [UIColor whiteColor];
}

- (IBAction)ButtonClickDown:(id)sender
{
    
    UIImage *img;
    if (nil != [sender viewWithTag:kSoftWareTag])
    {
        img = [UIImage imageNamed:@"software_grey.png"];
    }
    else if (nil != [sender viewWithTag:kGameTag])
    {
        img = [UIImage imageNamed:@"game_grey.png"];
    }
    else if (nil != [sender viewWithTag:kSubjectTag])
    {
        img = [UIImage imageNamed:@"subject_grey.png"];
    }
    
    _buttonImage.image = img;
    _buttonLabel.textColor = [UIColor whiteColor];
    
    self.backgroundColor = [[UIColor alloc]initWithRed:0.1 green:0.3 blue:0.7 alpha:1];
}

- (void)dealloc
{
    [super dealloc];
    [_buttonImage release];
    [_buttonLabel release];
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
