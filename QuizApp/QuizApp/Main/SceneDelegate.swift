//
//  SceneDelegate.swift
//  QuizApp
//
//  Created by Thomas on 2023/8/31.
//

import UIKit
import QuizEngine

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    

    var window: UIWindow?
    var quiz:Quiz?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        

        let question1 = Question.singleAnswer("What's Mike's nationality?")
        let question2 = Question.multipleAnswer("What are Caio's nationalities?")
        let questions = [question1,question2]

        let option1 = "Canadian"
        let option2 = "American"
        let option3 = "Greek"
        let options1 = [option1,option2,option3]

        let option4 = "Portuguese"
        let option5 = "American"
        let option6 = "Brazilian"
        let options2 = [option4,option5,option6]

        let options = [question1:options1,question2:options2]
        
        let correctAnswers = [(question1,[option3]),(question2,[option4,option6])]

        let navigationController = UINavigationController()
        let factory = iOSViewControllerFactory(options: options, correctAnswers: correctAnswers)
        let router = NavigationControllerRouter(navigationController, factory: factory)

        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window

        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        quiz = Quiz.start(questions: questions, delegate: router)

    }
    

    
}

