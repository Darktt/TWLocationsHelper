//
//  TWCity.h
//  TWLocationsHelper
//
//  Created by ChrisXu on 13/8/15.
//  Copyright (c) 2013年 ChrisXu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TWCity : NSObject
{
    NSString *_cityName;
    NSUInteger _identify;
}

@property (assign, readonly) NSInteger identify;
@property (nonatomic, readonly) NSString *cityName;

@end
