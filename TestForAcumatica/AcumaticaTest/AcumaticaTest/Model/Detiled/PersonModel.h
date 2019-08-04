//
//  Detilde.h
//  AcumaticaTest
//
//  Created by Artashes Yeghiazaryan on 7/3/19.
//  Copyright © 2019 Artashes Yeghiazaryan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface PersonModel : NSObject

@property (strong, nonatomic) DataObject *birthdate;
@property (strong, nonatomic) DataObject *childrenCount;
@property (strong, nonatomic) DataObject *lastName;
@property (strong, nonatomic) DataObject *name;


- (instancetype)initWithData:(NSDictionary *)detaildeDictionary  withSchemeArray:(NSArray <NSDictionary *>*)schemeArray;

@end

NS_ASSUME_NONNULL_END
