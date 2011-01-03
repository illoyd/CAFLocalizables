//
//  CAFLocalizableViewController.m
//  CAFLocalizables
//
//  Created by Ian Lloyd on 2/01/11.
//  Copyright 2011 Ian Lloyd. All rights reserved.
//

#import "CAFLocalizableViewController.h"

@implementation CAFLocalizableViewController

@synthesize localized;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
-(void)viewDidLoad
{
	[super viewDidLoad];
	[self localize];
}

-(void)localize
{
	// Localise self
	[self localizeStringsInObject:self.view];
	self.localized = YES;
}

-(void)localizeStringsInObject:(id)object
{
	// Localise object
	[[self nibBundle] localizeStringsInObject:object table:[self nibName]];
}

@end
