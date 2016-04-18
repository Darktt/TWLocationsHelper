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
@property (assign, nonatomic) NSUInteger identifier;
@property (assign, nonatomic) NSUInteger postNumber;
@property (copy, nonatomic) NSString *name;

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
    
    [self setName:districtName];
    [self setIdentifier:districtIdentifier.integerValue];
    [self setPostNumber:postNumber.integerValue];
    [self setCityIdentifier:cityIdentifier.integerValue];
    
    return self;
}

- (void)dealloc
{
    [self setName:nil];
    
    [super dealloc];
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@:  City Identify = %zd; District Name = %@; District Identifier = %zd Post Numer = %zd >", NSStringFromClass([self class]), self.cityIdentifier, self.name,  self.identifier, self.postNumber];
}

@end

@implementation NSArray (TWDistrict)

- (NSInteger)indexOfDistreictID:(NSUInteger)distreictID
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self.identifier == %@", @(distreictID)];
    
    NSArray<TWDistrict *> *filiteredDistrict = [self filteredArrayUsingPredicate:predicate];
    
    if (filiteredDistrict.count == 0) {
        return NSNotFound;
    }
    
    return [self indexOfObject:filiteredDistrict.firstObject];
}

@end
