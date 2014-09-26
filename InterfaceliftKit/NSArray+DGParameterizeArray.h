//
//  NSArray+DGParameterizeArray.h
//  IFLKit
//
//  Created by Freddy kelch on 9/26/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (DGParameterizeArray)
-(NSString*)parameterizeArray;
-(NSString*)parameterizeArrayValuesEnclosedInChar:(char)enclosed seperatedBy:(char)seperator;
@end
