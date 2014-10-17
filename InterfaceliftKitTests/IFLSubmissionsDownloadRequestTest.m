//
//  IFLSubmissionsDownloadRequestTest.m
//  IFLKit
//
//  Created by Freddy kelch on 9/24/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "IFLSubmissionsDownloadRequest.h"

@interface IFLSubmissionsDownloadRequestTest : XCTestCase
@property(strong,nonatomic) NSNumber* submission_id;
@property(strong,nonatomic) NSString* base_url;
@end

@implementation IFLSubmissionsDownloadRequestTest

- (void)setUp {
    [super setUp];
    self.submission_id = @87479;
    self.base_url = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/";
    
}

- (void)tearDown {
    [super tearDown];
}

-(void)testCommandRequestURL_OnlyRequired
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/submission_download/87479/";
    IFLSubmissionsDownloadRequest* req = [[IFLSubmissionsDownloadRequest alloc]initWithSubmissionId:self.submission_id];
    NSURL* url = [req generateRequestUrlWithBaseString:self.base_url];
    XCTAssert([expecting isEqualToString:[url description]],@"The URL is incorrectly formatted! %@",[url description]);
}

@end
