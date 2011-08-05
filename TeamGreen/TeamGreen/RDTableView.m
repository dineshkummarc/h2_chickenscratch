//
//  TableViewController.m
//  Ringadoc
//
//  Created by Gareth Walters on 4/26/11.
//  Copyright 2011 Curious Minds. All rights reserved.
//

#import "RDTableView.h"
#import "TextFieldTableViewCell.h"


@implementation RDTableView

@synthesize nextTable, tableId, delegate;
@synthesize activeField;
@synthesize nextPressed;

#pragma mark - TextField Delegate Methods

#pragma mark Limit certain textfield lengths

- (BOOL)textFieldShouldReturn:(PaddedUITextField*)textField
{
    NSLog(@"%d: textFieldShouldReturn", textField.tag);
    [textField resignFirstResponder];
	TextFieldTableViewCell *nextCell = (TextFieldTableViewCell *)[self cellForRowAtIndexPath:[NSIndexPath indexPathForRow:textField.tag+1 inSection:0]];
    
	if (nextCell) {
        [nextCell.textField becomeFirstResponder];
    } else {
        if ([self nextTable])
            [[self nextTable] gotoFirstCell];
	}
	return YES;
}

#pragma mark - Cell functions

- (void)gotoFirstCell {
    [[self delegate] switchView: tableId-1];
	TextFieldTableViewCell *cell = (TextFieldTableViewCell *)[self cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    [cell.textField becomeFirstResponder];
}

@end
