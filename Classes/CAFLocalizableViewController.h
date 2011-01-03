//
//  CAFLocalizableViewController.h
//  CAFLocalizables
//
//  Created by Ian Lloyd on 2/01/11.
//  Copyright 2011 Ian Lloyd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSBundle+CAFLocalizableBundle.h"

@interface CAFLocalizableViewController : UIViewController {}

@property (nonatomic) BOOL localized;
-(void)localize;
-(void)localizeStringsInObject:(id)object;

@end
