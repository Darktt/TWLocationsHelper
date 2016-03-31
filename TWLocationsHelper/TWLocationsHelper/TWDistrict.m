//
//  TWDistrict.m
//
//  Created by Darktt on 13/8/15.
//  Copyright (c) 2013年 Darktt. All rights reserved.
//

#import "TWDistrict.h"

NSString *const kTWDistrictCityIdentifierKey = @"city_id";
NSString *const kTWDistrictNameKey = @"title";
NSString *const kTWDistrictIdentifierKey = @"district_id";
NSString *const kTWDistrictPostNumber = @"post_number";

@interface TWDistrict ()

@property (assign, nonatomic) NSUInteger cityIdentifier;
@property (assign, nonatomic) NSUInteger districtIdentifier;
@property (assign, nonatomic) NSUInteger postNumber;
@property (copy, nonatomic) NSString *districtName;

@end

@implementation TWDistrict

+ (instancetype)districtWithDictionary:(NSDictionary *)dictionary
{
    TWDistrict *district = [[TWDistrict alloc] initWithDictionary:dictionary];
    
    return [district autorelease];
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self == nil) return nil;
    
    NSString *districtName = dictionary[kTWDistrictNameKey];
    NSString *districtIdentifier = dictionary[kTWDistrictIdentifierKey];
    NSString *postNumber = dictionary[kTWDistrictPostNumber];
    NSString *cityIdentifier = dictionary[kTWDistrictCityIdentifierKey];
    
    [self setDistrictName:districtName];
    [self setDistrictIdentifier:districtIdentifier.integerValue];
    [self setPostNumber:postNumber.integerValue];
    [self setCityIdentifier:cityIdentifier.integerValue];
    
    return self;
}

- (void)dealloc
{
    [self setDistrictName:nil];
    
    [super dealloc];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@:  City Identify = %d; District Name = %@; District Identify = %d Post Numer = %d >", NSStringFromClass([self class]), self.cityIdentifier, self.districtName,  self.districtIdentifier, self.postNumber];
}

@end
