//
//  IFLTagsRequestTest.m
//  IFLKit
//
//  Created by Freddy kelch on 9/24/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "IFLTagsRequest.h"

@interface IFLTagsRequestTest : XCTestCase
@property(strong,nonatomic) NSString* search;
@property(strong,nonatomic) NSString* type;
@property(strong,nonatomic) NSString* base_url;
@end

@implementation IFLTagsRequestTest

- (void)setUp {
    [super setUp];
    self.search = @"Blue";
    self.type = @"Color";
    self.base_url = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/";
   // @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/tags/?search=Blue&type=Color";
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

-(void)testCommandRequestURL_OnlyRequired
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/tags/";
    IFLTagsRequest* req = [[IFLTagsRequest alloc]init];
    req.baseUrl = self.base_url;
    NSURL* url = [req generateRequestURL];
    XCTAssert([expecting isEqualToString:[url description]],@"The URL is incorrectly formatted! %@",[url description]);
}

-(void)testCommandRequestURLWithOptionals_Search
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/tags/?search=Blue";
    IFLTagsRequest* req = [[IFLTagsRequest alloc]init];
    req.baseUrl = self.base_url;
    req.search = self.search;
    
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

-(void)testCommandRequestURLWithOptionals_SearchType
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/tags/?search=Blue&type=Color";
    IFLTagsRequest* req = [[IFLTagsRequest alloc]init];
    req.baseUrl = self.base_url;
    req.search = self.search;
    req.type = self.type;
    NSURL* url = [req generateRequestURL];
    
    NSURLComponents* good_comp = [NSURLComponents componentsWithURL:[NSURL URLWithString:expecting] resolvingAgainstBaseURL:YES];
    NSURLComponents* test_comp = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
    
    // Test schema
    XCTAssert([[good_comp scheme]isEqualToString:[test_comp scheme]], @"Schemas dont match! %@ vs. %@",[good_comp scheme], [test_comp scheme]);
    XCTAssert([[good_comp host]isEqualToString:[test_comp host]], @"Host dont match! %@ vs. %@", [good_comp host], [test_comp host]);
    XCTAssert([[good_comp path]isEqualToString:[test_comp path]], @"Path dont match! %@ vs. %@", [good_comp path], [test_comp path]);
    
    // Testing query items
    NSArray* good_items = [good_comp queryItems];
    NSArray* test_items = [test_comp queryItems];
    
    BOOL queryObjectsEqual = YES;
    for (id obj in good_items)
        queryObjectsEqual = queryObjectsEqual && ( [test_items indexOfObject:obj] != NSNotFound);
    
    XCTAssert(queryObjectsEqual, @"The query items didn't align..");
    
}
@end
