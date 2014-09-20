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

@interface IFLRequest : NSObject

typedef NS_ENUM(NSInteger, IFLRequestTagType){
    IFLRequestTagTypeColor,
    IFLRequestTagTypeScene,
    IFLRequestTagTypeLocation,
    IFLRequestTagTypeEvent,
    IFLRequestTagTypeSubject,
    IFLRequestTagTypeEquipment,
    IFLRequestTagTypeMedium
};

typedef void (^IFLRequestCallback)(NSArray* obj, NSURLResponse* resp, NSError* error);

// Completion block


@property(strong,nonatomic) NSArray* sort_by;
@property(strong,nonatomic) NSNumber* iflId;
@property(strong,nonatomic) NSNumber* limit;
@property(strong,nonatomic) NSString* sort_order;
@property(strong,nonatomic) NSNumber* start;
@property(strong,nonatomic) NSNumber* user_id;
@property(strong,nonatomic) NSNumber* wallpaper_id;
@property(strong,nonatomic) NSString* resolution;
@property(strong,nonatomic) NSNumber* submission_id;
@property(strong,nonatomic) NSString* search;
@property(strong,nonatomic) NSString* type;
@property(strong,nonatomic) NSNumber* tag_id;
@property(strong,nonatomic) NSString* direction;
@property(strong,nonatomic) NSNumber* timestamp;
@property(copy,nonatomic) IFLRequestCallback successCallBack;
@property(copy,nonatomic) IFLRequestCallback failureCallBack;

extern NSString* kIFLRequestSortByDate;
extern NSString* kIFLRequestSortById;
extern NSString* kIFLRequestSortByFavorites;
extern NSString* kIFLRequestSortByDownloads;
extern NSString* kIFLRequestSortByComments;


@property(strong,nonatomic) NSArray* requiredParamaters;


// Parent performs nothing
-(void)processWithBaseUrl:(NSURL*)baseUrl
          withHTTPHeaders:(NSDictionary*)dict;

-(void)processWithBaseUrl:(NSURL *)baseUrl
          withHTTPHeaders:(NSDictionary *)dict
      enclosedInOperation:(NSOperation*)operation;



// Required & Optional
-(NSArray*)requiredParamaters;
-(NSArray*)optionalParamaters;

// The command
-(NSString*)command;

// Command specific
-(NSURL*)generateRequestUrlFromBase:(NSURL*)base;
@end
