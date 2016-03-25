//
//  CardTests.m
//  StandfordIos7
//
//  Created by Hengjie.chj on 18/2/2016.
//  Copyright © 2016 hengjie.chj. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "Card.h"


@interface Card (Test)
// access private methods by adding a private category
- (int)matchCard:(Card *)otherCard;

@end

@interface CardTests : XCTestCase

@property (nonatomic) Card *card1;
@property (nonatomic) Card *card2;

@end

@implementation CardTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.card1 = [[Card alloc] init];
    self.card2 = [[Card alloc] init];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    self.card1 = nil;
    self.card2 = nil;
}

- (void)testMatchCardWithSameCard {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    Card *sameCard1 = self.card1;
    sameCard1.contents = @"2♠︎";
    
    Card *sameCard2 = self.card2;
    sameCard2.contents = @"2♠︎";
    
    // it should return 1 since two cards matched
    XCTAssertEqual(1, [sameCard1 matchCard:sameCard2]);
    XCTAssertEqual(1, [sameCard2 matchCard:sameCard1]);
}

- (void)testMatchCardWithDifferentCard {
    Card *differentCard1 = self.card1;
    differentCard1.contents = @"2♠︎";
    
    Card *differentCard2 = self.card2;
    differentCard2.contents = @"2♦︎";
    
    XCTAssertEqual(0, [differentCard1 matchCard:differentCard2]);
    XCTAssertEqual(0, [differentCard2 matchCard:differentCard1]);
}

- (void)testMatchWithSameCardInArray {
    Card *sameCard1 = self.card1;
    sameCard1.contents = @"2♠︎";
    
    Card *sameCard2 = self.card2;
    sameCard2.contents = @"2♠︎";
    
    NSArray *cardsToTest = @[sameCard2];
    XCTAssertEqual(1, [sameCard1 match:cardsToTest]);
}

- (void)testMatchWithDifferentCardInArray {
    Card *sameCard1 = self.card1;
    sameCard1.contents = @"2♠︎";
    
    Card *sameCard2 = self.card2;
    sameCard2.contents = @"2♦︎";
    
    NSArray *cardsToTest = @[sameCard2];
    XCTAssertEqual(0, [sameCard1 match:cardsToTest]);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
