//
//  DetailViewController.m
//  FindYourMajor
//
//  Created by Matt on 2/3/14.
//  Copyright (c) 2014 Matt. All rights reserved.
//

#import "DetailViewController.h"
#import "InformationViewController.h"

@interface DetailViewController ()
{
	NSMutableArray *objects;
}
@end

@implementation DetailViewController

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	objects = [[NSMutableArray alloc] init];
	self.title = self.detailItem;
	
	if([self.title isEqualToString:@"Architecture"])
	{
		[objects addObjectsFromArray:[NSArray arrayWithObjects:
									  @"Architectural Science", @"Architectural Acoustics",
									  @"Building Conservation", @"Built Ecologies",
									  @"Lighting", @"Sustainability", nil]];
	}
	else if([self.title isEqualToString:@"Business"])
	{
		[objects addObjectsFromArray:[NSArray arrayWithObjects:@"Accounting", @"Business Analytics",
									  @"Entrepreneurship", @"Finance",
									  @"International Management", @"Information Systems",
									  @"Marketing", @"Supply Chain Management", nil]];
	}
	else if([self.title isEqualToString:@"Engineering"])
	{
		[objects addObjectsFromArray:[NSArray arrayWithObjects:@"Aeronautical Engineering", @"Biomedical Engineering",
									  @"Chemical Engineering", @"Civil Engineering",
									  @"Computer & Systems Engineering", @"Electrical Engineering",
									  @"Industrial & Management Engineering", @"Materials Engineering",
									  @"Mechanical Engineering", @"Nuclear Engineering", nil]];
	}
	else if([self.title isEqualToString:@"Humanities"])
	{
		[objects addObjectsFromArray:[NSArray arrayWithObjects:@"Cognitive Science", @"Communication",
									  @"Design, Innovation & Society", @"Economics",
									  @"Electronics Arts", @"Electronic Media",
									  @"Games & Simulation", @"Philosophy",
									  @"Psychology", @"Science, Technology & Society",
									  @"Sustainability Studies", nil]];
	}
	else if([self.title isEqualToString:@"IT & Web Science"])
	{
		[objects addObjectsFromArray:[NSArray arrayWithObjects:@"Arts", @"Civil Engineering",
									  @"Cognitive Science", @"Communication",
									  @"Computer Hardware", @"Computer Networking",
									  @"Data Science", @"Economics",
									  @"Entrepreneurship", @"Finance",
									  @"Information Security", @"Machine Learning",
									  @"Management Information Systems", @"Mechanical/Aeronautical Engineering",
									  @"Medicine", @"Pre-Law",
									  @"Psychology", @"Science Technology Studies",
									  @"Science Informatics", @"Web Technologies", nil]];
	}
	else if([self.title isEqualToString:@"Science"])
	{
		[objects addObjectsFromArray:[NSArray arrayWithObjects:@"Applied Physics", @"Biochemistry/Biophysics",
									  @"Bioinformatics", @"Biology",
									  @"Chemistry", @"Computer Science",
									  @"Environmental Science", @"Geology",
									  @"Hydrogeology", @"IT & Web Science",
									  @"Interdisciplinary Science", @"Mathematics",
									  @"Physics", nil]];
	}
	else if([self.title isEqualToString:@"Biology"])
	{
		[objects addObjectsFromArray:[NSArray arrayWithObjects:@"Biochemistry/Biophysics", @"Bioinformatics",
									  @"Biology", @"Biomedical Engineering", nil]];
	}
	else if([self.title isEqualToString:@"Chemistry"])
	{
		[objects addObjectsFromArray:[NSArray arrayWithObjects:@"Biochemistry/Biophysics", @"Chemical Engineering",
									  @"Chemistry", nil]];
	}
	else if([self.title isEqualToString:@"Computers"])
	{
		[objects addObjectsFromArray:[NSArray arrayWithObjects:@"Computer Science", @"Computer & Systems Engineering", nil]];
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View

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
	UILabel* label = (UILabel *)[cell viewWithTag:0];
	label.text = objects[indexPath.row];
	
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showInformation"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        [[segue destinationViewController] setDetailItem:objects[indexPath.row]];
    }
}

@end
