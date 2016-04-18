//
//  TWLocationsPickerController.h
//
//  Created by Darktt on 16/4/1.
//  Copyright © 2016 Darktt. All rights reserved.
//

#import "TWLocationsHelper.h"
@import UIKit;

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, TWLocationsPickerSource) {
    TWLocationsPickerSourceCities = 0,
    TWLocationsPickerSourceDistricts
};

@protocol TWLocationsPickerControllerDelegate;
@interface TWLocationsPickerController : UITableViewController

@property (assign) TWLocationsPickerSource pickerSource;

@property (assign) NSUInteger cityID;
@property (assign) NSUInteger districtID;

+ (instancetype)locationPickerWithDelegate:(id<TWLocationsPickerControllerDelegate>)delegate;
- (instancetype)initWithDelegate:(id<TWLocationsPickerControllerDelegate>)delegate;

@end

@protocol TWLocationsPickerControllerDelegate <NSObject>

@optional
- (void)locationsPicker:(TWLocationsPickerController *)picker didPickCity:(TWCity *)city;

- (void)locationsPicker:(TWLocationsPickerController *)picker didPickDistrict:(TWDistrict *)district;

@end
NS_ASSUME_NONNULL_END