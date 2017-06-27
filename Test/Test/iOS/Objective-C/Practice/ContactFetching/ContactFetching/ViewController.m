//
//  ViewController.m
//  ContactFetching
//
//  Created by Balaji Goud  on 4/20/17.
//  Copyright © 2017 RBT. All rights reserved.
//

#import "ViewController.h"
#import "SystemContacts.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [SystemContacts getAllContactsWithCompletionBlock:^(NSMutableArray *arrayContacts) {
        NSLog(@"%@",arrayContacts);
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
