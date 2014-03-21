//
//  FAQViewController.h
//  RPI Majors
//
//  Created by Matt on 2/11/14.
//  Copyright (c) 2014 Matt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FAQViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (retain) NSMutableArray *questions;
@property (retain) NSMutableArray *answers;

- (void)addQuestions:(NSDictionary*) dictionary;

@end
