//
//  AnswerViewController.h
//  RPI Majors
//
//  Created by Matt on 3/23/14.
//  Copyright (c) 2014 Matt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnswerViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property NSString* question;
@property NSString* answer;

@end
