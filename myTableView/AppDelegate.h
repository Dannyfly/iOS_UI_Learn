//
//  AppDelegate.h
//  myTableView
//
//  Created by macbook on 13/10/24.
//  Copyright (c) 2013年 teiron. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MyTabBarController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    MyTabBarController *_myTabBarController;
}

@property (strong, nonatomic) UIWindow *window;

@end
