//
//  TWCity.m
//  TWLocationsHelper
//
//  Created by ChrisXu on 13/8/15.
//  Copyright (c) 2013年 ChrisXu. All rights reserved.
//

#import "TWCity.h"

@implementation TWCity

- (NSString *)description
{
    return [NSString stringWithFormat:@"<TWCity: City Name = %@; Identify = %d>", _cityName, _identify];
}

#pragma mark - Propery Methods

- (NSString *)cityName
{
    return _cityName;
}

- (NSInteger)identify
{
    return _identify;
}

@end
