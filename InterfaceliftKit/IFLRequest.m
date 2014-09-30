//
//  IFLRequest.m
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/17/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "IFLRequest.h"
#import "IFLCameraLensRequest.h"
#import "IFLSingleCommentRequest.h"
#import "IFLCommentsRequest.h"
#import "IFLFavoritesRequest.h"
#import "IFLSingleSubmissionRequest.h"
#import "IFLSubmissionsDownloadRequest.h"
#import "NSArray+DGParameterizeArray.h"

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
-(NSURL*)generateRequestURL
{

    NSURLComponents* comp = [[NSURLComponents alloc]initWithURL:[NSURL URLWithString:self.baseUrl]
                                        resolvingAgainstBaseURL:YES];
    
    // Throw exception. Only support secure connections
    if (![[comp scheme]isEqualToString:@"https"])
        return nil;

    
    // Handle path construction
    NSString* path = [comp path];
    NSMutableArray* queryItems = [NSMutableArray new];
    
    if ([path characterAtIndex:(([path length])-1)] == '/')
        path = [path substringWithRange:NSMakeRange(0, [path length]-1)];
    
    path = [path stringByAppendingPathComponent:[self command]];
    for (NSString* var in self.requiredParameters)
    {
        id value = [self valueForKey:var];
        
        // Special case for resolution
        //if ([var isEqualToString:@"resolution"] && [value isKindOfClass:[NSString class]])
        //    value = [[NSString alloc]initWithFormat:@"'%@'",value];
        
    
        
        // This is a programming error
        // The programmer didn't provide the required parameter
        if (!value)
        {
            NSException* exception = [NSException exceptionWithName:@"Missing Required Parameter"
                                                             reason:[NSString stringWithFormat:@"Missing: %@",var]
                                                           userInfo:nil];
            @throw exception;
        }
        
        if (self.options & IFLURLOptionTreatRequiredAsOptional)
        {
            [queryItems addObject:[NSURLQueryItem queryItemWithName:var value:[value description]]];
        }
        else
        {
            path = [path stringByAppendingPathComponent:[value description]];
        }
    }
    
    // Make sure the last required param ends with a forward slash
    if (path && path.length > 0 && [path characterAtIndex:path.length-1] != '/')
        path = [[NSString alloc]initWithFormat:@"%@/",path];
    
    comp.path = path;
    
    
    
    for (NSString* var in self.optionalParameters)
    {
        id value = [self valueForKey:var];
        if (value)
            [queryItems addObject:[NSURLQueryItem queryItemWithName:var value:[value description]]];
    }
    
    
    if (queryItems.count > 0)
        comp.queryItems = queryItems;
    
    return comp.URL;
}


-(void)start
{
    [self main];
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

#pragma mark - NSOperation Overloaded Methods
-(void)main
{
    NSLog(@"Started...");
    // Construct requested URL
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc]initWithURL:[self generateRequestURL]];
    
    // Add Authentication Headers
    for (NSString* httpHeaderKey in self.HTTPHeaders.allKeys)
    {
        [request addValue:self.HTTPHeaders[httpHeaderKey] forHTTPHeaderField:httpHeaderKey];
    }
    
    // OBJects for callback
    NSError* error = nil;
    NSHTTPURLResponse* response = nil;
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    if (!error && request && response.statusCode == 200)
    {
        id json = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        if (self.successBlock)
        {
            self.successBlock(json,response,error);
        }
    }
    else
    {
        if (self.failureBlock)
        {
            self.failureBlock(nil,response,error);
        }
    }
}

#pragma mark - Description
-(NSString*)description
{
    NSString* descString = [super description];
    descString = [descString stringByAppendingFormat:@"Command: %@", self.command];
    descString = [descString stringByAppendingFormat:@"Required Params: %@",self.requiredParameters.description];
    descString = [descString stringByAppendingFormat:@"Optional Params: %@",self.optionalParameters.description];
    descString = [descString stringByAppendingFormat:@"RequestURL: %@", [self generateRequestURL]];
    return descString;
}

-(NSString*)name
{
    return [self command];
}
@end
