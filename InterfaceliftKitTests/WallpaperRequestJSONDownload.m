//
//  WallpaperRequestJSONDownload.m
//  IFLKit
//
//  Created by Freddy kelch on 10/17/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "IFLClient.h"
#import "IFLWallpaperByTimestampRequest.h"

@interface WallpaperRequestJSONDownload : XCTestCase <NSURLSessionDownloadDelegate>
@property(strong,nonatomic) NSURLSession* session;
@property(strong,nonatomic) NSOperationQueue* operationQueue;
@property(strong,nonatomic) NSString* authenticationKey;
@property(strong,nonatomic) NSString* baseUrl;
@property(strong) NSMutableDictionary* semephoreDictionary;
@property(strong,nonatomic) NSMutableDictionary* operationDictionary;
@end

@implementation WallpaperRequestJSONDownload

- (void)setUp {
    [super setUp];

    // Get Authentication Key
    NSBundle* testBundle = [NSBundle bundleForClass:[self class]];
    NSString* keyPath    = [testBundle pathForResource:@"Mashape" ofType:@"key"];
    NSString* privateKey = [NSString stringWithContentsOfFile:keyPath encoding:NSUTF8StringEncoding error:nil];
    NSAssert(privateKey, @"Failed to load private key!");
    self.authenticationKey = [privateKey substringWithRange:NSMakeRange(0, privateKey.length -1)];
    
    // Session
    NSURLSessionConfiguration* config = [NSURLSessionConfiguration defaultSessionConfiguration];
    config.HTTPAdditionalHeaders = @{ @"X-Mashape-Key" : self.authenticationKey };
    self.session = [NSURLSession sessionWithConfiguration:config delegate:self delegateQueue:nil];
    
    // Operation Queue
    self.operationQueue = [[NSOperationQueue alloc]init];
    self.operationQueue.maxConcurrentOperationCount = 1;
    
    // Base URL
    self.baseUrl = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1";
    
    // Semephore Dictonary
    self.semephoreDictionary = [NSMutableDictionary new];
    self.operationDictionary = [NSMutableDictionary new];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testValidConnection
{
    dispatch_semaphore_t semephore = dispatch_semaphore_create(0);
    
    // Schedule
    IFLWallpaperByTimestampRequest* req = nil;
    
    
    req = [[IFLWallpaperByTimestampRequest alloc]initWithTimestamp:@100];
    req.limit = @10;
    req.iflstart = @0;
    req.resolution = [IFLClient nativeResolution];
    
    // Encapsolated request
    NSURLSessionDownloadTask* dT =[self.session downloadTaskWithURL:[req generateRequestUrlWithBaseString:self.baseUrl]];
    
    req.networkTask = dT;
    
    // Status block
    [req setStatusBlock:^( NSURLSession* session, NSURLSessionDownloadTask* downloadTask, int64_t bytesWritten, int64_t totalBytesWritten, int64_t totalExpectedBytesToWrite){
        NSLog(@"Bytes %lli of %lli",totalBytesWritten, totalExpectedBytesToWrite);
    }];
    
    
    // Success block
    [req setSuccessBlock:^(NSData* data, NSURLResponse* resp, NSError* error){
        NSLog(@"Success");
        XCTAssert(error==nil, @"Success block is only called when an error is not incurred");
        XCTAssert(true,@"Success Block Encountered");
        
        // release lock
        dispatch_semaphore_signal(semephore);
    }];
    
    // Failure block
    [req setFailureBlock:^(NSData* data, NSURLResponse* resp, NSError* error){
        NSLog(@"Failure");
        XCTAssert(false,@"Failure Block Returned");
        
        // Rlease Lock
        dispatch_semaphore_signal(semephore);
    }];
    
    
    // Add semephore
    [self.semephoreDictionary setObject:semephore forKey:@(dT.taskIdentifier)];
    [self.operationDictionary setObject:req forKey:@(dT.taskIdentifier)];
    [self.operationQueue addOperation:req];

    // Block Queue
    dispatch_semaphore_wait(semephore, DISPATCH_TIME_FOREVER);
}

#pragma mark - Download Delegate
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
{
    IFLWallpaperByTimestampRequest* req = [self.operationDictionary objectForKey:@(downloadTask.taskIdentifier)];
    if(req){
        if ([req respondsToSelector:@selector(URLSession:downloadTask:didFinishDownloadingToURL:)]) {
            [req URLSession:session downloadTask:downloadTask didFinishDownloadingToURL:location];
        }
    }
}

-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    IFLWallpaperByTimestampRequest* req = [self.operationDictionary objectForKey:@(downloadTask.taskIdentifier)];
    if(req){
        if ([req respondsToSelector:@selector(URLSession:downloadTask:didWriteData:totalBytesWritten:totalBytesExpectedToWrite:)]) {
            [req URLSession:session downloadTask:downloadTask didWriteData:bytesWritten totalBytesWritten:totalBytesWritten totalBytesExpectedToWrite:totalBytesExpectedToWrite];
        }
    }
}

-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes
{
    IFLWallpaperByTimestampRequest* req = [self.operationDictionary objectForKey:@(downloadTask.taskIdentifier)];
    if(req){
        if ([req respondsToSelector:@selector(URLSession:downloadTask:didResumeAtOffset:expectedTotalBytes:)]) {
            [req URLSession:session downloadTask:downloadTask didResumeAtOffset:fileOffset expectedTotalBytes:expectedTotalBytes];
        }
    }
}
@end
