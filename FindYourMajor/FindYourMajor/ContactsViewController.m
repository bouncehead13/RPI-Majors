//
//  ContactsViewController.m
//  RPI Majors
//
//  Created by Matt on 2/11/14.
//  Copyright (c) 2014 Matt. All rights reserved.
//

#import "ContactsViewController.h"

@interface ContactsViewController ()

	
@end

@implementation ContactsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.section == 0)
	{
		UILabel* label = (UILabel *)[cell viewWithTag:0];
		label.text = self.advisor;
		
		UILabel* label2 = (UILabel *)[cell viewWithTag:1];
		label2.text = self.advisor_email;
	}
	else if (indexPath.section == 1)
	{
		UILabel* label = (UILabel *)[cell viewWithTag:0];
		label.text = [self.names objectAtIndex: indexPath.row];
		
		UILabel* label2 = (UILabel *)[cell viewWithTag:1];
		label2.text = [self.emails objectAtIndex: indexPath.row];
    }
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if(section == 0)
		return 1;
	else
		return [self.names count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
	UILabel*  email = (UILabel *)[cell viewWithTag:1];
	NSString *subject = [[NSString alloc] initWithFormat:@"Interested in %@", self.major];
	
	MFMailComposeViewController *makeEmail = [[MFMailComposeViewController alloc] init];
	[makeEmail setSubject:subject];
	makeEmail.mailComposeDelegate = self;
	[makeEmail setToRecipients:[NSArray arrayWithObjects:email.text, nil]];
	[self presentViewController:makeEmail animated:YES completion:nil];
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
	[self dismissViewControllerAnimated:YES completion:nil];
}
- (void)addContacts:(NSDictionary*) dictionary withName:(NSString*)aName andEmail:(NSString*)aEmail
{
	if(!self.names) self.names = [[NSMutableArray alloc] init];
	if(!self.emails) self.emails = [[NSMutableArray alloc] init];
	
	self.advisor = aName;
	self.advisor_email = aEmail;
	
	NSMutableArray* arr = [[NSMutableArray alloc] initWithArray:[dictionary objectForKey:@"names"]];
	[self.names addObjectsFromArray:arr];
	
	NSMutableArray* arr2 = [[NSMutableArray alloc] initWithArray:[dictionary objectForKey:@"emails"]];
	[self.emails addObjectsFromArray:arr2];
	
	[self.tableView reloadData];
}

@end
