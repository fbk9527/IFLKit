//
//  IFLSubmissionsRequestTest.m
//  IFLKit
//
//  Created by Freddy kelch on 9/24/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "IFLSubmissionsRequest.h"

@interface IFLSubmissionsRequestTest : XCTestCase
@property(strong,nonatomic) NSNumber* limit;
@property(strong,nonatomic) NSNumber* start;
@property(strong,nonatomic) NSNumber* user_id;
@property(strong,nonatomic) NSString* base_url;
@end

@implementation IFLSubmissionsRequestTest

- (void)setUp {
    [super setUp];
    self.limit = @10;
    self.start = @0;
    self.user_id = @312;
    self.base_url = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/";
}

- (void)tearDown {
    [super tearDown];
}

#pragma mark - Happy Path
-(void)testCommandRequestURL_OnlyRequired
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/submissions/";
    IFLSubmissionsRequest* req = [[IFLSubmissionsRequest alloc]init];
    req.baseUrl = self.base_url;
    NSURL* url = [req generateRequestURL];
    XCTAssert([expecting isEqualToString:[url description]],@"The URL is incorrectly formatted! %@",[url description]);
}

-(void)testCommandRequestURLWithOptionals_LimitStartUser
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/submissions/?limit=10&start=0&user_id=312";
    IFLSubmissionsRequest* req = [[IFLSubmissionsRequest alloc]init];
    req.baseUrl = self.base_url;
    req.limit = self.limit;
    req.start = self.start;
    req.user_id = self.user_id;
    NSURL* url = [req generateRequestURL];
    
    NSURLComponents* good_comp = [NSURLComponents componentsWithURL:[NSURL URLWithString:expecting] resolvingAgainstBaseURL:YES];
    NSURLComponents* test_comp = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
    
    // Test schema
    XCTAssert([[good_comp scheme]isEqualToString:[test_comp scheme]], @"Schemas dont match! %@ vs. %@",[good_comp scheme], [test_comp scheme]);
    XCTAssert([[good_comp host]isEqualToString:[test_comp host]],     @"Host dont match! %@ vs. %@", [good_comp host], [test_comp host]);
    XCTAssert([[good_comp path]isEqualToString:[test_comp path]],     @"Path dont match! %@ vs. %@", [good_comp path], [test_comp path]);
    
    // Testing query items
    NSArray* good_items = [good_comp queryItems];
    NSArray* test_items = [test_comp queryItems];
    
    BOOL queryObjectsEqual = YES;
    for (id obj in good_items)
        queryObjectsEqual = queryObjectsEqual && ( [test_items indexOfObject:obj] != NSNotFound);
    
    XCTAssert(queryObjectsEqual, @"The query items didn't align..");
    
}

-(void)testCommandRequestURLWithOptionals_LimitStart
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/submissions/?limit=10&start=0";
    IFLSubmissionsRequest* req = [[IFLSubmissionsRequest alloc]init];
    req.baseUrl = self.base_url;
    req.limit = self.limit;
    req.start = self.start;
    NSURL* url = [req generateRequestURL];
    
    NSURLComponents* good_comp = [NSURLComponents componentsWithURL:[NSURL URLWithString:expecting] resolvingAgainstBaseURL:YES];
    NSURLComponents* test_comp = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
    
    // Test schema
    XCTAssert([[good_comp scheme]isEqualToString:[test_comp scheme]], @"Schemas dont match! %@ vs. %@",[good_comp scheme], [test_comp scheme]);
    XCTAssert([[good_comp host]isEqualToString:[test_comp host]],     @"Host dont match! %@ vs. %@", [good_comp host], [test_comp host]);
    XCTAssert([[good_comp path]isEqualToString:[test_comp path]],     @"Path dont match! %@ vs. %@", [good_comp path], [test_comp path]);
    
    // Testing query items
    NSArray* good_items = [good_comp queryItems];
    NSArray* test_items = [test_comp queryItems];
    
    BOOL queryObjectsEqual = YES;
    for (id obj in good_items)
        queryObjectsEqual = queryObjectsEqual && ( [test_items indexOfObject:obj] != NSNotFound);
    
    XCTAssert(queryObjectsEqual, @"The query items didn't align..");
    
}

-(void)testCommandRequestURLWithOptionals_Limit
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/submissions/?limit=10";
    IFLSubmissionsRequest* req = [[IFLSubmissionsRequest alloc]init];
    req.baseUrl = self.base_url;
    req.limit = self.limit;
    NSURL* url = [req generateRequestURL];
    
    NSURLComponents* good_comp = [NSURLComponents componentsWithURL:[NSURL URLWithString:expecting] resolvingAgainstBaseURL:YES];
    NSURLComponents* test_comp = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
    
    // Test schema
    XCTAssert([[good_comp scheme]isEqualToString:[test_comp scheme]], @"Schemas dont match! %@ vs. %@",[good_comp scheme], [test_comp scheme]);
    XCTAssert([[good_comp host]isEqualToString:[test_comp host]],     @"Host dont match! %@ vs. %@", [good_comp host], [test_comp host]);
    XCTAssert([[good_comp path]isEqualToString:[test_comp path]],     @"Path dont match! %@ vs. %@", [good_comp path], [test_comp path]);
    
    // Testing query items
    NSArray* good_items = [good_comp queryItems];
    NSArray* test_items = [test_comp queryItems];
    
    BOOL queryObjectsEqual = YES;
    for (id obj in good_items)
        queryObjectsEqual = queryObjectsEqual && ( [test_items indexOfObject:obj] != NSNotFound);
    
    XCTAssert(queryObjectsEqual, @"The query items didn't align..");
    
}

@end
