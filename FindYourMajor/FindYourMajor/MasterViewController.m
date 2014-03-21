//
//  NoteCardMasterViewController.m
//  FindYourMajor
//
//  Created by Matt on 2/3/14.
//  Copyright (c) 2014 Matt. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 2;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
	UITableViewCell *cell = (UITableViewCell *)sender;
	UILabel* label = (UILabel *)[cell viewWithTag:1];
	[[segue destinationViewController] setDetailItem:label.text];
}

@end
