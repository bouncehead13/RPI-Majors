//
//  NoteCardMasterViewController.m
//  FindYourMajor
//
//  Created by Matt on 2/3/14.
//  Copyright (c) 2014 Matt. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "InformationViewController.h"

@interface MasterViewController ()
{
	NSMutableArray *searchData;
	NSMutableArray *searchResults;
}
@end

@implementation MasterViewController

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	searchData = [[NSMutableArray alloc] init];
	[searchData addObjectsFromArray:[NSArray arrayWithObjects:
								  @"Architectural Science", @"Architectural Acoustics",
								  @"Building Conservation", @"Built Ecologies",
								  @"Lighting", @"Sustainability", nil]];
	[searchData addObjectsFromArray:[NSArray arrayWithObjects:@"Accounting", @"Business Analytics",
								  @"Entrepreneurship", @"Finance",
								  @"International Management", @"Information Systems",
								  @"Marketing", @"Supply Chain Management", nil]];
	[searchData addObjectsFromArray:[NSArray arrayWithObjects:@"Aeronautical Engineering", @"Biomedical Engineering",
								  @"Chemical Engineering", @"Civil Engineering",
								  @"Computer & Systems Engineering", @"Electrical Engineering",
								  @"Industrial & Management Engineering", @"Materials Engineering",
								  @"Mechanical Engineering", @"Nuclear Engineering", nil]];
	[searchData addObjectsFromArray:[NSArray arrayWithObjects:@"Cognitive Science", @"Communication",
								  @"Design, Innovation & Society", @"Economics",
								  @"Electronics Arts", @"Electronic Media",
								  @"Games & Simulation", @"Philosophy",
								  @"Psychology", @"Science, Technology & Society",
								  @"Sustainability Studies", nil]];
	[searchData addObjectsFromArray:[NSArray arrayWithObjects:@"Arts", @"Civil Engineering",
								  @"Cognitive Science", @"Communication",
								  @"Computer Hardware", @"Computer Networking",
								  @"Data Science", @"Economics",
								  @"Entrepreneurship", @"Finance",
								  @"Information Security", @"Machine Learning",
								  @"Management Information Systems", @"Mechanical/Aeronautical Engineering",
								  @"Medicine", @"Pre-Law",
								  @"Psychology", @"Science Technology Studies",
								  @"Science Informatics", @"Web Technologies", nil]];
	[searchData addObjectsFromArray:[NSArray arrayWithObjects:@"Applied Physics", @"Biochemistry/Biophysics",
								  @"Bioinformatics", @"Biology",
								  @"Chemistry", @"Computer Science",
								  @"Environmental Science", @"Geology",
								  @"Hydrogeology", @"IT & Web Science",
								  @"Interdisciplinary Science", @"Mathematics",
								  @"Physics", nil]];
	
	searchResults = [NSMutableArray arrayWithCapacity:[searchData count]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
	[self.tableView reloadData];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
	[searchResults removeAllObjects];
    // Filter the array using NSPredicate
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF contains[c] %@",searchText];
	searchResults = [NSMutableArray arrayWithArray:[searchData filteredArrayUsingPredicate:predicate]];
	
	[self.searchDisplayController.searchResultsTableView reloadData];
}

#pragma mark - Table View

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        return [searchResults count];
	}
	else
	{
		if(section == 0)
			return 6;
		else
			return 1;
	}
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (tableView == self.searchDisplayController.searchResultsTableView)
	{
		UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
		cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
		cell.textLabel.text = [searchResults objectAtIndex:indexPath.row];
        return cell;
	}
	else
	{
		UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
		return cell;
	}
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	if (tableView == self.searchDisplayController.searchResultsTableView)
	{
		UIViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"InformationView"];
		InformationViewController* info = (InformationViewController*)viewController;
		[info setDetailItem: [searchResults objectAtIndex:indexPath.row]];
		
		[self.navigationController pushViewController:viewController animated:YES];
	}
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	if (tableView == self.tableView)
        return 2;
	else
		return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return 45;
}

- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 0;
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
