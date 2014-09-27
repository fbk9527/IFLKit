//
//  IFLLens.m
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/20/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "IFLLens.h"

@implementation IFLLens

-(NSArray*)jsonKeys
{
    return @[@"id",
             @"brand",
             @"model",
             @"mount",
             @"max_format_size",
             @"focal_length",
             @"focal_length_tele",
             @"max_aperture",
             @"max_aperture_tele",
             @"max_magnification",
             @"min_focus",
             @"filter_thread",
             @"reach",
             @"date_introduced",
             @"url_amazon"];
}
@end
