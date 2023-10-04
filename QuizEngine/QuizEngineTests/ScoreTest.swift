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
        
        XCTAssertEqual(BasicScore.score(for:[]), 0)
        
    }
    
    private class BasicScore{
        
        static func score(for:[Any]) -> Int{
            return  0
        }
        
    }
}
