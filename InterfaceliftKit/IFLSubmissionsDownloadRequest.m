//
//  IFLSubmissionsDownloadRequest.m
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/18/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "IFLSubmissionsDownloadRequest.h"

@implementation IFLSubmissionsDownloadRequest

#pragma mark - Initalizatoin
-(id)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}

-(id)initWithSubmissionId:(NSNumber *)submissionId
{
    self = [super init];
    if (self)
    {
        super.submission_id = submissionId;
    }
    return self;
}

#pragma mark - Abstract Methods
-(NSArray*)requiredParameters
{
    return @[@"submission_id"];
}

-(NSArray*)optionalParameters
{
    return nil;
}

-(NSString*)command
{
    return @"submission_download";
}
@end
