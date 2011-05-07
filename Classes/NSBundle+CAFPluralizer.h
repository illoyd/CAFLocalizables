//
//  NSBundle+CAFPluralizer.h
//  CAFLocalizables
//
//  Created by Ian Lloyd on 07/05/2011.
//  Copyright 2011 Caffeinated Adventures. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSBundle (CAFPluralizer)

#define CAFLocalizedPluralString( key, number, comment ) \
        [[NSBundle mainBundle] localizedStringForKey : (key) number : (number) value : nil table : nil]

#define CAFLocalizedPluralStringFromTable( key, number, tbl, comment ) \
        [[NSBundle mainBundle] localizedStringForKey : (key) number : (number) value : nil table : (tbl)]

@end
