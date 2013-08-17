//
//  TWDistrict.h
//  TWLocationsHelper
//
//  Created by ChrisXu on 13/8/15.
//  Copyright (c) 2013年 ChrisXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TWDistrict : NSObject
{
    NSUInteger _cityIdentify;
    NSUInteger _districtIdentify;
    NSUInteger _postNumber;
    NSString *_districtName;
}

@property (assign, readonly) NSUInteger cityIdentify;
@property (assign, readonly) NSUInteger districtIdentify;
@property (assign, readonly) NSUInteger postNumber;
@property (nonatomic, readonly) NSString *districtName;

@end
