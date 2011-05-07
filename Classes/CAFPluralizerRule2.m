//
//  CAFPluralizerRule2.m
//  CAFLocalizables
//
//  Created by Ian Lloyd on 05/05/2011.
//  Copyright 2011 Caffeinated Adventures. All rights reserved.
//

#import "CAFPluralizerRule2.h"


@implementation CAFPluralizerRule2

-(NSUInteger)pluralFormForDouble:(double)number
{
	// [0 .. 2]: singular
	if ( number >= 0 && number <= 2 )
		return 0;

	// Default: plural
	else
		return 1;
}

@end
