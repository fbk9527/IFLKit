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
-(NSURL*)buildCommandWithOptions:(IFLURLOption)options error:(NSError**)error
{
    // Programming Error
    // Throw exception
    if (!self.baseUrl)
        return nil;
    
    
    NSURLComponents* comp = [[NSURLComponents alloc]initWithURL:[NSURL URLWithString:self.baseUrl]
                                        resolvingAgainstBaseURL:YES];
    
    // Throw exception. Only support secure connections
    if (![[comp scheme]isEqualToString:@"https"])
        return nil;

    
    // Handle path construction
    NSString* path = [comp path];
    
    // Handle Query String
    NSMutableArray* queryItems = [NSMutableArray new];
    
    if ([path characterAtIndex:(([path length])-1)] == '/')
        path = [path substringWithRange:NSMakeRange(0, [path length]-1)];
    
    path = [path stringByAppendingPathComponent:[self command]];
    for (NSString* var in self.requiredParameters)
    {
        id value = [self valueForKey:var];
        
        // This is a programming error
        // The programmer didn't provide the required parameter
        if (!value)
        {
            NSException* exception = [NSException exceptionWithName:@"Missing Required Parameter"
                                                             reason:[NSString stringWithFormat:@"Missing: %@",var]
                                                           userInfo:nil];
            @throw exception;
        }
        
        if (options & IFLURLOptionTreatRequiredAsOptional)
        {
            [queryItems addObject:[NSURLQueryItem queryItemWithName:var value:value]];
        }
        else
        {
            path = [path stringByAppendingPathComponent:[value description]];
        }
    }
    comp.path = path;
    
    
    
    for (NSString* var in self.optionalParameters)
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

-(NSArray*)requiredParameters
{
    return nil; // None for generic superclass
}

-(NSArray*)optionalParameters
{
    return nil; // None for generic superclass
}

-(void)processWithBaseUrl:(NSURL *)baseUrl
          withHTTPHeaders:(NSDictionary *)dict
{
    /// Place holders
    /// All subclass should call this method
    /// IFLRequest should be enclosed in an NSOperation & processed in a backgrond thread
    DLog(MAIN_THREAD_WARNING([[NSThread currentThread]isMainThread]));
}

-(void)processWithBaseUrl:(NSURL *)baseUrl
          withHTTPHeaders:(NSDictionary *)dict
      enclosedInOperation:(NSOperation *)operation
{
    /// Place holders
    /// All subclass should call this method
    /// IFLRequest should be enclosed in an NSOperation & processed in a backgrond thread
   DLog(MAIN_THREAD_WARNING([[NSThread currentThread]isMainThread]));
}
@end
