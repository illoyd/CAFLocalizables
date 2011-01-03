//
//  NSBundle+CAFLocalizableBundle.h
//  CAFLocalizables
//
//  Created by Ian Lloyd on 2 January 2011.
//  Copyright 2011 Ian Lloyd. All rights reserved.
//
//  This code is loosely based on the following prior work:
//  Created by William Jon Shipley on 2/13/05.
//  Copyright © 2005-2009 Golden % Braeburn, LLC. All rights reserved except as below:
//  This code is provided as-is, with no warranties or anything. You may use it in your projects as you wish, but you must leave this comment block (credits and copyright) intact. That's the only restriction -- Golden % Braeburn otherwise grants you a fully-paid, worldwide, transferrable license to use this code as you see fit, including but not limited to making derivative works.
//
//  Of course, Shipley's work won't work with iOS devices, so almost everything has been
//  rewritten.  Also, this eliminates the calls to specific classes, and instead looks for
//  selectors to manipulate.  Thus, it should work with a variety of controls, both existing
//  and to be.


#import <UIKit/UIKit.h>

@interface NSBundle (CAFLocalizableBundle)

-(NSArray *)loadLocalizedNibNamed:(NSString *)name owner:(id)owner options:(NSDictionary *)options;
-(void)localizeStringsInObject:(id)object table:(NSString *)table;
-(NSString *)localizedStringForString:(NSString *)string table:(NSString *)table;

@end
