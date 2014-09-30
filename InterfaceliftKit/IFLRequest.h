//
//  IFLRequest.h
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/17/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import <Foundation/Foundation.h>

#ifdef DEBUG
#define MAIN_THREAD_WARNING(X) (X ? @"IFLRequest should not be called on the main thread!" : @"")
#define DLog(X) NSLog(X)
#else
#define MAIN_THREAD_WARNING(X) ((void)0)
#define DLog(X) ((void)0)
#endif

typedef NS_ENUM(NSInteger, IFLRequestTagType){
    IFLRequestTagTypeColor,
    IFLRequestTagTypeScene,
    IFLRequestTagTypeLocation,
    IFLRequestTagTypeEvent,
    IFLRequestTagTypeSubject,
    IFLRequestTagTypeEquipment,
    IFLRequestTagTypeMedium
};

typedef NS_OPTIONS(NSUInteger, IFLURLOption)
{
    IFLURLOptionTreatRequiredAsOptional = 1 << 0
};

typedef void (^IFLCallBack)(id obj, NSHTTPURLResponse* resp, NSError* error);



/** The @code IFLRequest @endcode class is an abstract class you subclass to encapsulate code and data associated with a request.
    Subclass should override the following methods
 */
@interface IFLRequest : NSOperation

/** Constructs the request URL used to sends commands to the IFL REST API.
 @pre The parameter <b>baseUrl</b> should be set.
 */
-(NSURL*)generateRequestURL;


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


/** The main operation to be performed.
 @warning Subclasses that override the @code main @endcode method should <b>not</b> call the superclass implementation.
 This method is fully implemented to construct the request URL and process the request on the calling thread.
 */
-(void)main;
-(void)start;


/** A base url conforms the Interfacelift command format.
 @code
 https://
 @endcode
 The base URL should always end with the API version number.
*/
@property(strong,nonatomic) NSString* baseUrl;



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


@property(strong,nonatomic) NSDictionary* HTTPHeaders;

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
