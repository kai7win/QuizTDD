//
//  BasicQuizBuilderTest.swift
//  QuizAppTests
//
//  Created by Thomas on 2023/10/14.
//

import XCTest
import QuizEngine

struct BasicQuiz{
    let questions: [Question<String>]
}

struct BasicQuizBuilder{
    
    private let questions: [Question<String>]
    
    init(singleAnswerQuestion:String){
        questions = [.singleAnswer(singleAnswerQuestion)]
    }
    
    func build() -> BasicQuiz{
        BasicQuiz(questions: questions)
    }
}

class BaiscQuizBuilderTest:XCTestCase{
    
    func test_initWithSingleAnswerQuestion(){
        let sut = BasicQuizBuilder(singleAnswerQuestion:"q1")
        
        XCTAssertEqual(sut.build().questions, [.singleAnswer("q1")])
    }
    
}
