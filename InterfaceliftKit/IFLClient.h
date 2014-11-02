/*
  IFLKit - Objective-C wrapper to the Interfacelift.com API
  Copyright (C) 2014  Fred Kelch <fred.kelch@gmail.com>

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

#import <Foundation/Foundation.h>
#import "IFLRequest.h"

@interface IFLClient : NSObject <NSURLSessionDownloadDelegate>

//==========================================================================================================================
// Object Initalization
//==========================================================================================================================

/*!
 * @brief Basic initalization that leaves the object w/o a validation key.
 */
-(instancetype)init;

/*!
 * @brief Initalize the client with an authentication key
 *
 * @var privateKey
 * A private key used to authenticate request with the provider
 */
-(instancetype)initWithPrivateKey:(NSString*)privateKey;


//==========================================================================================================================
// Manage IFLRequest
//==========================================================================================================================

/*!
 * @brief Process the provided IFLrequest
 *
 * @var request
 * The request to be processed
 */
-(void)processRequest:(IFLRequest*)request;



//==========================================================================================================================
// Manage IFLClient
//==========================================================================================================================

/*! 
 * @brief Request the shared client
 *
 * @code
 * IFLClient* client = [[IFLClient alloc]initWithPrivateKey:@"private"];
 * [client registerAsSharedClient]
 * @endcode
 *
 * @return returns the IFLClient if one has been registered, otherwise returns nil.
 */
+(IFLClient*)sharedClient;


/*!
 * @brief Register the receiver as the sharedClient.
 */
-(void)registerAsSharedClient;


//==========================================================================================================================
// Mashape Authentication Key
//==========================================================================================================================

/*!
 * @brief Returns a copy of the private key.
 */
-(void)setPrivateKey:(NSString*)privateKey;

/*!
 * @brief Returns a copy of the private key.
 */
-(NSString*)privateKey;

/** Request native resolution for device.
 */
#warning deprecated
+(NSString*)nativeResolution;


/** The base API URL.
 */
#warning deprecated
-(NSString*)baseURL;





@end


/*
 Class variable.
 */
extern IFLClient* sharedClient;
