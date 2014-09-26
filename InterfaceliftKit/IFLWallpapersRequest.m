//
//  IFLWallpapersRequest.m
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/18/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "IFLWallpapersRequest.h"

@implementation IFLWallpapersRequest

#pragma mark - Abstract Method Implementation
-(NSArray*)requiredParameters
{
    return nil;
}

-(NSArray*)optionalParameters
{
    return @[@"limit", @"resolution", @"sort_by", @"sort_order", @"start", @"tag_id"];
}

-(NSString*)command
{
    return @"wallpapers";
}
@end
