//
//  CustomImagePicker.m
//  ImagePicker
//
//  Created by Balaji Goud  on 4/20/17.
//  Copyright © 2017 RBT. All rights reserved.
//

#import "CustomImagePicker.h"

#define ACTION_SHEET_TITLE @"Choose Option"
#define OPTION_1 @"Library"
#define OPTION_2 @"Camera"
#define OPTION_CANCEL @"Cancel"

#define APP_NAME @"Application Name"
#define MSG_CAMERA_UNAVAILABILITY @"This device doesn't support Camera."


@implementation CustomImagePicker

void (^ completionBlockOnSelection)(UIImage *);
UIViewController *baseVC;

/**
 @brief Method to create and returns a singleton instance.
 @return A singleton instance of the CustomImagePicker class.
 */
+(instancetype )shareInstance
{
    static CustomImagePicker *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[CustomImagePicker alloc] init];
        // Do any other initialisation stuff here
    });
    return sharedInstance;
}

/**
 @brief Method to open a actionsheet with options to select an image either from photo library or from camera based on user selection.
 @param fromVC is the instance of UIViewController, From which, You want to display actionsheet.
 @param CompletionBlok is a block type used to send the selected image when selected.
 */
+(void)OpenActionSheetToPickImage:(UIViewController *)fromVC
       completionBlockOnSelection:(void (^) (UIImage *selectedImage))CompletionBlock
{
    baseVC = fromVC;
    completionBlockOnSelection = CompletionBlock;
    
    UIAlertController *optionMenu = [UIAlertController alertControllerWithTitle:nil message:ACTION_SHEET_TITLE preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *libraryAction = [UIAlertAction actionWithTitle:OPTION_1 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [CustomImagePicker libraryOptionSelected];
    }];
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:OPTION_2 style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [CustomImagePicker cameraOptionSelected];
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:OPTION_CANCEL style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"Cancel %@",action);
    }];
    [optionMenu addAction:libraryAction];
    [optionMenu addAction:cameraAction];
    [optionMenu addAction:cancelAction];
    [baseVC presentViewController:optionMenu animated:true completion:^{
        
    }];
}

/**
 Mehod to open the image picker of type photo library.
 */
+(void)libraryOptionSelected
{
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    imagePicker.delegate = [CustomImagePicker shareInstance];
    imagePicker.allowsEditing = false;
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [baseVC presentViewController:imagePicker animated:true completion:nil];
}

/**
 Mehod to open the image picker of type camera.
 */
+(void)cameraOptionSelected
{
    BOOL isCameraAvailable = [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera];
    if (isCameraAvailable)
    {
        UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
        imagePicker.delegate = [CustomImagePicker shareInstance];
        imagePicker.allowsEditing = false;
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [baseVC presentViewController:imagePicker animated:true completion:nil];
    }
    else
    {
        UIAlertController *alertUnAvailability = [UIAlertController alertControllerWithTitle:APP_NAME message:MSG_CAMERA_UNAVAILABILITY preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
        [alertUnAvailability addAction:okAction];
        [baseVC presentViewController:alertUnAvailability animated:true completion:nil];

    }
}

#pragma mark  === UIImagePickerController Delegate Methods ===

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *imageSelected = (UIImage *)info[UIImagePickerControllerOriginalImage];
    if (imageSelected != nil)
    {
        completionBlockOnSelection(imageSelected);
    }
    [picker dismissViewControllerAnimated:true completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [picker dismissViewControllerAnimated:true completion:nil];
}

@end
