//
//  PaddedUITextField.m
//  Ringadoc
//
//  Created by Gareth Walters on 6/22/11.
//  Copyright 2011 Curious Minds. All rights reserved.
//

#import "PaddedUITextField.h"

@implementation PaddedUITextField

@synthesize isValid, willOpenPicker, gender;
@synthesize fieldAction;
@synthesize fieldKind, errorMessage;
@synthesize shouldBlockKeyboard;
@synthesize errorIcon;

- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x + 115, bounds.origin.y,
                      bounds.size.width - 145, bounds.size.height);
}

- (CGRect)editingRectForBounds:(CGRect)bounds {
    return [self textRectForBounds:bounds];
}

- (id)init
{
    self = [super init];
    if (self) {
        // Initialization code here.
        self.isValid = YES;
    }
    
    return self;
}

@end
