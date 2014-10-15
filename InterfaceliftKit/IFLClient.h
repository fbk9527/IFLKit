/// IFLKit - Objective-C wrapper to the Interfacelift.com API
/// Copyright (C) 2014  Fred Kelch <fred.kelch@gmail.com>
///
/// This program is free software: you can redistribute it and/or modify
/// it under the terms of the GNU General Public License as published by
/// the Free Software Foundation, either version 3 of the License, or
/// (at your option) any later version.
///
/// This program is distributed in the hope that it will be useful,
/// but WITHOUT ANY WARRANTY; without even the implied warranty of
/// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
/// GNU General Public License for more details.
///
/// You should have received a copy of the GNU General Public License
/// along with this program.  If not, see <http://www.gnu.org/licenses/>.

#import <Foundation/Foundation.h>
#import "IFLRequest.h"

@interface IFLClient : NSObject <NSURLSessionDownloadDelegate, NSURLSessionTaskDelegate, NSURLSessionDataDelegate>
-(instancetype)init;
-(instancetype)initWithPrivateKey:(NSString*)privateKey;


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


/** Request native resolution for device.
 */
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
