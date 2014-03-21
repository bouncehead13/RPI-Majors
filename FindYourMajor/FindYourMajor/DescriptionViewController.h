//
//  DescriptionViewController.h
//  RPI Majors
//
//  Created by Matt on 2/11/14.
//  Copyright (c) 2014 Matt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DescriptionViewController :  UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong) NSString *description;
@property (retain) NSMutableArray *courses;

- (void)addCourses:(NSDictionary*) dictionary withDescription:(NSString*)desc;

@end
