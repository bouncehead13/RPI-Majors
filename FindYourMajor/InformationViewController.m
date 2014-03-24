//
//  InformationViewController.m
//  RPI Majors
//
//  Created by Matt on 2/9/14.
//  Copyright (c) 2014 Matt. All rights reserved.
//

#import "InformationViewController.h"
#import "DescriptionViewController.h"
#import "ContactsViewController.h"
#import "FAQViewController.h"

@interface InformationViewController ()
{
	NSData *response;
	NSArray *splitResponse;
	NSArray *views;
	UIAlertView *alert;
	UIAlertView *okayAlert;
	NSURLConnection *connect;
	NSDictionary *parsed;
	BOOL loaded;
}

@end

@implementation InformationViewController

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	loaded = NO;
	views = [[NSArray alloc] initWithArray:[self viewControllers]];
	[self setEdgesForExtendedLayout: UIRectEdgeNone];
	alert = [[UIAlertView alloc] initWithTitle:@"Loading Data..." message:@"Please Wait" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:nil, nil];
	okayAlert = [[UIAlertView alloc] initWithTitle:@"Connection failed" message:nil delegate:self cancelButtonTitle:@"Go Back" otherButtonTitles:nil, nil];
}

- (void)viewDidAppear:(BOOL)animated
{
	if(loaded == NO)
	{
		NSString *urlString = [_detailItem stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
		urlString = [urlString stringByReplacingOccurrencesOfString:@"&" withString:@"%26"];
		
		NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat: @"http://findmajor.myrpi.org/scripts/index.php?major=%@", urlString]]];
		connect = [[NSURLConnection alloc] initWithRequest:request delegate:self];
		[alert show];
		loaded = YES;
	}
}

- (void)connection:(NSURLConnection*)connection didFailWithError:(NSError*)error
{
	[alert dismissWithClickedButtonIndex:0 animated:NO];
	[okayAlert show];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	response = data;
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
	NSError *error = nil;
	id object = [NSJSONSerialization JSONObjectWithData:response options:0 error:&error];
	
	if([object isKindOfClass:[NSDictionary class]])
		parsed = object;
	
	[alert dismissWithClickedButtonIndex:0 animated:YES];
	[[self tabBar] setHidden:NO];
	[self initDescription];
	connection = nil;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	[[self navigationController] popViewControllerAnimated:YES];
	[connect cancel];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
	
}

- (void)initDescription
{
	DescriptionViewController *description = [views objectAtIndex:0];
	NSDictionary *courses = [parsed objectForKey:@"courses"];
	
	[description addCourses:courses withDescription:[parsed objectForKey:@"description"]];
	[self initContacts];
}

- (void)initContacts
{
	ContactsViewController *contacts = [views objectAtIndex:1];
	NSDictionary *peers = [parsed objectForKey:@"contacts"];
	
	[contacts addContacts:peers withName:[parsed objectForKey:@"advisor"] andEmail:[parsed objectForKey:@"advisor_email"]];
	[self initFAQ];
}

- (void)initFAQ
{
	FAQViewController *faq = [views objectAtIndex:2];
	
	NSDictionary *questions = [parsed objectForKey:@"faqs"];
	[faq addQuestions:questions];
}

@end
