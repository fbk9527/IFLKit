//
//  IFLTag.m
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/20/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "IFLTag.h"

@implementation IFLTag
-(NSArray*)jsonKeys
{
    return @[@"id",
             @"tag_name",
             @"type",
             @"related_searches"];
}
@end
