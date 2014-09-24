//
//  IFLSingleTagRequest.h
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/18/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "IFLRequest.h"

@interface IFLSingleTagRequest : IFLRequest

-(id)init;
-(id)initWithId:(NSNumber*)iflId;

-(NSArray*)requiredParameters;
-(NSArray*)optionalParameters;
-(NSString*)command;
@end
