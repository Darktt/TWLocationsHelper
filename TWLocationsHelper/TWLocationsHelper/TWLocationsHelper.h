//
//  TWLocationsHelper.h
//
//  Created by Darktt on 13/8/15.
//  Copyright (c) 2013年 Darktt. All rights reserved.
//

#import "TWCity.h"
#import "TWDistrict.h"

@import Foundation;

NS_ASSUME_NONNULL_BEGIN
@interface TWLocationsHelper : NSObject

+ (instancetype)defaultLocations;

- (NSArray *)allCities;
- (NSArray *)districtFromCityID:(NSUInteger)cityIdentity;

@end
NS_ASSUME_NONNULL_END