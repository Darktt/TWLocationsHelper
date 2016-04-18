//
//  TWLocationPickerView.h
//
//  Created by Darktt on 16/4/18.
//  Copyright © 2016 Darktt. All rights reserved.
//

#import "TWLocationsHelper.h"
@import UIKit;

NS_ASSUME_NONNULL_BEGIN
@protocol TWLocationPickerViewDelegate;
@interface TWLocationPickerView : UIView

@property (assign, nonatomic, nullable) id<TWLocationPickerViewDelegate> delegate;
@property (assign, nonatomic) NSUInteger cityID;
@property (assign, nonatomic) NSUInteger districtID;

+ (instancetype)locationPickerViewWithFrame:(CGRect)frame;
- (instancetype)initWithFrame:(CGRect)frame;

@end

@protocol TWLocationPickerViewDelegate <NSObject>

- (void)picker:(TWLocationPickerView *)picker didPickedCity:(TWCity *)city;
- (void)picker:(TWLocationPickerView *)picker didPickedDistrict:(TWDistrict *)district;

@end
NS_ASSUME_NONNULL_END