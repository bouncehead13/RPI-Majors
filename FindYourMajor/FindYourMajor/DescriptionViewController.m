//
//  DescriptionViewController.m
//  RPI Majors
//
//  Created by Matt on 2/11/14.
//  Copyright (c) 2014 Matt. All rights reserved.
//

#import "DescriptionViewController.h"

@interface DescriptionViewController ()

@end

@implementation DescriptionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.courses = [[NSMutableArray alloc] init];
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
		[[cell textLabel] setText:self.description];
	}
	else if (indexPath.section == 1)
	{
		[[cell textLabel] setText:[self.courses objectAtIndex:indexPath.row]];
    }
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if(section == 1)
		return [self.courses count];
	else
		return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *fieldLabel = self.description;
	CGSize textSize = [fieldLabel sizeWithFont:[UIFont fontWithName:@"Georgia" size:17.0f] constrainedToSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-20, MAXFLOAT) lineBreakMode:NSLineBreakByWordWrapping];
	float newHeight = textSize.height+22.0f;
	return newHeight;
}

- (void)addCourses:(NSDictionary*) dictionary withDescription:(NSString*)desc
{
	self.description = desc;
	
	NSMutableArray* arr = [[NSMutableArray alloc] initWithArray:[dictionary objectForKey:@"courses"]];
	[self.courses addObjectsFromArray:arr];
	
	[self.tableView reloadData];
}
@end
