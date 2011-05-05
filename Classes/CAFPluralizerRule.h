//
//  CAFPluralizerRule.h
//  CAFLocalizables
//
//  Created by Ian Lloyd on 05/05/2011.
//  Copyright 2011 Caffeinated Adventures. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol CAFPluralizerRule <NSObject>

@required
-(NSUInteger)pluralFormForDouble:(double)number;
//-(NSUInteger)pluralFormForInteger:(NSInteger)number;
//-(NSUInteger)pluralFormForDouble:(double)number;

@end
