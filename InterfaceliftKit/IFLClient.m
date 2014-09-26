//
//  IFLClient.m
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/18/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "IFLClient.h"

IFLClient* sharedClient = nil;

@interface IFLClient ()
@end

@implementation IFLClient

#pragma mark - Initalization
-(id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(id)initWithPrivateKey:(NSString *)privateKey
{
    self = [super init];
    if (self)
    {
        if(privateKey)
            _HTTPAuthenticationHeader = @{ @"X-Mashape-Key" : privateKey };
    }
    return self;
}

#pragma mark - Lazy Load
-(NSOperationQueue*)operationQueue
{
    if (!_operationQueue) {
        _operationQueue = [[NSOperationQueue alloc]init];
        _operationQueue.name = @"IFLRequest Queue";
        _operationQueue.maxConcurrentOperationCount = 2;
    }
    return _operationQueue;
}


#pragma mark - Handle Request
-(void)processRequest:(IFLRequest *)request
{
    
}

-(NSURL*)baseURL
{
    return [[NSURL alloc]initWithString:@"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1"];
}

#pragma mark - Shared Client
-(void)registerAsSharedClient
{
    sharedClient = self;
}

+(IFLClient*)sharedClient
{
    return sharedClient;
}
@end
