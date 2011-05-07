//
//  NSBundle+CAFPluralizer.m
//  CAFLocalizables
//
//  Created by Ian Lloyd on 07/05/2011.
//  Copyright 2011 Caffeinated Adventures. All rights reserved.
//

#import "NSBundle+CAFPluralizer.h"
#import "CAFPluralizer.h"

@implementation NSBundle (CAFPluralizer)

-(NSString *)localizedStringForKey:(NSString *)key number:(double)number value:(NSString *)value table:(NSString *)tableName
{
	// Get rule form from default pluralizer
	NSUInteger ruleForm = [[[CAFPluralizer sharedPluralizer] rule] pluralFormForDouble:number];

	// Find the localized string, split by the divider, then return entry from rule form
	NSString *localized = [self localizedStringForKey:key value:value table:tableName];
	NSArray *split = [localized componentsSeparatedByString:kPluralLocalizedStringSeparator];
	return [split objectAtIndex:ruleForm];
}

@end
