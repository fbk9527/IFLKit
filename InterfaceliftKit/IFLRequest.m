//
//  IFLRequest.m
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/17/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "IFLRequest.h"

#import "IFLTagRequest.h"

@implementation IFLRequest

NSString* kIFLRequestSortByDate      = @"date";
NSString* kIFLRequestSortById        = @"id";
NSString* kIFLRequestSortByFavorites = @"favorites";
NSString* kIFLRequestSortByDownloads = @"downloads";
NSString* kIFLRequestSortByComments  = @"comments";




-(void)processWithBaseUrl:(NSURL *)baseUrl withHTTPHeaders:(NSDictionary *)dict
{
    if ([[NSThread currentThread]isMainThread]) {
        NSLog(@"WARNING!!! Just because you 'can' do something does not mean you should. All AFLRequest should be handled through the IFLClient which processes them on a background thread.");
    }
}

-(NSString*)command
{
    return @"";
}

#pragma mark - Paramater Handling
-(NSArray*)requiredParamaters
{
    return nil;
}

-(NSArray*)optionalParamaters
{
    return nil;
}

#pragma mark - Intantiation Helpers
+(instancetype)tagRequestWithId:(NSInteger)tagId completionBlock:(void (^)(NSArray *, NSURLResponse *, NSError *))completion
{
    IFLTagRequest* req = [[IFLTagRequest alloc]init];
    req.requestCompletion = completion;
    return req;
}
@end
