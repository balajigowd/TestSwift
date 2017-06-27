//
//  SystemContacts.h
//  ContactList
//
//  Created by Balaji Goud on 1/19/17.
//  Copyright © 2017 RBT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SystemContacts : NSObject

+(void)getAllContactsWithCompletionBlock:(void (^) (NSMutableArray *arrayContacts)) completionBlock;

@end
