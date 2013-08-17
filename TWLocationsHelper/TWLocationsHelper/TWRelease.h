//
//  TWRelease.h
//  TWLocationsHelper
//
//  Created by Darktt on 13/8/17.
//  Copyright (c) 2013 ChrisXu. All rights reserved.
//

#if __has_feature(objc_arc)

#define USE_ARC_MODE
#define TWAutorelease( expression )  expression
#define TWRelease( expression )
#define TWRetain( expression )       expression

#else

#define TWAutorelease( expression )  [expression autorelease]
#define TWRelease( expression )      [expression release]
#define TWRetain( expression )       [expression retain]

#endif
