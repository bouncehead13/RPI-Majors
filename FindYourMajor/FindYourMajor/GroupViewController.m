//
//  GroupViewController.m
//  RPI Majors
//
//  Created by Matt on 2/10/14.
//  Copyright (c) 2014 Matt. All rights reserved.
//

#import "GroupViewController.h"
#import "DetailViewController.h"

@interface GroupViewController ()
{
	NSMutableDictionary *objects;
}
@end

@implementation GroupViewController

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	objects = [[NSMutableDictionary alloc] init];
	self.title = self.detailItem;
	
    [objects setObject:[NSArray arrayWithObjects:@"Biology", @"biology", nil] forKey:[NSNumber numberWithInt:0]];
	[objects setObject:[NSArray arrayWithObjects:@"Chemistry", @"chemistry", nil] forKey:[NSNumber numberWithInt:1]];
	[objects setObject:[NSArray arrayWithObjects:@"Computers", @"computer", nil] forKey:[NSNumber numberWithInt:2]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
	NSArray* array = [objects objectForKey:[NSNumber numberWithInt:indexPath.row]];
	UIImageView* imageView = (UIImageView *)[cell viewWithTag:0];
	UILabel* label = (UILabel *)[cell viewWithTag:1];
	
	
	label.text = array[0];
	[imageView setImage:[UIImage imageNamed:array[1]]];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
		NSArray* array = [objects objectForKey:[NSNumber numberWithInt:indexPath.row]];
        [[segue destinationViewController] setDetailItem:array[0]];
    }
}

@end
