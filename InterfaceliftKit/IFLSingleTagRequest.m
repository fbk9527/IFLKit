//
//  IFLSingleTagRequest.m
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/18/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "IFLSingleTagRequest.h"

@implementation IFLSingleTagRequest

#pragma mark - Construction
-(id)init
{
    self = [super init];
    if (self) {
        [super setIflId:@-1];
    }
    return self;
}

-(id)initWithId:(NSNumber *)iflId
{
    self = [super init];
    if (self) {
        [super setIflId:iflId];
    }
    return self;
}


#pragma mark - Override methods
-(NSArray*)requiredParameters
{
    return @[@"iflId"];
}

-(NSArray*)optionalParameters
{
    return nil;
}

-(NSString*)command
{
    return @"tag";
}

-(void)processWithBaseUrl:(NSURL *)baseUrl withHTTPHeaders:(NSDictionary *)dict enclosedInOperation:(NSOperation *)operation
{
    // Perform Thread sanity check
    [super processWithBaseUrl:baseUrl withHTTPHeaders:dict enclosedInOperation:operation];
    
    // Generate Command
    NSURL* urlCommand = [self generateRequestUrlFromBase:baseUrl withOptions:0];
    NSMutableURLRequest* urlRequest = [[NSMutableURLRequest alloc]initWithURL:urlCommand];
    
    // Have we been cancelled?
    // Check before we send out the expensive network request
    if (operation && [operation isCancelled])
        return;
    
    NSError* error = nil;
    NSURLResponse* response = nil;
    NSData* payload = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
    
    // Have we been cancelled?
    // Check before we parse a rather lengthy request
    if (operation && [operation isCancelled])
        return;
    
    // Module layer seperated
    // Easier to unit test
    
    if (payload && !error) {
        if (self.successBlock)
            self.successBlock(nil,nil,nil);
    } else {
        if (self.failureBlock)
            self.failureBlock(nil,nil,nil);
    }
    
}

-(void)processWithBaseUrl:(NSURL *)baseUrl withHTTPHeaders:(NSDictionary *)dict
{
    [self processWithBaseUrl:baseUrl withHTTPHeaders:dict enclosedInOperation:nil];
}
@end
