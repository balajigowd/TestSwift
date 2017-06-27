//
//  ContactsData.h
//  ContactList
//
//  Created by Balaji Goud on 1/19/17.
//  Copyright © 2017 RBT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ContactsData : NSObject

@property (nonatomic, strong) NSString *firstNames;
@property (nonatomic, strong) NSString *lastNames;
@property (nonatomic, assign) NSInteger contactId;
@property (nonatomic, strong) NSString *fullname;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSMutableArray *phoneNumbers;
@property (nonatomic, strong) NSMutableArray *emails;

@end
