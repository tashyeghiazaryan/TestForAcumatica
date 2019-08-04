//
//  Detilde.m
//  AcumaticaTest
//
//  Created by Artashes Yeghiazaryan on 7/3/19.
//  Copyright © 2019 Artashes Yeghiazaryan. All rights reserved.
//

#import "PersonModel.h"

@implementation PersonModel

- (instancetype)initWithData:(NSDictionary *)detaildeDictionary  withSchemeArray:(NSArray <NSDictionary *>*)schemeArray
{
    self = [super init];
    if (self)
    {
        self.birthdate = [DataObject new];
        self.childrenCount = [DataObject new];
        self.lastName = [DataObject new];
        self.name = [DataObject new];
        
        self.birthdate.value = [detaildeDictionary objectForKey:@"birthdate"];
        self.childrenCount.value = [detaildeDictionary objectForKey:@"childrenCount"];
        self.lastName.value = [detaildeDictionary objectForKey:@"lastName"];
        self.name.value = [detaildeDictionary objectForKey:@"name"];
        
        
        for (NSDictionary *scheme in schemeArray)
        {
            NSString *idScheme = scheme[@"id"];
            
            if ([idScheme isEqualToString:@"lastName"])
            {
                self.lastName.isRequired = [scheme[@"required"] boolValue];
                self.lastName.dataType = scheme[@"type"];
                self.lastName.fieldName = scheme[@"title"];
                self.lastName.characterSet = [self getCharactersFromDataType:scheme[@"type"]];
            }
            else if ([idScheme isEqualToString:@"childrenCount"])
            {
                self.childrenCount.isRequired = [scheme[@"required"] boolValue];
                self.childrenCount.dataType = scheme[@"type"];
                self.childrenCount.fieldName = scheme[@"title"];
                self.childrenCount.characterSet = [self getCharactersFromDataType:scheme[@"type"]];
            }
            else if ([idScheme isEqualToString:@"name"])
            {
                self.name.isRequired = [scheme[@"required"] boolValue];
                self.name.dataType = scheme[@"type"];
                self.name.fieldName = scheme[@"title"];
                self.name.characterSet = [self getCharactersFromDataType:scheme[@"type"]];
            }
            else if ([idScheme isEqualToString:@"birthdate"])
            {
                self.birthdate.isRequired = [scheme[@"required"] boolValue];
                self.birthdate.dataType = scheme[@"type"];
                self.birthdate.fieldName = scheme[@"title"];
                self.birthdate.characterSet = [self getCharactersFromDataType:scheme[@"type"]];
            }
        }
    }
    return self;
}

- (NSCharacterSet *)getCharactersFromDataType:(NSString *)dataType
{
    if ([dataType isEqualToString:@"date"])
    {
        return [NSCharacterSet characterSetWithCharactersInString:@"0123456789."];
    }
    else if ([dataType isEqualToString:@"number"])
    {
        return [NSCharacterSet decimalDigitCharacterSet];
    }
    else if ([dataType isEqualToString:@"string"])
    {
        return [NSCharacterSet letterCharacterSet];
    }
    return [NSCharacterSet letterCharacterSet];
}

@end
