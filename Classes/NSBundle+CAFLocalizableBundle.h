//
//  NSBundle+CAFLocalizableBundle.h
//  CAFLocalizables
//
//  Created by Ian Lloyd on 2/01/11.
//  Copyright 2011 Ian Lloyd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSBundle (CAFLocalizableBundle)

-(NSArray *)loadLocalizedNibNamed:(NSString *)name owner:(id)owner options:(NSDictionary *)options;
-(void)localizeStringsInObject:(id)object table:(NSString *)table;
-(NSString *)localizedStringForString:(NSString *)string table:(NSString *)table;

@end
