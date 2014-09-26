//
//  IFLCameraBodyRequestTest.m
//  IFLKit
//
//  Created by Freddy kelch on 9/24/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "IFLCameraBodyRequest.h"

@interface IFLCameraBodyRequestTest : XCTestCase
@property(strong,nonatomic) NSString* base_url;
@property(strong,nonatomic) NSNumber* iflId;
@end

@implementation IFLCameraBodyRequestTest

- (void)setUp {
    [super setUp];
    self.base_url =@"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/";
    self.iflId = @1;
}

- (void)tearDown {
    [super tearDown];
}

-(void)testCommandRequestURL_OnlyRequired
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/camera/1/";
    IFLCameraBodyRequest* req = [[IFLCameraBodyRequest alloc]initWithId:self.iflId];
    req.baseUrl = self.base_url;
    NSURL* url = [req generateRequestURL];
    XCTAssert([expecting isEqualToString:[url description]],@"The URL is incorrectly formatted! %@",[url description]);
}
@end
