//
//  TWCity.m
//  TWLocationsHelper
//
//  Created by ChrisXu on 13/8/15.
//  Copyright (c) 2013年 ChrisXu. All rights reserved.
//

#import "TWCity.h"

NSString *const kTWCityNameKey = @"title";
NSString *const kTWCityIdKey = @"city_id";

@interface TWCity ()

@property (assign, nonatomic) NSUInteger cityIdentifier;
@property (copy, nonatomic) NSString *cityName;

@end

@implementation TWCity

+ (instancetype)cityWithDictionary:(NSDictionary *)dictionary
{
    TWCity *city = [[TWCity alloc] initWithDictionary:dictionary];
    
    return [city autorelease];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self == nil) return nil;
    
    NSString *cityName = dictionary[kTWCityNameKey];
    NSString *identifier = dictionary[kTWCityIdKey];
    
    [self setCityName:cityName];
    [self setCityIdentifier:identifier.integerValue];
    
    return self;
}

- (void)dealloc
{
    [_cityName release];
    
    [super dealloc];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: City Name = %@; Identify = %d>", NSStringFromClass([self class]), self.cityName, self.cityIdentifier];
}

@end
