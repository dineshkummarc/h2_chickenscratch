//
//  TableViewTextFieldCell.m
//  Ringadoc
//
//  Created by Gareth Walters on 4/26/11.
//  Copyright 2011 Curious Minds. All rights reserved.
//

#import "TextFieldTableViewCell.h"


#define xSpacing 25


@implementation TextFieldTableViewCell

@synthesize textField, textLabelWidth;

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"TextField caught from TFTVC");
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    // Forcing UITableViewCellStyleSubtitle
    self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.textField.isValid = YES;
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.textField = [[PaddedUITextField alloc] initWithFrame:CGRectZero];
        self.textField.clearsOnBeginEditing = NO;
        self.textField.clearButtonMode = UITextFieldViewModeWhileEditing;
        self.textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        self.textField.font = [UIFont fontWithName:@"Helvetica" size:15];
        [self.textField setAdjustsFontSizeToFitWidth:YES];
        
        [self.contentView addSubview:textField];
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"rdtableview-background"]];
        
        // Set label font style
        self.textLabel.font = [UIFont fontWithName:@"Helvetica-Bold" size:13];
        self.textLabel.textColor = [UIColor colorWithWhite:0.3 alpha:1.0];
        self.textLabel.textAlignment = UITextAlignmentRight;
        self.textLabel.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)layoutSubviews {
	[super layoutSubviews];
    
    // Set label width
	if (textLabelWidth) {
		CGRect textLabelFrame = self.textLabel.frame;
		textLabelFrame.size.width = textLabelWidth;
        self.textLabel.frame = textLabelFrame;
	} else {
        CGRect textLabelFrame = self.textLabel.frame;
        textLabelFrame.size.width = 85;
        self.textLabel.frame = textLabelFrame;
    }
    //self.textLabel.adjustsFontSizeToFitWidth = YES;
	
	if (self.textLabel.text) {
		textField.frame = CGRectMake(0,
                                     0,
                                     self.contentView.frame.size.width - 5,
                                     self.contentView.frame.size.height);
	} else {
		textField.frame = CGRectMake(xSpacing,
                                     0,
                                     self.contentView.frame.size.width - (xSpacing * 2),
                                     self.contentView.frame.size.height);
	}
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)dealloc
{
    [textField release];
    [super dealloc];
}

@end
