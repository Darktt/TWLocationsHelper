//
//  TWLocationsHelper.h
//  TWLocationsHelper
//
//  Created by ChrisXu on 13/8/15.
//  Copyright (c) 2013年 ChrisXu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWCity.h"
#import "TWDistrict.h"

NS_ASSUME_NONNULL_BEGIN
@interface TWLocationsHelper : NSObject

+ (instancetype)defaultLocations;

- (NSArray *)allCities;
- (NSArray *)districtFromCityID:(NSUInteger)cityIdentity;

@end
NS_ASSUME_NONNULL_END