//
//  IFLSingleSubmissionRequestTest.m
//  IFLKit
//
//  Created by Freddy kelch on 9/24/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "IFLSingleSubmissionRequest.h"

@interface IFLSingleSubmissionRequestTest : XCTestCase
@property(strong,nonatomic) NSNumber* iflId;
@property(strong,nonatomic) NSString* base_url;
@end

@implementation IFLSingleSubmissionRequestTest

- (void)setUp {
    [super setUp];
    self.iflId = @87407;
    self.base_url = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/";
}

- (void)tearDown {
    [super tearDown];
}

-(void)testCommandRequestURL_OnlyRequired
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/submission/87407/";
    IFLSingleSubmissionRequest* req = [[IFLSingleSubmissionRequest alloc]init];
    req.iflId = self.iflId;
    req.baseUrl = self.base_url;
    NSURL* url = [req generateRequestURL];
    XCTAssert([expecting isEqualToString:[url description]],@"The URL is incorrectly formatted! %@",[url description]);
}

@end
