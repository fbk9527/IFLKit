//
//  IFLWallpaperByTimestampRequest.m
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/18/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "IFLWallpaperByTimestampRequest.h"

@implementation IFLWallpaperByTimestampRequest


#pragma mark - Comman Execution
-(void)processWithBaseUrl:(NSURL*)baseUrl withHTTPHeaders:(NSDictionary*)dict
{
    [self processWithBaseUrl:baseUrl withHTTPHeaders:dict enclosedInOperation:nil];
}

-(void)processWithBaseUrl:(NSURL *)baseUrl withHTTPHeaders:(NSDictionary *)dict enclosedInOperation:(NSOperation*)operation
{
    // Thread sanity check
    [super processWithBaseUrl:baseUrl withHTTPHeaders:dict enclosedInOperation:operation];
    
    // Construct request
    NSURL* reqUrl = [super generateRequestUrlFromBase:baseUrl withOptions:IFLURLOptionTreatRequiredAsOptional];
    NSMutableURLRequest* request = [NSMutableURLRequest requestWithURL:reqUrl];
    for (NSString* key in dict.allKeys)
    {
        [request addValue:dict[key] forHTTPHeaderField:key];
    }
    
    // Process Request
    NSError* respError = nil;
    NSURLResponse* response = nil;
    NSData* payLoad = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&respError];
    
    if(payLoad && !respError)
    {
        if (self.successBlock)
        {
            id json = [NSJSONSerialization JSONObjectWithData:payLoad options:0 error:nil];
            self.successBlock(json,response,respError);
        }
    }
    else
    {
        if (self.failureBlock)
        {
            self.failureBlock(payLoad, response, respError);
        }
    }
}



#pragma mark - Mark Command Construction
-(NSArray*)requiredParameters
{
    return @[@"timestamp"];
}

-(NSArray*)optionalParameters
{
    return @[@"direction", @"limit", @"resolution", @"tag_id"];
}

-(NSString*)command
{
    return @"wallpapersByTimestamp";
}

@end
