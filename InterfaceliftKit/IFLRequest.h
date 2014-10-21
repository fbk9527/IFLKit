// IFLKit - Objective-C wrapper to the Interfacelift.com API
// Copyright (C) 2014  Fred Kelch <fred.kelch@gmail.com>
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
/// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

#import <Foundation/Foundation.h>


typedef NS_OPTIONS(NSUInteger, IFLURLOption)
{
    IFLURLOptionTreatRequiredAsOptional = 1 << 0
};


typedef void (^IFLCallBack)(id obj, NSURLResponse* resp, NSError* error);



typedef void (^BytesWritten)(NSURLSession* session,
                             NSURLSessionDownloadTask* downloadTask,
                             int64_t bytesWritten,
                             int64_t totalBytesWritten,
                             int64_t totalExpectedBytesToWrite);


typedef void (^ResumeDownload)(NSURLSession* session,
                               NSURLSessionDownloadTask* downloadTask,
                               int64_t fileOffset,
                               int64_t expectedTotalBytes);



/*!
 * @class IFLRequest
 *
 * @discussion IFLRequest is the paretn class for all request managed by the IFLClient.
 */
@interface IFLRequest : NSOperation <NSURLSessionTaskDelegate, NSURLSessionDownloadDelegate>


/** Provides a list of the required parameters. Required and Optional parameters are used to construct the requesting URL.
 @warning This is an abstract method. Subclass should override this and <b>not</b> call super.
 */
-(NSArray*)requiredParameters;


/** Provides a list of the required parameters. Required and Optional parameters are used to construct the requesting URL.
 @warning This is an abstract method. Subclass should override this and <b>not</b> call super.
 */
-(NSArray*)optionalParameters;


/** The command string. Each IFLRequest has a unique command string which is used to construct the requesting URL
 @warning This is an abstract method. Subclasses should override this and <b>not</b> call super.
 */
-(NSString*)command;


/** Generate the request url
 */
-(NSURL*)generateRequestUrlWithBaseString:(NSString*)base;

/** Generate the request url
 */
-(NSURL*)generateRequestUrlWithBaseUrl:(NSURL*)base;





//==========================================================================================================================
// Options
//==========================================================================================================================

/*!
 * @brief The options to be set for the specific request.
 */
@property(assign,nonatomic) IFLURLOption options;




//==========================================================================================================================
// Blocks
//==========================================================================================================================

/*!
 * @brief Called when the IFLRequest completes successfully
 *
 *
 * @code [req setSuccessBlock:^(NSData* data,NSURLResponse* resp, NSURLError*error){
 *
 * }];
 * @endcode
 *
 */
@property(copy,nonatomic) IFLCallBack successBlock;


/*!
 * @brief Called when the IFLRequest failes to complete successfully
 *
 *
 * @code [req setSuccessBlock:^(NSData* data,NSURLResponse* resp, NSURLError*error){
 *
 * }];
 * @endcode
 *
 */
@property(copy,nonatomic) IFLCallBack failureBlock;


/*!
 * @brief Called throughout the download process, informing the block fo the download progress.
 *
 */
@property(assign,nonatomic) BytesWritten statusBlock;


/*!
 * @brief Called when the IFLRequest resumes downloading its current payload.
 *
 */
@property(assign,nonatomic) ResumeDownload resumeBlock;


/*!
 * @brief The NSURLSessionDownloadTask to be performed on the background thread
 *
 * @discussion A client programmer should not need to set this property unless
 * the client doesn't want the IFLClient creating/managing their network request to Interfacelift.
 * However, keep in mind that if you set this property, the client will not create one for you.
 * Additionally, you will need to set the authentication headers yourself since this is handled for 
 * you by the IFLClient.
 *
 */
@property(strong,nonatomic) NSURLSessionDownloadTask* networkTask;





//==========================================================================================================================
// Request Parameters
//==========================================================================================================================

/*!
 * @brief Inform the request how it should order the results.
 *
 * @discussion The sort_by property is not used by all IFLRequest.
 * Currently, V1 of the interfacelift API only accepts this on *IFLFavoriteRequest* and *IFLWallpapers* request.
 * This parameter can be set on any request, but its only utalized on those listed.
 */
@property(strong,nonatomic) NSString* sort_by;


/*!
 * @brief The ID of the requested object.
 */
@property(strong,nonatomic) NSNumber* iflId;


/*!
 * @brief Limit the number of results returned by the request.
 */
@property(strong,nonatomic) NSNumber* limit;


/*!
 * @brief The order in which results should be returned (ASC or DESC)
 */
@property(strong,nonatomic) NSString* sort_order;


/*!
 * @brief The offset of the results to start.
 */
@property(strong,nonatomic) NSNumber* iflstart;


/*!
 * @brief The ID of a specific user.
 */
@property(strong,nonatomic) NSNumber* user_id;


/*!
 * @brief The ID of a specific wallpaper.
 */
@property(strong,nonatomic) NSNumber* wallpaper_id;


/*!
 * @brief The string representation of the device screensize.
 */
@property(strong,nonatomic) NSString* resolution;


/*!
 * @brief The ID of a specific submission
 */
@property(strong,nonatomic) NSNumber* submission_id;


/*!
 * @brief The search string to search tags in the for the API.
 */
@property(strong,nonatomic) NSString* search;


/*!
 * @brief The type of tag.
 */
@property(strong,nonatomic) NSString* type;


/*!
 * @brief The ID of a specific tag.
 */
@property(strong,nonatomic) NSNumber* tag_id;


/*!
 * @brief The direction to sort
 */
@property(strong,nonatomic) NSString* direction;


/*!
 * @brief The UNIX timestamp of the wallpaper submission
 */
@property(strong,nonatomic) NSNumber* timestamp;


//==========================================================================================================================
// Class constents
//==========================================================================================================================

extern NSString* kIFLRequestSortByDate;
extern NSString* kIFLRequestSortById;
extern NSString* kIFLRequestSortByFavorites;
extern NSString* kIFLRequestSortByDownloads;
extern NSString* kIFLRequestSortByComments;
@end
