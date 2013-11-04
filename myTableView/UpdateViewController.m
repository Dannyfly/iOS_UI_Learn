//
//  UpdateViewController.m
//  myTableView
//
//  Created by macbook on 13/10/30.
//  Copyright (c) 2013年 teiron. All rights reserved.
//

#import "UpdateViewController.h"

@interface UpdateViewController ()

@end

@implementation UpdateViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        UILabel* label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
        label.text = @"Update View";
        [self.view addSubview:label];
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
