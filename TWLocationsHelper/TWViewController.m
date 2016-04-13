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
    
    TWLocationsHelper *locations = [TWLocationsHelper defaultLocations];
    
    // Call singleton
    NSArray *cities = [locations allCities];
    NSLog(@"All Cities : %@", [cities description]);
    
    // Use Variable
    TWCity *city = cities[0];
    NSArray *districts = [locations districtsFromCityID:city.identifier];
    
    NSLog(@"Districts = %@", districts);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
