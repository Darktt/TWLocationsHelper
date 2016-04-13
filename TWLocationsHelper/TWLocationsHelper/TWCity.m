//
//  TWCity.m
//
//  Created by Darktt on 13/8/15.
//  Copyright (c) 2013 Darktt. All rights reserved.
//

#import "TWCity.h"

NSString *const kTWCityNameKey = @"title";
NSString *const kTWCityIdKey = @"city_id";

@interface TWCity ()

@property (assign, nonatomic) NSUInteger identifier;
@property (copy, nonatomic) NSString *name;

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
    
    [self setName:cityName];
    [self setIdentifier:identifier.integerValue];
    
    return self;
}

- (void)dealloc
{
    [self setName:nil];
    
    [super dealloc];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@: City Name = %@; Identify = %zd>", NSStringFromClass([self class]), self.name, self.identifier];
}

@end
