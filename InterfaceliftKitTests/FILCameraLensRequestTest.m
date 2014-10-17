//
//  FILCameraLensRequestTest.m
//  IFLKit
//
//  Created by Freddy kelch on 9/24/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "IFLCameraLensRequest.h"


@interface FILCameraLensRequestTest : XCTestCase
@property(strong,nonatomic) NSString* base_url;
@property(strong,nonatomic) NSNumber* iflId;
@end

@implementation FILCameraLensRequestTest

- (void)setUp {
    [super setUp];
    self.base_url =@"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/";
    self.iflId = @621;
}

- (void)tearDown {
    [super tearDown];
}

-(void)testCommandRequestURL_OnlyRequired
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/lens/621/";
    IFLCameraLensRequest* req = [[IFLCameraLensRequest alloc]initWithId:self.iflId];
    NSURL* url = [req generateRequestUrlWithBaseString:self.base_url];
    XCTAssert([expecting isEqualToString:[url description]],@"The URL is incorrectly formatted! %@",[url description]);
}

@end
