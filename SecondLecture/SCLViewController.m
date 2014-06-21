//
//  SCLViewController.m
//  SecondLecture
//
//  Created by Sapa Denys on 17.06.14.
//  Copyright (c) 2014 Sapa Denys. All rights reserved.
//

#import "SCLViewController.h"
#import "SCLPerson.h"
#import "SCLPersonDescriptionFormatter.h"

@interface SCLViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UIDatePicker *birthDayPicker;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@property (nonatomic, strong) SCLPerson *person;

@property (nonatomic, strong) NSMutableArray *personsArray;

@property (nonatomic, strong) SCLPersonDescriptionFormatter *personFormatter;

@end

@implementation SCLViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) {
		_person = [SCLPerson new];
		_personFormatter = [SCLPersonDescriptionFormatter new];
		_personsArray = [NSMutableArray array];
	}
	return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)displayPerson:(id)sender
{
	[self.personsArray addObject:self.person];
	
	if (!self.person.birthDate) {
		self.person.birthDate = self.birthDayPicker.date;
	}
	
	self.descriptionLabel.text = [self lastPersonDescription];
	self.descriptionLabel.numberOfLines = 0;
	[self.descriptionLabel sizeToFit];
}

- (NSString *)lastPersonDescription
{
	SCLPerson *person = [self.personsArray lastObject];
	
	return [self.personFormatter descriptionStringFromPerson:person];
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
