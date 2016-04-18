//
//  TWViewController.m
//  TWLocationsHelper
//
//  Created by ChrisXu on 13/8/15.
//  Copyright (c) 2013年 ChrisXu. All rights reserved.
//

#import "TWViewController.h"
#import "TWLocationPickerView.h"

@interface TWViewController () <TWLocationPickerViewDelegate>

@end

@implementation TWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    CGRect frame = CGRectMake(0.0f, 0.0f, 320.0f, 216.0f);
    TWLocationPickerView *pickView = [[TWLocationPickerView alloc] initWithFrame:frame];
    [pickView setDelegate:self];
    
    [self.view addSubview:pickView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)picker:(TWLocationPickerView *)picker didPickedCity:(TWCity *)city
{
    NSLog(@"You picked: %@", city.name);
}

- (void)picker:(TWLocationPickerView *)picker didPickedDistrict:(TWDistrict *)district
{
    NSLog(@"You district: %@", district.name);
}

@end
