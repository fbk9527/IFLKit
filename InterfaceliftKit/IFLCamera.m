//
//  IFLCamera.m
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/20/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "IFLCamera.h"

@implementation IFLCamera

-(NSArray*)jsonKeys
{
    return @[@"id",
             @"brand",
             @"model",
             @"mount",
             @"format",
             @"date_introduced",
             @"url_amazon"];
}
@end
