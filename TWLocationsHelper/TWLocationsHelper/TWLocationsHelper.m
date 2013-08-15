//
//  TWLocationsHelper.m
//  TWLocationsHelper
//
//  Created by ChrisXu on 13/8/15.
//  Copyright (c) 2013年 ChrisXu. All rights reserved.
//

#import "TWLocationsHelper.h"

@interface TWLocationsHelper ()

+ (NSMutableDictionary *)TWLocationsInfo;

@end

@implementation TWLocationsHelper

+ (NSArray *)getAllCitiesData
{
    NSMutableDictionary *plistDict = [self TWLocationsInfo];
    NSArray *cities = plistDict[@"city"];
    
    NSMutableArray *mCities = [[NSMutableArray alloc] init];
    for (int i = 0; i < [cities count]; i++)
    {
        TWCity *city = [[TWCity alloc] init];
        city.name = [cities objectAtIndex:i][@"title"];
        city.identity = [[cities objectAtIndex:i][@"city_id"] integerValue];
        [mCities addObject:city];
    }
    
    return mCities;
}

+ (NSArray *)getDistDataWithCityID:(NSInteger)cityIdentity
{
    NSMutableDictionary *plistDict = [self TWLocationsInfo];
    NSMutableArray *allDistricts = [plistDict valueForKey:@"districts"];
    NSPredicate *predicate  = [NSPredicate predicateWithFormat:@"(city_id==%@)", [NSString stringWithFormat:@"%d", cityIdentity]];
    NSArray *districts = [allDistricts filteredArrayUsingPredicate:predicate];
    
    NSMutableArray *mDistricts = [[NSMutableArray alloc] init];
    for (int i = 0; i < [districts count]; i++)
    {
        TWDistrict *district = [[TWDistrict alloc] init];
        district.name = [districts objectAtIndex:i][@"title"];
        district.identity = [[districts objectAtIndex:i][@"district_id"] integerValue];
        district.cityIdentity = [[districts objectAtIndex:i][@"city_id"] integerValue];
        district.postNumber = [[districts objectAtIndex:i][@"post_number"] integerValue];
        [mDistricts addObject:district];
    }
    
    return mDistricts;
}

#pragma mark - PV
+ (NSMutableDictionary *)TWLocationsInfo
{
    
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
    NSString *filePath = [NSString stringWithFormat:@"%@/TWLocationsData.bundle",bundlePath];
    NSBundle *bundle = [NSBundle bundleWithPath:filePath];
    NSString *plistPath = [bundle pathForResource:@"TWLocationsData" ofType:@"plist"];
    NSMutableDictionary *plistDict = [NSMutableDictionary dictionaryWithContentsOfFile:plistPath];
    
    return plistDict;
}

@end
