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

@property (nonatomic, strong) NSMutableArray *personsArray;

@property (nonatomic, strong) SCLPersonDescriptionFormatter *personFormatter;

@end

@implementation SCLViewController

- (id)initWithCoder:(NSCoder *)aDecoder
{
	self = [super initWithCoder:aDecoder];
	if (self) {
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
	SCLPerson *person = [self readPersonsInfo];
	[self.personsArray addObject:person];
	
	NSString *description = [NSString stringWithFormat:@"%ul\n %@", [self.personsArray count], [self.personFormatter descriptionStringFromPerson:person]];
	
	self.descriptionLabel.text = description;
	self.descriptionLabel.numberOfLines = 0;
	[self.descriptionLabel sizeToFit];
}

- (NSString *)lastPersonDescription
{
	SCLPerson *person = [self.personsArray lastObject];
	
	return [self.personFormatter descriptionStringFromPerson:person];
}

- (SCLPerson *)readPersonsInfo
{
	SCLPerson *person = [SCLPerson new];
	
	person.birthDate = self.birthDayPicker.date;
	person.firstName = self.firstNameTextField.text;
	person.lastName = self.lastNameTextField.text;
	return person;

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}


@end
