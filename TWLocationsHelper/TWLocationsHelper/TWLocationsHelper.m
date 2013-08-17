//
//  TWLocationsHelper.m
//  TWLocationsHelper
//
//  Created by ChrisXu on 13/8/15.
//  Copyright (c) 2013年 ChrisXu. All rights reserved.
//

#import "TWLocationsHelper.h"
#import "TWRelease.h"

#pragma mark - TWCity Category

#define kTWCityNameKey  @"title"
#define kTWCityIdKey    @"city_id"

@interface TWCity (Initialize)

+ (id)cityWithDictionary:(NSDictionary *)dictionary;

@end

@implementation TWCity (Initialize)

+ (id)cityWithDictionary:(NSDictionary *)dictionary
{
    TWCity *city = [[TWCity alloc] initWithDictionary:dictionary];
    
    return TWAutorelease(city);
}

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self == nil) return nil;
    
    NSString *cityName = [dictionary[kTWCityNameKey] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    _cityName = TWRetain(cityName);
    _cityIdentify = [(NSString *)dictionary[kTWCityIdKey] integerValue];
    
    return self;
}

@end

#pragma mark - TWDistrict Category

#define kTWDistrictNameKey      @"title"
#define kTWDistrictIdKey        @"district_id"
#define kTWDistrictPostNomer    @"post_number"

@interface TWDistrict (Initialize)

+ (id)districtWithDictionary:(NSDictionary *)dictionary;

@end

@implementation TWDistrict (Initialize)

+ (id)districtWithDictionary:(NSDictionary *)dictionary
{
    TWDistrict *district = [[TWDistrict alloc] initWithDictionary:dictionary];
    
    return TWAutorelease(district);
}

- (id)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self == nil) return nil;
    
    NSString *districtName = [dictionary[kTWDistrictNameKey] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    _districtName = TWRetain(districtName);
    _districtIdentify = [dictionary[kTWDistrictIdKey] integerValue];
    _postNumber = [dictionary[kTWDistrictPostNomer] integerValue];
    _cityIdentify = [dictionary[kTWCityIdKey] integerValue];
    
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
        TWDistrict *district = [TWDistrict districtWithDictionary:districts[i]];
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

