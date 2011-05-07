//
//  NSBundle+CAFLocalizableBundle.m
//  CAFLocalizables
//
//  Created by Ian Lloyd on 2 January 2011.
//  Copyright 2011 Ian Lloyd. All rights reserved.
//

#import "NSBundle+CAFLocalizableBundle.h"
#import "CAFPluralizer.h"

@implementation NSBundle (CAFLocalizableBundle)

-(NSString *)localizedStringForKey:(NSString *)key number:(NSString *)number value:(NSString *)value table:(NSString *)tableName
{
	// Select the appropriate pluralized form of the key
	NSString *pluralizedKey = [[CAFPluralizer sharedPluralizer] pluralizedKeyForKey:key number:number];

	// Return the normal response
	return NSLocalizedStringFromTable( pluralizedKey, tableName, @"Pass to normal localization process" );
}

-(NSArray *)loadLocalizedNibNamed:(NSString *)name owner:(id)owner options:(NSDictionary *)options
{
	// Determine development language
	NSString *devLproj = [NSString stringWithFormat:@"%@.lproj", [self developmentLocalization]];

	// Get strings file for the specified nib
	NSString *localizedStringsTableName = [[name lastPathComponent] stringByDeletingPathExtension];
	NSString *localizedStringsTablePath = [self pathForResource:localizedStringsTableName ofType:@"strings"];

	// Build nib...
	NSArray *topLevelObjects = [self loadNibNamed:name owner:owner options:options];

	// And start localising
	if ( localizedStringsTablePath && ![[[localizedStringsTablePath stringByDeletingLastPathComponent] lastPathComponent] isEqualToString:devLproj] )
		[self localizeStringsInObject:topLevelObjects table:localizedStringsTableName];

	return topLevelObjects;
}

-(void)localizeStringsInObject:(id)object table:(NSString *)table;
{
	// NSLog(@"Localising %@", [object description]);

	// localize items in arrays
	if ([object isKindOfClass:[NSArray class]] )
	{
		for ( id nibItem in( NSArray * ) object )
			[self localizeStringsInObject:nibItem table:table];
		return;
	}

	// Handle setText
	if ([object respondsToSelector:@selector( setText: )] )
	{
		NSString *text = [self localizedStringForString:[object text] table:table];
		[object setText:text];
	}

	// Handle setTitle
	if ([object respondsToSelector:@selector( setTitle: )] )
	{
		NSString *title = [self localizedStringForString:[object title] table:table];
		[object setTitle:title];
	}

	// Handle setTitle:forState:
	if ([object respondsToSelector:@selector( setTitle:forState: )] )
	{
		NSString *title = [self localizedStringForString:[object titleForState:UIControlStateNormal] table:table];
		[object setTitle:title forState:UIControlStateNormal];

		title = [self localizedStringForString:[object titleForState:UIControlStateDisabled] table:table];
		[object setTitle:title forState:UIControlStateDisabled];

		title = [self localizedStringForString:[object titleForState:UIControlStateSelected] table:table];
		[object setTitle:title forState:UIControlStateSelected];

		title = [self localizedStringForString:[object titleForState:UIControlStateHighlighted] table:table];
		[object setTitle:title forState:UIControlStateHighlighted];
	}

	// Handle segmented controls
	if ([object respondsToSelector:@selector( setTitle:forSegmentAtIndex: )] )
	{
		for ( uint ii = 0; ii < [object numberOfSegments]; ii++ )
		{
			NSString *title = [self localizedStringForString:[object titleForSegmentAtIndex:ii] table:table];
			[object setTitle:title forSegmentAtIndex:ii];
		}
	}

	// Handle subviews
	if ([object respondsToSelector:@selector( subviews )] )
	{
		[self localizeStringsInObject:[object subviews] table:table];
	}
}

-(NSString *)localizedStringForString:(NSString *)string table:(NSString *)table;
{
	// Abort if string is empty
	if ( ![string length] ) return nil;

	// Localize and return
	return NSLocalizedStringWithDefaultValue( string, table, self, string, nil );
}

@end
