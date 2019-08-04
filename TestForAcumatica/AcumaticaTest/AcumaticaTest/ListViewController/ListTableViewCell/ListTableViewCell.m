//
//  ListTableViewCell.m
//  AcumaticaTest
//
//  Created by Artashes Yeghiazaryan on 7/3/19.
//  Copyright © 2019 Artashes Yeghiazaryan. All rights reserved.
//

#import "ListTableViewCell.h"
#import "PersonModel.h"

@interface ListTableViewCell ()

@property (strong, nonatomic) PersonModel *personModel;

@end

@implementation ListTableViewCell 

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (IBAction)deleteAction:(id)sender
{
    [self.delegate removeObjectFromData:self.personModel];
}

- (void)setCellWithModel:(PersonModel *)personModel
{
    self.personModel = personModel;
    self.birthdate.text = [NSString stringWithFormat:@"%@:   %@", personModel.birthdate.fieldName, personModel.birthdate.value];
    
//    if ([personModel.childrenCount isEqualToString:@""] == NO)
    {
        self.childrenCount.text = [NSString stringWithFormat:@"%@:   %@", personModel.childrenCount.fieldName, personModel.childrenCount.value];
    }
//    else
//    {
//        self.childrenCount.text = @"Нет детей";
//    }
    
    
    self.lastName.text = [NSString stringWithFormat:@"%@:   %@", personModel.lastName.fieldName, personModel.lastName.value];
    
    self.name.text = [NSString stringWithFormat:@"%@:   %@", personModel.name.fieldName, personModel.name.value];
}

@end
