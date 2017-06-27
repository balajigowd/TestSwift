//
//  ViewController.m
//  ImagePicker
//
//  Created by Balaji Goud  on 4/20/17.
//  Copyright © 2017 RBT. All rights reserved.
//

#import "ViewController.h"
#import "Foo.h"
#import "CustomImagePicker.h"
#import "CustomLocationManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    Foo *someFoo = [[Foo alloc] init];
//    someFoo.property1 = 1;
//    someFoo.property2 = YES;
//    someFoo.property3 = @"test";
//    
//    NSString *file = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"myfile.txt"];
//    [NSKeyedArchiver archiveRootObject:someFoo toFile:file];
//    
//    Foo *objDecoded = [NSKeyedUnarchiver unarchiveObjectWithFile:file];
//    
//    NSLog(@"%ld, %@, %@", (long)objDecoded.property1, [NSNumber numberWithBool:objDecoded.property2].stringValue, objDecoded.property3);
    
    
    [[CustomLocationManager sharedInstace] getCurrentLocationFromVC:self completionBlock:^(CLLocation *currentLocation) {
        NSLog(@"%fl\n%fl",currentLocation.coordinate.latitude, currentLocation.coordinate.longitude);
    }];
    
}

- (IBAction)btnSelectAnImage:(id)sender {
    [CustomImagePicker OpenActionSheetToPickImage:self completionBlockOnSelection:^(UIImage *selectedImage) {
        self.imageSelected.image = selectedImage;
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
