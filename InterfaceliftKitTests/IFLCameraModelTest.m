//
//  IFLCameraModelTest.m
//  IFLKit
//
//  Created by Freddy kelch on 9/26/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "IFLCamera.h"

@interface IFLCameraModelTest : XCTestCase
@property(strong,nonatomic) NSData* JSONData;
@end

@implementation IFLCameraModelTest

- (void)setUp
{
    [super setUp];
    
    NSBundle* mainBundle = [NSBundle bundleForClass:[self class]];
    NSString* jsonPath   = [mainBundle pathForResource:@"camera_body" ofType:@"json"];
    self.JSONData = [[NSData alloc]initWithContentsOfFile:jsonPath];
}

- (void)tearDown
{
    [super tearDown];
}

-(void)testConstruction
{
    XCTAssert(self.JSONData);
    
    NSDictionary* dict = [NSJSONSerialization JSONObjectWithData:self.JSONData options:0 error:nil];
    IFLCamera* camera = [[IFLCamera alloc]init];
    [camera populateFromJSONObject:dict];

    
    NSDictionary* renamedKeys = [IFLModel renamedKeys];
    NSEnumerator* enumerator = [[camera jsonKeys]objectEnumerator];
    for (NSString* key in enumerator)
    {
        NSString* rKey = renamedKeys[key];
        if(!rKey)
            rKey = key;
        
        id cvalue = [camera valueForKey:rKey];
        id jvalue = [dict valueForKey:key];
        
        BOOL result = YES;
        if ([cvalue isKindOfClass:[NSString class]])
        {
            result = result && [cvalue isEqualToString:jvalue];
        }
        else if([cvalue isKindOfClass:[NSNumber class]])
        {
            result = result && [cvalue isEqualToNumber:jvalue];
        }
        else if([cvalue isKindOfClass:[NSArray class]])
        {
            result = result && [cvalue isEqualToArray:jvalue];
        }
        XCTAssert(result, @"Value Mismatch!! %@ vs. %@",[cvalue description], [jvalue description]);
            
    }
}
@end
