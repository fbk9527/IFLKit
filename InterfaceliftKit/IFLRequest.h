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


typedef NS_OPTIONS(NSUInteger, IFLURLOption)
{
    IFLURLOptionTreatRequiredAsOptional = 1 << 0
};

typedef void (^IFLCallBack)(id obj, NSHTTPURLResponse* resp, NSError* error);



/** The @code IFLRequest @endcode class is an abstract class you subclass to encapsulate code and data associated with a request.
    Subclass should override the following methods
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


/** The completion blocked that is called if the request was successfull.
 @warning Be mindful of retain cycles if your enclosing queue is strong referenced!
 */
@property(copy,nonatomic) IFLCallBack successBlock;


/** The completion blocked that is called if the request was failed.
 @warning Be mindful of retain cycles if your enclosing queue is strong referenced!
 */
@property(copy,nonatomic) IFLCallBack failureBlock;


/** Control the construction of the request URL.
 */
@property(assign,nonatomic) IFLURLOption options;


/**
 */
@property(strong,nonatomic) NSURLSessionDownloadTask* networkTask;


extern NSString* kIFLRequestSortByDate;
extern NSString* kIFLRequestSortById;
extern NSString* kIFLRequestSortByFavorites;
extern NSString* kIFLRequestSortByDownloads;
extern NSString* kIFLRequestSortByComments;
@property(strong,nonatomic) NSString* sort_by;
@property(strong,nonatomic) NSNumber* iflId;
@property(strong,nonatomic) NSNumber* limit;
@property(strong,nonatomic) NSString* sort_order;
@property(strong,nonatomic) NSNumber* iflstart;
@property(strong,nonatomic) NSNumber* user_id;
@property(strong,nonatomic) NSNumber* wallpaper_id;
@property(strong,nonatomic) NSString* resolution;
@property(strong,nonatomic) NSNumber* submission_id;
@property(strong,nonatomic) NSString* search;
@property(strong,nonatomic) NSString* type;
@property(strong,nonatomic) NSNumber* tag_id;
@property(strong,nonatomic) NSString* direction;
@property(strong,nonatomic) NSNumber* timestamp;
@end
