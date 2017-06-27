//
//  CustomImagePicker.h
//  ImagePicker
//
//  Created by Balaji Goud  on 4/20/17.
//  Copyright © 2017 RBT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface CustomImagePicker : NSObject <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

+(void)OpenActionSheetToPickImage:(UIViewController *)fromVC completionBlockOnSelection:(void (^) (UIImage *selectedImage))CompletionBlock;
+(instancetype )shareInstance;

@end
