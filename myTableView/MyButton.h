//
//  MyButton.h
//  myTableView
//
//  Created by macbook on 13/11/1.
//  Copyright (c) 2013年 teiron. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kSoftWareTag    1
#define kGameTag        2
#define kSubjectTag     3

@interface MyButton : UIButton
{
    UIImageView *_buttonImage;   // buton中由一个图标和一个标签组成
    UILabel     *_buttonLabel;
}

- (id)initWithFrame:(CGRect)frame imageIndex:(int)index;
@end
