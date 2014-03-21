//
//  InformationViewController.h
//  RPI Majors
//
//  Created by Matt on 2/9/14.
//  Copyright (c) 2014 Matt. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InformationViewController : UITabBarController<UIAlertViewDelegate>

@property (strong, nonatomic) id detailItem;

- (void)initDescription;
- (void)initContacts;
- (void)initFAQ;

@end
