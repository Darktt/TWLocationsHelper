//
//  TWViewController.m
//  TWLocationsHelper
//
//  Created by ChrisXu on 13/8/15.
//  Copyright (c) 2013年 ChrisXu. All rights reserved.
//

#import "TWViewController.h"
#import "TWLocationsHelper.h"

@interface TWViewController ()

@end

@implementation TWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%@,%@",[TWLocationsHelper getAllCitiesData],[TWLocationsHelper getDistDataWithCityID:2]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
