//
//  TWDistrict.h
//  TWLocationsHelper
//
//  Created by ChrisXu on 13/8/15.
//  Copyright (c) 2013年 ChrisXu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface TWDistrict : NSObject

@property (readonly) NSUInteger cityIdentifier;
@property (readonly) NSUInteger districtIdentifier;
@property (readonly) NSUInteger postNumber;
@property (readonly) NSString *districtName;

@end
NS_ASSUME_NONNULL_END