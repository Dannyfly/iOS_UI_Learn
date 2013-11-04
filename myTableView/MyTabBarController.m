//
//  MyTabBarController.m
//  myTableView
//
//  Created by macbook on 13/11/1.
//  Copyright (c) 2013年 teiron. All rights reserved.
//

#import "MyTabBarController.h"
#import "HomePageViewController.h"
#import "SearchViewController.h"
#import "DownloadViewController.h"
#import "UpdateViewController.h"


@interface MyTabBarController ()

@end

@implementation MyTabBarController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
//        self.view.backgroundColor = [UIColor orangeColor];
        
        // TabBar上Item对应的View
        HomePageViewController  *homePageView = [[HomePageViewController alloc]init];
        SearchViewController    *searchView   = [[SearchViewController alloc]init];
        DownloadViewController  *downloadView = [[DownloadViewController alloc]init];
        UpdateViewController    *updateView   = [[UpdateViewController alloc]init];

        self.viewControllers = [NSArray arrayWithObjects:homePageView, searchView, downloadView, updateView, nil];
        [homePageView release];
        [searchView release];
        [downloadView release];
        [updateView release];

        
        
//        self.view.frame = CGRectMake(0, 450, 320, 30);
        
        // 设置各个Item的相关属性
        UITabBar *tabBar = self.tabBar;
        //    tabBar.frame = CGRectMake(0, 450, 320, 30);
        UITabBarItem *homePageItem = [tabBar.items objectAtIndex:0];
        UITabBarItem *searchItem = [tabBar.items objectAtIndex:1];
        UITabBarItem *downloadItem = [tabBar.items objectAtIndex:2];
        UITabBarItem *updateItem = [tabBar.items objectAtIndex:3];

        // 设置标题
        homePageItem.title = @"首页";
        searchItem.title = @"搜索";
        downloadItem.title = @"下载";
        updateItem.title = @"更新";
        
        // 设置各个Item的选中和取消选中时的图标
        [homePageItem setFinishedSelectedImage:[UIImage imageNamed:@"home_grey.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"home_black.png"]];
        [searchItem setFinishedSelectedImage:[UIImage imageNamed:@"search_grey.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"search_black.png"]];
        [downloadItem setFinishedSelectedImage:[UIImage imageNamed:@"download_grey.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"download_black.png"]];
        [updateItem setFinishedSelectedImage:[UIImage imageNamed:@"refresh_grey.png"] withFinishedUnselectedImage:[UIImage imageNamed:@"refresh_black.png"]];

        // 设置整个TabBar的背景图片
        UIImage* tabBarBackground = [UIImage imageNamed:@"tabbar.png"];
        [[UITabBar appearance] setBackgroundImage:tabBarBackground];
        [[UITabBar appearance] setSelectionIndicatorImage:[UIImage imageNamed:@"tabbar_selected.png"]];
        // 未选中(黑色)和选中(白色)的字体颜色
        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor blackColor], UITextAttributeTextColor,
                                                           nil] forState:UIControlStateNormal];
        [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor whiteColor], UITextAttributeTextColor,
                                                           nil] forState:UIControlStateHighlighted];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
