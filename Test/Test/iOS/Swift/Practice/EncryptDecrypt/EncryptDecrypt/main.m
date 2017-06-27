//
//  main.m
//  EncryptDecrypt
//
//  Created by Balaji Goud  on 3/24/17.
//  Copyright © 2017 test. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "NSString+AESCrypt.h"
//#import <cry>

int main(int argc, char * argv[]) {
    NSString *plainString = @"This string will be encrypted";
    NSString *key = @"YourEncryptionKey"; // should be provided by a user
    
    NSLog( @"Original String: %@", plainString );
    
    NSString *encryptedString = [plainString AES256EncryptWithKey:key];
    NSLog( @"Encrypted String: %@", encryptedString );
    
    NSLog( @"Decrypted String: %@", [encryptedString AES256DecryptWithKey:key] );
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
