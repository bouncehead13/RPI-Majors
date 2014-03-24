//
//  AnswerViewController.m
//  RPI Majors
//
//  Created by Matt on 3/23/14.
//  Copyright (c) 2014 Matt. All rights reserved.
//

#import "AnswerViewController.h"

@interface AnswerViewController ()

@end

@implementation AnswerViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	[self.tableView reloadData];
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(cancelAction)];
	self.navigationController.navigationBar.barTintColor = [UIColor redColor];
	self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [super tableView:tableView cellForRowAtIndexPath:indexPath];
	if (indexPath.section == 0)
	{
		UILabel* label = (UILabel *)[cell viewWithTag:0];
		label.text = self.question;
	}
	else
	{
		UILabel* label = (UILabel *)[cell viewWithTag:0];
		label.text = self.answer;
	}
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	NSString *fieldLabel;
	if(indexPath.section == 0)
		fieldLabel = self.question;
	else
		fieldLabel = self.answer;
	
	CGSize size = CGSizeMake([UIScreen mainScreen].bounds.size.width-20, MAXFLOAT);
	CGRect textSize = [fieldLabel boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:17.0f]} context:nil];
	float newHeight = textSize.size.height+22.0f;
	return newHeight;
}

- (void)cancelAction
{
    [self dismissViewControllerAnimated:YES completion:nil];	
}

@end
