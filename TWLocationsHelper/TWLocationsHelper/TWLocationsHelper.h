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

#if __has_feature(objc_instancetype)
#define TWInstancetype instancetype
#else
#define TWInstancetype id
#endif

@interface TWLocationsHelper : NSObject

+ (TWInstancetype)defaultLocations;

- (NSArray *)allCities;
- (NSArray *)districtFromCityID:(NSUInteger)cityIdentity;

@end
