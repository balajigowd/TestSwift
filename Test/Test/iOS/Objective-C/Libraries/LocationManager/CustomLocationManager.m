//
//  CustomLocationManager.m
//  ImagePicker
//
//  Created by Balaji Goud  on 4/24/17.
//  Copyright © 2017 RBT. All rights reserved.
//

#import "CustomLocationManager.h"

#define MSG_FOR_LOCATION_ACCESS @"Location services are required by this application, Enable from Settings."
#define APP_NAME @"Application name"

@implementation CustomLocationManager
{
    CLLocationManager *objLocationManager;
}


void (^ completionBlockOnCurrenLocation)(CLLocation *);

/**
 @brief Method to get the instance of the CustomLocationManager.
 @return A shared instance of the class CustomLocationManager.
 */
+(instancetype) sharedInstace
{
    static CustomLocationManager *objSharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        objSharedInstance = [[CustomLocationManager alloc] init];
        //Do any other initialization stuff here.
    });
    return objSharedInstance;
}

/**
 @brief Method to get the current location of the user.
 @param fromVC is the instance of the view controller from which user want to display the warning alert.
 @param completionBlock is the block type parameter, Which is used to call the block with the current location object that is CLLocation type.
 */
-(void)getCurrentLocationFromVC:(UIViewController *)fromVC completionBlock:(void (^) (CLLocation *currentLocation))completionBlock
{
    [[CustomLocationManager sharedInstace] setObjFromVC:fromVC];
    completionBlockOnCurrenLocation = completionBlock;
    objLocationManager = [[CLLocationManager alloc] init];
    objLocationManager.distanceFilter = kCLDistanceFilterNone;
    objLocationManager.desiredAccuracy = kCLLocationAccuracyBest;
    objLocationManager.delegate = [CustomLocationManager sharedInstace];
    [objLocationManager startUpdatingLocation];
    
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    if (status == kCLAuthorizationStatusNotDetermined)
    {
        [objLocationManager requestWhenInUseAuthorization];
    }
    else if(status == kCLAuthorizationStatusDenied || status == kCLAuthorizationStatusRestricted)
    {
        //Show an alert to show the user to manually enable the location services from the settings application.
        [CustomLocationManager showAlertToEnableLocationServices];
    }
}

#pragma mark === Other Methods ===

/**
 @brief Method to show the alert when location services are disable or restricted from the settings application.
 */
+(void) showAlertToEnableLocationServices
{
    UIAlertController *objectAlertController = [UIAlertController alertControllerWithTitle:APP_NAME message:MSG_FOR_LOCATION_ACCESS preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *objSettingsAction = [UIAlertAction actionWithTitle:@"Settings" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //Open the settings application.
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
    }];
    UIAlertAction *objOkAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [CustomLocationManager showAlertToEnableLocationServices];
    }];
    [objectAlertController addAction:objSettingsAction];
    [objectAlertController addAction:objOkAction];
    [[CustomLocationManager sharedInstace].objFromVC presentViewController:objectAlertController animated:true completion:nil];
}


#pragma mark === Location Manager Delegate Methods ===

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    if(locations.count != 0)
    {
        [CustomLocationManager sharedInstace].objUserCurrentLocation = [locations lastObject];
        completionBlockOnCurrenLocation([CustomLocationManager sharedInstace].objUserCurrentLocation);
        [CustomLocationManager sharedInstace].objFromVC = nil;
        [objLocationManager stopUpdatingLocation];
    }
        
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusDenied || status == kCLAuthorizationStatusRestricted)
    {
        //Show an alert to show the user to manually enable the location services from the settings application.
        if ([CustomLocationManager sharedInstace].objFromVC != nil) {
            [CustomLocationManager showAlertToEnableLocationServices];
        }
    }
}


@end
