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

@interface TWLocationsHelper : NSObject

+ (NSArray *)getAllCitiesData;
+ (NSArray *)getDistDataWithCityID:(NSInteger)cityIdentity;

@end
