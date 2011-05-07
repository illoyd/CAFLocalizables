//
//  CAFPluralizerRule1.m
//  CAFLocalizables
//
//  Created by Ian Lloyd on 05/05/2011.
//  Copyright 2011 Caffeinated Adventures. All rights reserved.
//

#import "CAFPluralizerRule1.h"


@implementation CAFPluralizerRule1

-(NSUInteger)pluralFormForDouble:(double)number
{
	// (0 .. 1]: singular
	if ( number > 0 && number <= 1 )
		return 0;

	// Default: plural
	else
		return 1;
}

@end
