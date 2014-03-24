//
//  FAQViewController.m
//  RPI Majors
//
//  Created by Matt on 2/11/14.
//  Copyright (c) 2014 Matt. All rights reserved.
//

#import "FAQViewController.h"
#import "AnswerViewController.h"

@interface FAQViewController ()

@property(strong) AnswerViewController *controller;

@end

@implementation FAQViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
    [[cell textLabel] setText:[self.questions objectAtIndex:indexPath.row]];
	
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	return [self.questions count];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
	NSString* question = [cell textLabel].text;
	
	self.controller = [[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]] instantiateViewControllerWithIdentifier:@"answ"];
	self.controller.question = question;
	self.controller.answer = [self.answers objectAtIndex:indexPath.row];
	
	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:self.controller];
	[self presentViewController:navController animated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *fieldLabel = [self.questions objectAtIndex:indexPath.row];
	CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width-20, MAXFLOAT);
	CGRect textSize = [fieldLabel boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:17.0f]} context:nil];
	float newHeight = textSize.size.height+22.0f;
	return newHeight;
}

- (void)addQuestions:(NSDictionary*) dictionary
{
	if(!self.questions) self.questions = [[NSMutableArray alloc] init];
	if(!self.answers) self.answers = [[NSMutableArray alloc] init];

	NSMutableArray* arr = [[NSMutableArray alloc] initWithArray:[dictionary objectForKey:@"questions"]];
	[self.questions addObjectsFromArray:arr];

	NSMutableArray* arr2 = [[NSMutableArray alloc] initWithArray:[dictionary objectForKey:@"answers"]];
	[self.answers addObjectsFromArray:arr2];

	[self.tableView reloadData];
}

@end
