//
//  CAFPluralizer.h
//  CAFLocalizables
//
//  Created by Ian Lloyd on 05/05/2011.
//  Copyright 2011 Caffeinated Adventures. All rights reserved.
//
//  Based on the specification for Mozilla's PluralForms project
//  https://developer.mozilla.org/en/Localization_and_Plurals
//  With cav

#import <Foundation/Foundation.h>
#import "CAFPluralizerRule.h"

#ifndef CAFPluralizer_Default_Rule
#define CAFPluralizer_Default_Rule 1
#endif

#ifndef CAFPluralizer_Rule_Plist
#define CAFPluralizer_Rule_Plist @"CAFPluralizerRules.plist"
#endif

static NSString *const kPluralLocalizedStringSeparator = @";";

@interface CAFPluralizer : NSObject {
	@private
	id <CAFPluralizerRule> _rule;
}

@property (nonatomic, retain, readonly) id <CAFPluralizerRule> rule;

-(id)init;
-(id)initWithLocale:(NSLocale *)locale;

-(NSUInteger)pluralRuleForLocale:(NSLocale *)locale;
-(void)currentLocaleDidChange:(NSNotification *)notification;

+(CAFPluralizer *)sharedPluralizer;
+(void)removeSharedPluralizer;

@end
