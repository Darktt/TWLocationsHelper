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
    
    // Call singleton
    NSArray *cities = [[TWLocationsHelper defaultLocations] allCities];
    NSLog(@"All Cities : %@", cities);
    
    // Use Variable
    TWLocationsHelper *locations = [TWLocationsHelper defaultLocations];
    TWCity *city = cities[0];
    NSArray *districts = [locations districtFromCityID:city.cityIdentify];
    
    NSLog(@"Districts = %@", districts);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
