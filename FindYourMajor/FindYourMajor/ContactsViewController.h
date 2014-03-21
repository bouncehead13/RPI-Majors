//
//  ContactsViewController.h
//  RPI Majors
//
//  Created by Matt on 2/11/14.
//  Copyright (c) 2014 Matt. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactsViewController : UITableViewController

@property (strong, nonatomic) IBOutlet UITableView *tableView;

@property (strong) NSString *advisor;
@property (strong) NSString *advisor_email;

@property (retain) NSMutableArray *names;
@property (retain) NSMutableArray *emails;

- (void)addContacts:(NSDictionary*) dictionary withName:(NSString*)aName andEmail:(NSString*)aEmail;

@end
