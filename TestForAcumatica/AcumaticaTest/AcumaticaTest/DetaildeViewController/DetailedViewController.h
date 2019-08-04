//
//  DetailedViewController.h
//  AcumaticaTest
//
//  Created by Artashes Yeghiazaryan on 7/3/19.
//  Copyright © 2019 Artashes Yeghiazaryan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PersonModel;

NS_ASSUME_NONNULL_BEGIN

@interface DetailedViewController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *birthdateTextField;
@property (strong, nonatomic) IBOutlet UITextField *childrenCountTextField;
@property (strong, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;

@property (strong, nonatomic) IBOutlet UILabel *birthdateLabel;
@property (strong, nonatomic) IBOutlet UILabel *childrenCountLabel;
@property (strong, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (strong, nonatomic) IBOutlet UILabel *nameTextLabel;


- (instancetype)initWithData:(PersonModel *)personModel;

@end

NS_ASSUME_NONNULL_END
