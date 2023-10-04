//
//  ScoreTest.swift
//  QuizEngineTests
//
//  Created by Thomas on 2023/10/5.
//

import Foundation
import XCTest

class ScoreTest:XCTestCase{
    
    func test_noAnswers_scoresZero(){
        
        XCTAssertEqual(BasicScore.score(for:[],comparingTo: []), 0)
        
    }
    
    func test_oneWrongAnswer_scoresZero(){
        
        XCTAssertEqual(BasicScore.score(for:["Wrong"],comparingTo:["correct"]), 0)
        
    }
    
    
    private class BasicScore{
        
        static func score(for:[Any],comparingTo:[Any] ) -> Int{
            return  0
        }
        
    }
}
