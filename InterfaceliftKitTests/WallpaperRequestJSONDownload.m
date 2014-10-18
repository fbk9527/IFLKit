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

@interface WallpaperRequestJSONDownload : XCTestCase
@property(strong,nonatomic) NSURLSession* session;
@property(strong,nonatomic) NSOperationQueue* operationQueue;
@property(strong,nonatomic) NSString* authenticationKey;
@property(strong,nonatomic) NSString* baseUrl;
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
    
    // Build request
    
    // Encapsolated request
    NSURLSessionDownloadTask* dT =
    [self.session downloadTaskWithURL:[req generateRequestUrlWithBaseString:self.baseUrl]
                    completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        
                        // Print out data
                        NSLog(@"Location of file: %@",location.path);
                        NSLog(@"Response: %@",[response description]);
                        NSLog(@"Error: %@",[error description]);
                        
                        // Print out file if we have it
                        if(location)
                        {
                            NSString* respText = [NSString stringWithContentsOfURL:location encoding:NSUTF8StringEncoding error:nil];
                            NSLog(@"%@",respText);
                        }
                        
                        // Release lock
                        dispatch_semaphore_signal(semephore);
    }];
    req.networkTask = dT;
    [self.operationQueue addOperation:req];

    // Block Queue
    dispatch_semaphore_wait(semephore, DISPATCH_TIME_FOREVER);
    XCTAssert(true, @"Returned back!!");
}
@end
