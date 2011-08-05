//
//  PaddedUITextField.h
//  Ringadoc
//
//  Created by Gareth Walters on 6/22/11.
//  Copyright 2011 Curious Minds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PaddedUITextField : UITextField {
    BOOL isValid;
    BOOL willOpenPicker;
    NSUInteger fieldAction;
    BOOL shouldBlockKeyboard;
    BOOL gender;
    NSString* fieldKind;
    NSString* errorMessage;
    UIButton* errorIcon;
}

@property BOOL isValid;
@property BOOL willOpenPicker;
@property NSUInteger fieldAction;
@property BOOL gender;
@property BOOL shouldBlockKeyboard;
@property (nonatomic, retain) NSString* fieldKind;
@property (nonatomic, retain) NSString* errorMessage;
@property (nonatomic, retain) UIButton* errorIcon;

@end
