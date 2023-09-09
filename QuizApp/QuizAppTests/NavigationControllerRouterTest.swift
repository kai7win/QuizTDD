//
//  NavigationControllerRouterTest.swift
//  QuizAppTests
//
//  Created by Thomas on 2023/9/9.
//

import UIKit
import XCTest
import QuizEngine
@testable import QuizApp

class NavigationControllerRouterTest:XCTestCase{
    
    let navigationController = NonAnimatedNavigationController()
    let factory = ViewControllerFactoryStub()
    
    lazy var sut:NavigationControllerRouter = {
        return NavigationControllerRouter(self.navigationController,factory:self.factory)
    }()
    
    func test_routeToQuestion_showsQuestionController(){
        
        let viewController = UIViewController()
        let seconfViewController = UIViewController()
        factory.stub(question:"Q1",with:viewController)
        factory.stub(question:"Q2",with:seconfViewController)
        
        sut.routeTo(question:"Q1",answerCallback:{ _ in })
        sut.routeTo(question:"Q2",answerCallback:{ _ in })
        
        XCTAssertEqual(navigationController.viewControllers.count,2)
        XCTAssertEqual(navigationController.viewControllers.first,viewController)
        XCTAssertEqual(navigationController.viewControllers.last,seconfViewController)
    }
    
    func test_routeToSecondQuestion_presentsQuestionControllerWithRightCallback(){
        
        var callbackWasFired = false
        sut.routeTo(question:"Q1",answerCallback:{ _ in callbackWasFired = true })
        factory.answerCallback["Q1"]!("anything")
        
        XCTAssertTrue(callbackWasFired)
    }
    
    class NonAnimatedNavigationController:UINavigationController{
        override func pushViewController(_ viewController: UIViewController, animated: Bool) {
            super.pushViewController(viewController, animated: false)
        }
    }
    
    class ViewControllerFactoryStub:ViewControllerFactory{
        
        private var stubbedQuestions = [String:UIViewController]()
        var answerCallback = [String:(String) -> Void]()
        
        func stub(question:String,with viewController:UIViewController){
            stubbedQuestions[question] = viewController
        }
        
        func questionViewController(for question:String,answerCallback:@escaping(String) -> Void) -> UIViewController{
            self.answerCallback[question] = answerCallback
            return stubbedQuestions[question] ?? UIViewController()
        }
    }
    
}
