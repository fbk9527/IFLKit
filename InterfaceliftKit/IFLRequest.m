//
//  IFLRequest.m
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/17/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "IFLRequest.h"
#import "IFLCameraLenseRequest.h"
#import "IFLSingleCommentRequest.h"
#import "IFLCommentsRequest.h"
#import "IFLFavoritesRequest.h"
#import "IFLSingleSubmissionRequest.h"
#import "IFLSubmissionsDownloadRequest.h"

@interface IFLRequest ()
@property(strong,nonatomic) NSMutableArray* operationDependencies;
@end

@implementation IFLRequest

NSString* kIFLRequestSortByDate      = @"date";
NSString* kIFLRequestSortById        = @"id";
NSString* kIFLRequestSortByFavorites = @"favorites";
NSString* kIFLRequestSortByDownloads = @"downloads";
NSString* kIFLRequestSortByComments  = @"comments";


#pragma mark - Generate URL Request
-(NSURL*)generateRequestUrlFromBase:(NSURL*)base
{
    // Programming Error
    // Throw exception
    if (!base)
        return nil;
    
    
    NSURLComponents* comp = [[NSURLComponents alloc]initWithURL:base resolvingAgainstBaseURL:YES];
    
    // Throw exception. Only support secure connections
    if (![[comp scheme]isEqualToString:@"https"])
        return nil;

    
    // Handle path construction
    NSString* path = [comp path];
    if ([path characterAtIndex:(([path length])-1)] == '/')
        path = [path substringWithRange:NSMakeRange(0, [path length]-1)];
    
    path = [path stringByAppendingPathComponent:[self command]];
    for (NSString* var in self.requiredParamaters)
    {
        id value = [self valueForKey:var];
        path = [path stringByAppendingPathComponent:[value description]];
    }
    comp.path = path;
    
    
    // Handle Query String
    NSMutableArray* queryItems = [NSMutableArray new];
    for (NSString* var in self.optionalParamaters)
    {
        id value = [self valueForKey:var];
        if (value)
            [queryItems addObject:[NSURLQueryItem queryItemWithName:var value:value]];
    }
    if (queryItems.count > 0)
        comp.queryItems = queryItems;
    
    
    return comp.URL;
}




#pragma mark - Abstract Methods

-(NSString*)command
{
    return nil; // None for generic superclass
}

-(NSArray*)requiredParamaters
{
    return nil; // None for generic superclass
}

-(NSArray*)optionalParamaters
{
    return nil; // None for generic superclass
}

-(void)processWithBaseUrl:(NSURL *)baseUrl
          withHTTPHeaders:(NSDictionary *)dict
{
    /// Place holders
    /// All subclass should call this method
    /// IFLRequest should be enclosed in an NSOperation & processed in a backgrond NSOperationQueue
    DLog(MAIN_THREAD_WARNING([[NSThread currentThread]isMainThread]));
}

-(void)processWithBaseUrl:(NSURL *)baseUrl
          withHTTPHeaders:(NSDictionary *)dict
      enclosedInOperation:(NSOperation *)operation
{
    /// Place holders
    /// All subclass should call this method
    /// IFLRequest should be enclosed in an NSOperation & processed in a backgrond NSOperationQueue
   DLog(MAIN_THREAD_WARNING([[NSThread currentThread]isMainThread]));
}
@end
