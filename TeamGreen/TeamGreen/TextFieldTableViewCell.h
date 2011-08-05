//
//  TableViewTextFieldCell.h
//  Ringadoc
//
//  Created by Gareth Walters on 4/26/11.
//  Copyright 2011 Curious Minds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PaddedUITextField.h"


@interface TextFieldTableViewCell : UITableViewCell {
    PaddedUITextField *textField;
    int textLabelWidth;
}

@property (nonatomic, retain) PaddedUITextField *textField;
@property int textLabelWidth;

@end
