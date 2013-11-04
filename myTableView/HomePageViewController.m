//
//  ViewController.m
//  mytableView
//
//  Created by macbook on 13/10/26.
//  Copyright (c) 2013年 teiron. All rights reserved.
//

#import "HomePageViewController.h"
#import "MyTableView.h"
#import "MyTopBar.h"

@interface HomePageViewController ()

@end

@implementation HomePageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _myTopBar = [[MyTopBar alloc]initWithFrame:CGRectMake(5, 3, 310, 24)];
    [self.view addSubview:_myTopBar];
    
    _myTableView = [[MyTableView alloc]initWithFrame:CGRectMake(0, 30, 320, 385)];
    [self.view addSubview:_myTableView];
}

#pragma mark - Uninitializer

- (void)dealloc
{
    [super dealloc];
    [_myTableView release];
    [_myTopBar release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
