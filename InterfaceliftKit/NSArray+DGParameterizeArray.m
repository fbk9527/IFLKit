//
//  NSArray+DGParameterizeArray.m
//  IFLKit
//
//  Created by Freddy kelch on 9/26/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "NSArray+DGParameterizeArray.h"

@implementation NSArray (DGParameterizeArray)

-(NSString*)parameterizeArray
{
    return [self parameterizeArrayValuesEnclosedInChar:'\'' seperatedBy:','];
}

-(NSString*)parameterizeArrayValuesEnclosedInChar:(char)enclosed seperatedBy:(char)seperator
{
    if (self.count == 0)
    {
        return @"";
    }
    
    
    NSString* parameterizedString = @"";
    NSEnumerator* enumerator = [self objectEnumerator];
    
    id item = [enumerator nextObject];
    
    while (item)
    {
        parameterizedString = [parameterizedString stringByAppendingFormat:@"%c%@%c",enclosed,[item description],enclosed];
        
        item = [enumerator nextObject];
        if (item)
            parameterizedString = [parameterizedString stringByAppendingFormat:@"%c",seperator];
    }
    return parameterizedString;
}
@end
