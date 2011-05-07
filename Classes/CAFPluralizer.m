//
//  CAFPluralizer.m
//  CAFLocalizables
//
//  Created by Ian Lloyd on 05/05/2011.
//  Copyright 2011 Caffeinated Adventures. All rights reserved.
//

#import "CAFPluralizer.h"

@interface CAFPluralizer ()

@property (nonatomic, retain, readwrite) id <CAFPluralizerRule> rule;

-(id <CAFPluralizerRule>)newRuleForRuleNumber:(NSUInteger)pluralRuleNumber;

@end

@implementation CAFPluralizer

@synthesize rule = _rule;

static CAFPluralizer *_sharedPluralizer = nil;

+(CAFPluralizer *)sharedPluralizer
{
	@synchronized( self )
	{
		if ( _sharedPluralizer == nil )
		{
			// Initialise
			_sharedPluralizer = [[self alloc] init];

			// Listen for messages
			[[NSNotificationCenter defaultCenter] addObserver:_sharedPluralizer selector:@selector( currentLocaleDidChange: ) name:NSCurrentLocaleDidChangeNotification object:nil];
		}
	}

	return _sharedPluralizer;
}

+(void)removeSharedPluralizer
{
	@synchronized( self )
	{
		// Stop listening for locale change
		[[NSNotificationCenter defaultCenter] removeObserver:_sharedPluralizer];

		// Release and destroy
		[_sharedPluralizer release];
		_sharedPluralizer = nil;
	}
}

-(id)init
{
	NSLocale *locale = [NSLocale currentLocale];
	return [self initWithLocale:locale];
}

-(id)initWithLocale:(NSLocale *)locale
{
	self = [super init];
	if ( self )
	{
		// Pick rule number from locale
		NSUInteger pluralRuleNumber = [self pluralRuleForLocale:locale];

		// Build rule
		id <CAFPluralizerRule> rule = [self newRuleForRuleNumber:pluralRuleNumber];
		self.rule = rule;
		[rule release];
	}
	return self;
}

-(void)dealloc
{
	self.rule = nil;
	[super dealloc];
}

+(NSUInteger)pluralFormForDouble:(double)number
{
	return [[[self sharedPluralizer] rule] pluralFormForDouble:number];
}

-(id <CAFPluralizerRule>)newRuleForRuleNumber:(NSUInteger)pluralRuleNumber
{
	// Build rule
	NSString *ruleClassName = [NSString stringWithFormat:@"CAFPluralizerRule%i", pluralRuleNumber];
	Class ruleClass = NSClassFromString( ruleClassName );
	id <CAFPluralizerRule> rule = [[ruleClass alloc] init];
	return rule;
}

-(NSUInteger)pluralRuleForLocale:(NSLocale *)locale
{
	// Load rule data from dictionary
	NSDictionary *rules = [[[NSDictionary alloc] initWithContentsOfFile:CAFPluralizer_Rule_Plist] autorelease];

	// Try to find locale identifier
	NSNumber *number = [rules objectForKey:[locale objectForKey:NSLocaleIdentifier]];
	if ( number != nil )
		return [number unsignedIntegerValue];

	// Try to find general language code
	number = [rules objectForKey:[locale objectForKey:NSLocaleLanguageCode]];
	if ( number != nil )
		return [number unsignedIntegerValue];

	// Default - return default rule
	return CAFPluralizer_Default_Rule;
}

-(void)currentLocaleDidChange:(NSNotification *)notification
{
	// Destroy shared pluralizer!
	[[self class] removeSharedPluralizer];
}

@end
