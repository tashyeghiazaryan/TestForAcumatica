//
//  DataObject.h
//  AcumaticaTest
//
//  Created by Artashes Yeghiazaryan on 7/4/19.
//  Copyright © 2019 Artashes Yeghiazaryan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DataObject : NSObject

@property (assign, nonatomic) BOOL isRequired;
@property (strong, nonatomic) NSString *dataType;
@property (strong, nonatomic) NSString *value;
@property (strong, nonatomic) NSString *fieldName;
@property (strong, nonatomic) NSCharacterSet *characterSet;

@end

NS_ASSUME_NONNULL_END
