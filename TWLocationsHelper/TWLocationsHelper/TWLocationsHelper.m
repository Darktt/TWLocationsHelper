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

+ (instancetype)cityWithDictionary:(NSDictionary *)dictionary;

@end

#pragma mark - TWDistrict Category

@interface TWDistrict (Initialize)

+ (instancetype)districtWithDictionary:(NSDictionary *)dictionary;

@end

#pragma mark - TWLocationsHelper

NSString *const kBundleName = @"TWLocationsData.bundle";

// Dictionary Keys
NSString *const kCityKey = @"city";
NSString *const kDistrictKey = @"districts";

typedef void (^NSArrayEnumerateBlock) (id ,NSUInteger, BOOL*);

static TWLocationsHelper *singleton = nil;

@interface TWLocationsHelper ()
{
    NSDictionary *_locations;
}

- (void)queryLocations;

@end

@implementation TWLocationsHelper

+ (instancetype)defaultLocations
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        singleton = [TWLocationsHelper new];
    });
    
    return singleton;
}

- (instancetype)init
{
    self = [super init];
    if (self == nil) return nil;
    
    [self queryLocations];
    
    return self;
}

- (void)dealloc
{
    [_locations release];
    
    [super dealloc];
}

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
    NSArray *cities = _locations[kCityKey];
    NSMutableArray *allCities = [NSMutableArray arrayWithCapacity:0];
    
    for (NSDictionary *dictionary in cities) {
        TWCity *city = [TWCity cityWithDictionary:dictionary];
        [allCities addObject:city];
    }
    
    return allCities;
}

- (NSArray *)districtFromCityID:(NSUInteger)cityIdentity
{
    NSArray *allDistricts = _locations[kDistrictKey];
    NSString *cityIDString = [NSString stringWithFormat:@"%d", cityIdentity];
    
    NSPredicate *predicate  = [NSPredicate predicateWithFormat:@"self.city_id == %@", cityIDString];
    
    NSArray *filteredDistricts = [allDistricts filteredArrayUsingPredicate:predicate];
    NSMutableArray *districts = [NSMutableArray arrayWithCapacity:0];
    
    for (NSDictionary *dictionary in filteredDistricts) {
        TWDistrict *district = [TWDistrict districtWithDictionary:dictionary];
        [districts addObject:district];
    }
    
    return districts;
}

@end

