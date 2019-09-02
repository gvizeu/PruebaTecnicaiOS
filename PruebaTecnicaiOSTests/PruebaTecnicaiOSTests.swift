//
//  PruebaTecnicaiOSTests.swift
//  PruebaTecnicaiOSTests
//
//  Created by Gonzalo Vizeu on 08/08/2019.
//  Copyright © 2019 everis. All rights reserved.
//

import XCTest

@testable import PruebaTecnicaiOS


class PruebaTecnicaiOSTests: XCTestCase {
    var sut = ViewMapsViewController()
    override func setUp() {
        super.setUp()
        sut = ViewMapsViewController()
        
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        
//        sut.artworks = [Artwork]
        super.tearDown()

        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSomething(){
        XCTAssert(sut.doingSomething() > 1)
        
        XCTAssertEqual(sut.oneValue, 3, "Score computed from guess is wrong")
        
    }
    
    func testScoreIsComputed() {
        // 1. given
//        let guess = sut.targetValue + 5
        
        // 2. when
//        sut.check(guess: guess)
        
        // 3. then
//        XCTAssertEqual(sut.scoreRound, 95, "Score computed from guess is wrong")
        
        XCTAssert(sut.doingSomething() > 1)
    }

}
