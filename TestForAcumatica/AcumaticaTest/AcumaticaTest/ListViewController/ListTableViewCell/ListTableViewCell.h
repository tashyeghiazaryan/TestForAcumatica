//
//  ListTableViewCell.h
//  AcumaticaTest
//
//  Created by Artashes Yeghiazaryan on 7/3/19.
//  Copyright © 2019 Artashes Yeghiazaryan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PersonModel;

NS_ASSUME_NONNULL_BEGIN

@class ListTableViewCell;

@protocol ListTableViewCellDelegate <NSObject>

- (void) removeObjectFromData:(PersonModel *)detildeData;

@end

@interface ListTableViewCell : UITableViewCell

@property (weak, nonatomic) id<ListTableViewCellDelegate> delegate;

@property (strong, nonatomic) NSMutableArray *listArray;
@property (strong, nonatomic) NSMutableArray *schemeArray;

@property (strong, nonatomic) IBOutlet UILabel *birthdate;
@property (strong, nonatomic) IBOutlet UILabel *childrenCount;
@property (strong, nonatomic) IBOutlet UILabel *lastName;
@property (strong, nonatomic) IBOutlet UILabel *name;

- (IBAction)deleteAction:(id)sender;

- (void)setCellWithModel:(PersonModel *)personModel;

@end

NS_ASSUME_NONNULL_END
