//
//  TWDistrict.m
//  TWLocationsHelper
//
//  Created by ChrisXu on 13/8/15.
//  Copyright (c) 2013年 ChrisXu. All rights reserved.
//

#import "TWDistrict.h"
#import "TWRelease.h"

@implementation TWDistrict

#ifndef USE_ARC_MODE

- (void)dealloc
{
    [_districtName release];
    
    [super dealloc];
}

#endif

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: Name = %@; City Identify = %d; Identify = %d>", NSStringFromClass([self class]), _districtName, _cityIdentify,  _districtIdentify];;
}

#pragma mark - Propery Methods

- (NSUInteger)cityIdentify
{
    return _cityIdentify;
}

- (NSUInteger)districtIdentify
{
    return _districtIdentify;
}

- (NSUInteger)postNumber
{
    return _postNumber;
}

- (NSString *)districtName
{
    return _districtName;
}

@end
