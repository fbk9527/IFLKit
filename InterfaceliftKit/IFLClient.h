//
//  IFLClient.h
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/18/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IFLRequest.h"

@interface IFLClient : NSObject
-(id)init;
-(id)initWithPrivateKey:(NSString*)privateKey;


/** Provding the client a request will process it on a background thread.
 *  Both the success& failure blocks are called on the background thread.
 */
-(void)processRequest:(IFLRequest*)request;


/** The base API URL.
 */
-(NSString*)baseURL;


/** Register the current instance as the shared client. Doing so will reduce the need of passing
 around reference to the IFLClient.
 */
-(void)registerAsSharedClient;


/** Request the sharedClient. Note that a client is not created
    automatically. An inital client must be created and registered
    before a sharedClient will return a non-nil value.
 @code
 IFLClient* client = [[IFLClient alloc]initWithPrivateKey:@"private"];
 [client registerAsSharedClient]
 @endcode
 
 @return nil if no client has been registered as the shared client, otherwise this method will return an IFLClient.
 */
+(IFLClient*)sharedClient;


+(NSString*)nativeResolution;

/* 
 Handles concurent operations.
*/
@property(strong,nonatomic) NSOperationQueue* operationQueue;



/**
 */
@property(strong,nonatomic,readonly) NSDictionary* HTTPAuthenticationHeader;
@end


/*
 Class variable.
 */
extern IFLClient* sharedClient;
