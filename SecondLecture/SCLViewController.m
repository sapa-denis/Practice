//
//  SCLViewController.m
//  SecondLecture
//
//  Created by Sapa Denys on 17.06.14.
//  Copyright (c) 2014 Sapa Denys. All rights reserved.
//

#import "SCLViewController.h"
#import "SCLPerson.h"

@interface SCLViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *birthDayPicker;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@property (nonatomic, strong) SCLPerson *person;
@end

@implementation SCLViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) {
		_person = [SCLPerson new];
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)displayPerson:(id)sender
{
	self.descriptionLabel.text = self.person.description;
	self.descriptionLabel.numberOfLines = 0;
	[self.descriptionLabel sizeToFit];
}

-(void)textFieldDidEndEditing:(UITextField *)textField
{
	if ([textField isEqual:self.firstNameTextField]) {
		self.person.firstName = self.firstNameTextField.text;
	} else if ([textField isEqual:self.lastNameTextField]) {
		self.person.lastName = self.lastNameTextField.text;
	}
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}

- (IBAction)datePicked:(UIDatePicker *)sender
{
	self.person.birthDate = sender.date;
}

@end
