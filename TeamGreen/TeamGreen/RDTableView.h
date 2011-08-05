//
//  TableViewController.h
//  Ringadoc
//
//  Created by Gareth Walters on 4/26/11.
//  Copyright 2011 Curious Minds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PaddedUITextField.h"


@protocol RDTableViewDelegate <NSObject>
- (void)switchView:(int)view;
@end

@interface RDTableView : UITableView <UITextFieldDelegate> {
    RDTableView *nextTable;
    int tableId;
    id <RDTableViewDelegate> delegate;
    BOOL nextPressed;
    
    // Store the currently active textfield
    PaddedUITextField *activeField;
}

@property (nonatomic, retain) RDTableView *nextTable;
@property (nonatomic) int tableId;
@property (nonatomic, assign) id delegate;
@property BOOL nextPressed;

@property (nonatomic, retain) PaddedUITextField *activeField;

- (void)gotoFirstCell;

@end
