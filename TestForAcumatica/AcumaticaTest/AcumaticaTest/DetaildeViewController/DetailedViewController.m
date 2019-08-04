//
//  DetailedViewController.m
//  AcumaticaTest
//
//  Created by Artashes Yeghiazaryan on 7/3/19.
//  Copyright © 2019 Artashes Yeghiazaryan. All rights reserved.
//

#import "DetailedViewController.h"
#import "PersonModel.h"

@interface DetailedViewController () <UITextFieldDelegate>

@property (strong, nonatomic) PersonModel *personModel;

@end

@implementation DetailedViewController

- (instancetype)initWithData:(PersonModel *)personModel
{
    if (self = [super initWithNibName:nil bundle:nil])
    {
        self.personModel = personModel;
    }
    return self;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    UIBarButtonItem *doneButton =
    [[UIBarButtonItem alloc] initWithTitle:@"Сохранить"
                                     style:UIBarButtonItemStyleDone
                                    target:self
                                    action:@selector(saveAction)];
    [self.navigationItem setRightBarButtonItem:doneButton];
    
    UIBarButtonItem *backButton =
    [[UIBarButtonItem alloc] initWithTitle:@"Назад"
                                     style:UIBarButtonItemStylePlain
                                    target:self
                                    action:@selector(backAction)];
    self.navigationItem.leftBarButtonItem = backButton;
    
    

    
    self.birthdateTextField.text = self.personModel.birthdate.value;
    self.childrenCountTextField.text = self.personModel.childrenCount.value;
    self.lastNameTextField.text = self.personModel.lastName.value;
    self.nameTextField.text = self.personModel.name.value;
    
    self.birthdateLabel.text = self.personModel.birthdate.fieldName;
    self.childrenCountLabel.text = self.personModel.childrenCount.fieldName;
    self.lastNameLabel.text = self.personModel.lastName.fieldName;
    self.nameTextLabel.text = self.personModel.name.fieldName;
    
}

#pragma mark - Actions

- (void)backAction
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)saveAction
{
    [self.view endEditing:YES];
    
    
    
    BOOL isBirthDateValid = [self isValidField:self.birthdateTextField
                                      required:self.personModel.birthdate.isRequired
                                     withLabel:self.birthdateLabel
                              withCharacterSet:self.personModel.birthdate.characterSet];
    
    BOOL isChildrenCountValid = [self isValidField:self.childrenCountTextField
                                          required:self.personModel.childrenCount.isRequired
                                         withLabel:self.childrenCountLabel
                                  withCharacterSet:self.personModel.childrenCount.characterSet];
    
    BOOL isLastNameValid = [self isValidField:self.lastNameTextField
                                     required:self.personModel.lastName.isRequired
                                    withLabel:self.lastNameLabel
                             withCharacterSet:self.personModel.lastName.characterSet];
    
    BOOL isNameValid = [self isValidField:self.nameTextField
                                 required:self.personModel.name.isRequired
                                withLabel:self.nameTextLabel
                         withCharacterSet:self.personModel.name.characterSet];
    
    
    if (isBirthDateValid && isChildrenCountValid && isLastNameValid && isNameValid)
    {
        self.personModel.birthdate.value = [self.birthdateTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        self.personModel.name.value = [self.nameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        self.personModel.lastName.value = [self.lastNameTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        self.personModel.childrenCount.value = [self.childrenCountTextField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)showAlertWithTitle:(NSString *)title
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil]];
    
    [self presentViewController:alert animated:YES completion:nil];
    
}

- (BOOL)isValidField:(UITextField *)textField required:(BOOL)isRequired withLabel:(UILabel *)label withCharacterSet:(NSCharacterSet *)characterSet
{
    BOOL isValid = YES;
    NSString* text = [textField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    if (text.length > 0)
    {
        NSString *typeValideString = [text stringByTrimmingCharactersInSet:characterSet];
        if (typeValideString.length > 0)
        {
            [self showAlertWithTitle:@"Field contains not valid characters"];
            isValid = NO;
        }
    }
    else
    {
        if (isRequired)
        {
            
            if (text.length <= 0)
            {
                [self showAlertWithTitle:@"Date field required. Please fill it"];
                
                isValid = NO;
            }
        }
    }
    
    textField.textColor = isValid ? [UIColor blackColor] : [UIColor redColor];
    label.textColor = isValid ? [UIColor blackColor] : [UIColor redColor];
    
    
    return isValid;
}

@end
