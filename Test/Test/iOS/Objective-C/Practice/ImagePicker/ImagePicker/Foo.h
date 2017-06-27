//
//  Foo.h
//  ImagePicker
//
//  Created by Balaji Goud  on 4/20/17.
//  Copyright © 2017 RBT. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Foo : NSObject

@property (nonatomic, assign) NSInteger property1;
@property (nonatomic, assign) BOOL property2;
@property (nonatomic, copy) NSString *property3;

- (id)initWithCoder:(NSCoder *)coder;
- (void)encodeWithCoder:(NSCoder *)coder;

@end


