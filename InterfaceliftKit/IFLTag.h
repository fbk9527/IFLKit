//
//  IFLTag.h
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/20/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IFLModel.h"

@interface IFLTag : IFLModel
@property(strong,nonatomic) NSNumber* iflId;
@property(strong,nonatomic) NSString* tag_name;
@property(strong,nonatomic) NSString* type;
@property(strong,nonatomic) NSArray* related_searches;
@end
