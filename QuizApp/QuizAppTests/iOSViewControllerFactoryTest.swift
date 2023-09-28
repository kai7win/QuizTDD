//
//  iOSViewControllerFactoryTest.swift
//  QuizAppTests
//
//  Created by Thomas on 2023/9/14.
//

import UIKit
import XCTest
@testable import QuizEngine
@testable import QuizApp

class iOSViewControllerFactoryTest:XCTestCase{
    
    let singleAnswerQuestion = Question.singleAnswer("Q1")
    let multipleAnswerQuestion = Question.multipleAnswer("Q1")
    
    let options = ["A1","A2"]
    
    func test_questionViewController_singleAnswer_createsControllerWithTitle(){
        
        let presenter = QuestionPresenter(questions: [singleAnswerQuestion,multipleAnswerQuestion], question: singleAnswerQuestion)
        
        XCTAssertEqual(makeQuestionController(question: singleAnswerQuestion).title,presenter.title)
    }
    
    func test_questionViewController_singleAnswer_createsControllerWithQuestion(){
        XCTAssertEqual(makeQuestionController(question: singleAnswerQuestion).question,"Q1")
    }
    
    func test_questionViewController_singleAnswer_createsControllerWithOptions(){
        XCTAssertEqual(makeQuestionController(question: Question.singleAnswer("Q1")).options,options)
    }
    
    func test_questionViewController_singleAnswer_createsControllerWithSingleSelection(){
        XCTAssertFalse(makeQuestionController(question: singleAnswerQuestion).allowsMultipleSelection)
    }
    
    
    func test_questionViewController_multipleAnswer_createsControllerWithTitle(){
        
        let presenter = QuestionPresenter(questions: [singleAnswerQuestion,multipleAnswerQuestion], question: multipleAnswerQuestion)
        
        XCTAssertEqual(makeQuestionController(question: multipleAnswerQuestion).title,presenter.title)
    }
    
    func test_questionViewController_multipleAnswer_createsControllerWithQuestion(){
        XCTAssertEqual(makeQuestionController(question: multipleAnswerQuestion).question,"Q1")
    }
    
    func test_questionViewController_multipleAnswer_createsControllerWithOptions(){
        XCTAssertEqual(makeQuestionController(question: multipleAnswerQuestion).options,options)
    }
    
    func test_questionViewController_multipleAnswer_createsControllerWithSingleSelection(){
   
        XCTAssertTrue(makeQuestionController(question: multipleAnswerQuestion).allowsMultipleSelection)
    }
    
    func test_resultsViewController_createsControllerWithTitle(){
        
        let results =  makeResults()
        
        XCTAssertEqual(results.controller.title,results.presenter.title)
    }
    
    
    func test_resultsViewController_createsControllerWithSummary(){
        
        let results =  makeResults()
        
        XCTAssertEqual(results.controller.summary,results.presenter.summary)
    }
    
    
    func test_resultsViewController_createsControllerWithPresentableAnswers(){
        let results =  makeResults()
        
        XCTAssertEqual(results.controller.answers.count,results.presenter.presentableAnswers.count)
    }
    
    
    // MARK: - Helper
    
    func makeSUT(options:Dictionary<Question<String>,[String]> = [:],correctAnswers:Dictionary<Question<String>,Set<String>> = [:]) -> iOSViewControllerFactory{
        return iOSViewControllerFactory(questions:[singleAnswerQuestion,multipleAnswerQuestion],options:options,correctAnswers: correctAnswers)
    }
    
    func makeQuestionController(question:Question<String> = Question.singleAnswer("")) -> QuestionViewController{
        return makeSUT(options: [question:options]).questionViewController(for:question,answerCallback:{ _ in}) as! QuestionViewController
    }
    
    func makeResults() -> (controller:ResultsViewController,presenter:ResultsPresenter){
        
        let userAnswers = [singleAnswerQuestion:["A1"],multipleAnswerQuestion:Set(["A1","A2"])]
        
        let correctAnswers = [singleAnswerQuestion:["A1"],multipleAnswerQuestion:Set(["A1","A2"])]
        
        let result = Result(answers:userAnswers, score: 2)
        let questions = [singleAnswerQuestion,multipleAnswerQuestion]
        
        let orderedOptions = [singleAnswerQuestion:["A1"],multipleAnswerQuestion:["A1","A2"]]
        
        let presenter = ResultsPresenter(result: result, questions: questions,options: orderedOptions, correctAnswers: correctAnswers)
        
        let sut = makeSUT(correctAnswers: correctAnswers)
        let controller = sut.resultViewController(for: result) as! ResultsViewController
        
        return (controller,presenter)
    }
    
}
