//
//  TWLocationsPickerController.m
//
//  Created by Darktt on 16/4/1.
//  Copyright © 2016 Darktt. All rights reserved.
//

#import "TWLocationsPickerController.h"

@interface TWLocationsPickerController () <UITableViewDataSource, UITableViewDelegate>
{
    NSArray<TWCity *> *_cities;
    NSArray<TWDistrict *> *_district;
    
    NSIndexPath *_selectedIndexPath;
}

@property (assign) id<TWLocationsPickerControllerDelegate> delegate;

@end

@implementation TWLocationsPickerController

+ (instancetype)locationPickerWithDelegate:(id<TWLocationsPickerControllerDelegate>)delegate
{
    TWLocationsPickerController *locationPicker = [[TWLocationsPickerController alloc] initWithDelegate:delegate];
    
    return [locationPicker autorelease];
}

#pragma mark Instance Method -
#pragma mark View Live Cycle

- (instancetype)initWithDelegate:(id<TWLocationsPickerControllerDelegate>)delegate
{
    self = [super init];
    if (self == nil) return nil;
    
    [self setDelegate:delegate];
    
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    
    if ([self.delegate respondsToSelector:@selector(locationsPicker:didPickCity:)] && self.pickerSource == TWLocationsPickerSourceCities) {
        TWCity *city = _cities[_selectedIndexPath.row];
        
        [self.delegate locationsPicker:self didPickCity:city];
    }
    
    if ([self.delegate respondsToSelector:@selector(locationsPicker:didPickDistrict:)] && self.pickerSource == TWLocationsPickerSourceDistricts) {
        TWDistrict *district = _district[_selectedIndexPath.row];
        
        [self.delegate locationsPicker:self didPickDistrict:district];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *title = nil;
    
    if (self.pickerSource == TWLocationsPickerSourceCities) {
        title = NSLocalizedString(@"Select City", @"");
    } else {
        title = NSLocalizedString(@"Select District", @"");
    }
    
    [self setTitle:title];
    
    TWLocationsHelper *locationsHelper = [TWLocationsHelper defaultLocations];
    
    if (self.pickerSource == TWLocationsPickerSourceCities) {
        NSArray *cities = [locationsHelper allCities];
        
        _cities = [[NSArray alloc] initWithArray:cities];
        _selectedIndexPath = [[NSIndexPath indexPathForRow:self.cityID inSection:0] retain];
    }
    
    if (self.pickerSource == TWLocationsPickerSourceDistricts) {
        NSArray *districts = [locationsHelper districtsFromCityID:self.cityID];
        
        _district = [[NSArray alloc] initWithArray:districts];
        _selectedIndexPath = [[NSIndexPath indexPathForRow:self.districtID inSection:0] retain];
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation
{
    return UIStatusBarAnimationFade;
}

- (BOOL)prefersStatusBarHidden
{
    return NO;
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}

- (void)dealloc
{
    if (_cities != nil) {
        [_cities release];
        _cities = nil;
    }
    
    if (_district != nil) {
        [_district release];
        _district = nil;
    }
    
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableView DataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.pickerSource == TWLocationsPickerSourceDistricts) {
        return _district.count;
    }
    
    return _cities.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
    NSInteger index = indexPath.row;
    UITableViewCellAccessoryType accressoryType = UITableViewCellAccessoryNone;
    
    if (_selectedIndexPath.row == index) {
        accressoryType = UITableViewCellAccessoryCheckmark;
    }
    
    [cell setAccessoryType:accressoryType];
    
    if (self.pickerSource == TWLocationsPickerSourceCities) {
        TWCity *city = _cities[index];
        
        [cell.textLabel setText:city.name];
    }
    
    if (self.pickerSource == TWLocationsPickerSourceDistricts) {
        TWDistrict *district = _district[index];
        
        [cell.textLabel setText:district.name];
    }
    
    return cell;
}

#pragma mark UITableView Delegate Methods

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (_selectedIndexPath != nil) {
        [_selectedIndexPath release];
    }
    
    _selectedIndexPath = [indexPath copy];
    
    [tableView reloadData];
}

@end
