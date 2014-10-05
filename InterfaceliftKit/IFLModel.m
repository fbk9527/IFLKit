//
//  IFLKit - Objective-C wrapper to the Interfacelift.com API
//  Copyright (C) 2014  Fred Kelch <fred.kelch@gmail.com>
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
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
                         @"description"                 : @"ifldescription",
                         @"start"                       : @"iflstart"
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
