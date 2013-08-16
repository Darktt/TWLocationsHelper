//
//  TWLocationsHelper.m
//  TWLocationsHelper
//
//  Created by ChrisXu on 13/8/15.
//  Copyright (c) 2013年 ChrisXu. All rights reserved.
//

#import "TWLocationsHelper.h"

#pragma mark - TWCity Category

@interface TWCity (Initialize)

+ (id)cityWithDictionary:(NSDictionary *)dictionary;

@end

@implementation TWCity (Initialize)

+ (id)cityWithDictionary:(NSDictionary *)dictionary
{
    TWCity *city = [[TWCity alloc] initWithDictionary:dictionary];
    
    return city;
}

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self == nil) return nil;
    
    NSString *cityName = [dictionary[@"title"] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    _cityName = cityName;
    _identify = [dictionary[@"city_id"] integerValue];
    
    return self;
}

@end

#pragma mark - TWLocationsHelper

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
        TWCity *city = [TWCity cityWithDictionary:cities[i]];
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

