//
//  IFLModel.m
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/20/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "IFLModel.h"

@implementation IFLModel


#pragma mark - Parse Object

-(void)populateFromJSONObject:(NSDictionary *)dict
{
    NSArray* jsonKeys = [self jsonKeys];
    NSDictionary* renamed = [IFLModel renamedKeys];
    
    for (NSString* key in jsonKeys)
    {
        NSString* renamedKey = renamed[key];
        if (!renamedKey)
        {
            [self setValue:dict[key] forKey:key];
        }
        else
        {
            [self setValue:dict[key] forKey:renamedKey];
        }
    }
}

#pragma mark - Renamed keys
+(NSDictionary*)renamedKeys
{
    static NSDictionary* renamedKeys = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        renamedKeys = @{ @"id"                          : @"iflId",
                         @"preview_width@2x"            : @"preview_2x_width",
                         @"preview_height@2x"           : @"preview_2x_height",
                         @"preview_size_in_bytes@2x"    : @"preview_2x_size_in_bytes",
                         @"preview_url@2x"              : @"preview_2x_url",
                         @"description"                 : @"ifldescription"
                        };
    });
    return renamedKeys;
}

#pragma mark - Abstract Methods
-(NSArray*)jsonKeys
{
    return nil;
}

#pragma mark - Description
-(NSString*)description
{
    NSArray* array = [self jsonKeys];
    NSString* descString = [super description];
    NSDictionary* renamed = [IFLModel renamedKeys];
    
    for (NSString* key in array)
    {
        NSString* renamedKey = renamed[key];
        if(renamedKey)
        {
            descString = [descString stringByAppendingFormat:@"Key: %@\t Value:%@\t",renamedKey,[self valueForKey:renamedKey]];
        }
        else
        {
           descString = [descString stringByAppendingFormat:@"Key: %@\t Value:%@\t",key,[self valueForKey:key]];
        }
    }
    return descString;
}
@end
