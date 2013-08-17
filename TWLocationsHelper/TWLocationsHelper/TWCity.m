//
//  TWCity.m
//  TWLocationsHelper
//
//  Created by ChrisXu on 13/8/15.
//  Copyright (c) 2013年 ChrisXu. All rights reserved.
//

#import "TWCity.h"
#import "TWRelease.h"

@implementation TWCity

#ifndef USE_ARC_MODE

- (void)dealloc
{
    [_cityName release];
    
    [super dealloc];
}

#endif

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: City Name = %@; Identify = %d>", NSStringFromClass([self class]), _cityName, _cityIdentify];
}

#pragma mark - Propery Methods

- (NSString *)cityName
{
    return _cityName;
}

- (NSUInteger)cityIdentify
{
    return _cityIdentify;
}

@end
