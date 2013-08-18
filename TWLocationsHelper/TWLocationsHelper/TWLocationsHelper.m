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

#define kBundleName @"TWLocationsData.bundle"

// Dictionary Keys
#define kCityKey        @"city"
#define kDistrictKey    @"districts"

typedef void (^NSArrayEnumerateBlock) (id ,NSUInteger, BOOL*);

static TWLocationsHelper *singleton = nil;

@interface TWLocationsHelper ()
{
    NSDictionary *_locations;
}

- (void)queryLocations;

@end

@implementation TWLocationsHelper

+ (TWInstancetype)defaultLocations
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [TWLocationsHelper new];
    });
    
    return singleton;
}

- (id)init
{
    self = [super init];
    if (self == nil) return nil;
    
    [self queryLocations];
    
    return self;
}

#ifndef USE_ARC_MODE

- (void)dealloc
{
    [_locations release];
    
    [super dealloc];
}

#endif

#pragma mark - Implementation Methods

- (void)queryLocations
{
    if (_locations != nil) {
        return;
    }
    
    NSString *bundlePath = [[NSBundle mainBundle] bundlePath];
    NSString *filePath = [bundlePath stringByAppendingPathComponent:kBundleName];
    NSBundle *bundle = [NSBundle bundleWithPath:filePath];
    NSString *plistPath = [bundle pathForResource:@"TWLocationsData" ofType:@"plist"];
    
    _locations = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
}

- (NSArray *)allCities
{
    NSMutableArray *_allCities = [NSMutableArray arrayWithCapacity:0];
    
    NSArrayEnumerateBlock enumBlock = ^(NSDictionary *cityDictionary, NSUInteger index, BOOL *stop){
        TWCity *city = [TWCity cityWithDictionary:cityDictionary];
        [_allCities addObject:city];
    };
    
    NSArray *cities = _locations[kCityKey];
    [cities enumerateObjectsUsingBlock:enumBlock];
    
    return _allCities;
}

- (NSArray *)districtFromCityID:(NSUInteger)cityIdentity
{
    NSMutableArray *_districts = [NSMutableArray arrayWithCapacity:0];
    
    NSArrayEnumerateBlock enumBlock = ^(NSDictionary *districDictionary, NSUInteger index, BOOL *stop){
        TWDistrict *district = [TWDistrict districtWithDictionary:districDictionary];
        [_districts addObject:district];
    };
    
    NSArray *allDistricts = _locations[kDistrictKey];
    NSString *cityIDString = [NSString stringWithFormat:@"%d", cityIdentity];
    
    NSPredicate *predicate  = [NSPredicate predicateWithFormat:@"(city_id==%@)", cityIDString];
    
    NSArray *filteredDistricts = [allDistricts filteredArrayUsingPredicate:predicate];
    [filteredDistricts enumerateObjectsUsingBlock:enumBlock];
    
    return _districts;
}

@end

