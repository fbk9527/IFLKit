//
//  IFLSubmissionDownload.m
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/20/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "IFLSubmissionDownload.h"

@implementation IFLSubmissionDownload
-(NSArray*)jsonKeys
{
    return @[@"submission_id",
             @"filename",
             @"timestamp_current",
             @"timestamp_expires",
             @"download_size_in_bytes",
             @"resolution",
             @"width",
             @"height",
             @"mime_type",
             @"download_url"];
}
@end
