//
//  CustomLocationManager.h
//  ImagePicker
//
//  Created by Balaji Goud  on 4/24/17.
//  Copyright © 2017 RBT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <UIKit/UIKit.h>

@interface CustomLocationManager : NSObject <CLLocationManagerDelegate>
@property (nonatomic, strong) UIViewController *objFromVC;
@property (nonatomic, strong) CLLocation *objUserCurrentLocation;
+(instancetype) sharedInstace;
-(void)getCurrentLocationFromVC:(UIViewController *)fromVC completionBlock:(void (^) (CLLocation *currentLocation))completionBlock;

@end
