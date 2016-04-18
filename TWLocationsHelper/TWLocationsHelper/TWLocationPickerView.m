//
//  TWLocationPickerView.m
//
//  Created by Darktt on 2016/4/18.
//  Copyright © 2016 Darktt. All rights reserved.
//

#import "TWLocationPickerView.h"

@interface TWLocationPickerView() <UIPickerViewDataSource, UIPickerViewDelegate>
{
    UIPickerView *_pickerView;
    
    NSArray<TWCity *> *_cities;
    NSArray<TWDistrict *> *_districts;
}
 
@end

@implementation TWLocationPickerView

+ (instancetype)locationPickerViewWithFrame:(CGRect)frame
{
    TWLocationPickerView *pickerView = [[TWLocationPickerView alloc] initWithFrame:frame];
    
    return [pickerView autorelease];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self == nil) return nil;
    
    [self setCityID:1];
    [self setDistrictID:1];
    [self setClipsToBounds:YES];
    [self setBackgroundColor:nil];
    
    TWLocationsHelper *locationsHelper = [TWLocationsHelper defaultLocations];
    NSArray<TWCity *> *cities = [locationsHelper allCities];
    NSArray<TWDistrict *> *districts = [locationsHelper districtsFromCityID:self.cityID];
    
    _cities = [[NSArray alloc] initWithArray:cities];
    _districts = [[NSArray alloc] initWithArray:districts];
    
    NSInteger districtIndex = [_districts indexOfDistreictID:self.districtID];
    if (districtIndex == NSNotFound) {
        districtIndex = 0;
    }
    
    _pickerView = [[UIPickerView alloc] initWithFrame:self.bounds];
    [_pickerView setDelegate:self];
    [_pickerView selectRow:self.cityID - 1 inComponent:0 animated:NO];
    [_pickerView selectRow:districtIndex inComponent:1 animated:NO];
    
    [self addSubview:_pickerView];
    [_pickerView release];
    
    return self;
}

- (void)dealloc
{
    
    [super dealloc];
}

- (void)layoutSubviews
{
    [_pickerView setFrame:self.bounds];
    
    [super layoutSubviews];
}

#pragma mark - Override Property

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    [self layoutIfNeeded];
    [self setNeedsLayout];
}

- (void)setTintColor:(UIColor *)tintColor
{
    [super setTintColor:nil];
    
    [_pickerView setTintColor:tintColor];
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    [super setBackgroundColor:nil];
    
    [_pickerView setBackgroundColor:backgroundColor];
}

- (void)setCityID:(NSUInteger)cityID
{
    _cityID = cityID;
    
    [_pickerView selectRow:cityID inComponent:0 animated:YES];
}

- (void)setDistrictID:(NSUInteger)districtID
{
    _districtID = districtID;
    NSInteger districtIndex = [_districts indexOfDistreictID:self.districtID];
    
    [_pickerView selectRow:districtIndex inComponent:1 animated:YES];
}

#pragma mark - Private Method

- (void)updateDistricts
{
    TWLocationsHelper *locationsHelper = [TWLocationsHelper defaultLocations];
    NSArray<TWDistrict *> *districts = [locationsHelper districtsFromCityID:self.cityID];
    
    [_districts release];
    _districts = [[NSArray alloc] initWithArray:districts];
    TWDistrict *district = _districts.firstObject;
    _districtID = district.identifier;
    
    if ([self.delegate respondsToSelector:@selector(picker:didPickedDistrict:)]) {
        [self.delegate picker:self didPickedDistrict:district];
    }
    
    [_pickerView reloadComponent:1];
    [_pickerView selectRow:0 inComponent:1 animated:YES];
}

#pragma mark - UIPickerViewDataSource

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return _cities.count;
    }
    
    return _districts.count;
}

#pragma mark - UIPickerViewDelegate

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        TWCity *city = _cities[row];
        
        return city.name;
    }
    
    TWDistrict *district = _districts[row];
    
    return district.name;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        TWCity *city = _cities[row];
        
        if ([self.delegate respondsToSelector:@selector(picker:didPickedCity:)]) {
            [self.delegate picker:self didPickedCity:city];
        }
        
        _cityID = city.identifier;
        [self updateDistricts];
        
        return;
    }
    
    TWDistrict *district = _districts[row];
    
    if ([self.delegate respondsToSelector:@selector(picker:didPickedDistrict:)]) {
        [self.delegate picker:self didPickedDistrict:district];
    }
}

@end
