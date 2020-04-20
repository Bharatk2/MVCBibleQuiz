//
//  QuizController.swift
//  FinalBibleQuiz
//
//  Created by Bhawnish Kumar on 4/15/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

import Foundation
import UIKit

enum Alert {
    static func show(title: String, message: String, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        vc.present(alert, animated: true)
    }
}
struct QuizBrain {
    
    var viewController: ViewController?
    var questionNumber = 0
    var score = 0
    var tapInt = 0
    var startInt = 1
    var startTimer = Timer()
    var gameInt = 20
    var gameTimer = Timer()
    
    let quiz = [
        Quiz(q: "What is God's personal name?", a: ["God", "Adonai", "Jehovah"], correctAnswer: "Jehovah"),
        Quiz(q: "What was the name of the first human on the Earth? ", a: ["Abel", "Eve", "Adam"], correctAnswer: "Adam"),
        Quiz(q: "How many times did a rooster crow after Peter disowned Jesus?", a: [ "Four", "Two", "Three"], correctAnswer: "Two"),
        Quiz(q: "What was the first thing God put on the earth?", a: ["Plants", "Water", "Animals"], correctAnswer: "Water"),
        Quiz(q: "How old was Noah when flood started?", a: ["800", "500", "600"], correctAnswer: "600"),
        Quiz(q: "How many people were on the ark?", a: ["8", "5", "9",], correctAnswer: "8"),
        Quiz(q: "Who is the longest living human on the earth?", a: ["Abraham", "Methusaleh", "Moses"], correctAnswer: "Methusaleh"),
        Quiz(q: "What was God's first creation?", a: ["Angels", "Jesus", "Humans"], correctAnswer: "Jesus"),
        Quiz(q: "How old was Jesus when he was baptized?", a: ["25", "33", "30"], correctAnswer: "30"),
        Quiz(q: "What was laid on the road as Jesus rode into Jerusalem?", a: ["Gold and Diamonds", "Flowers and plants", "Clothing and Foliage"], correctAnswer: "Clothing and Foliage")
    ]
    
    func getQuestionText() -> String {
        return quiz[questionNumber].text
    }
    
    //Need a way of fetching the answer choices.
    func getAnswers() -> [String] {
        if quiz[questionNumber].answers.count == .max {
            
        }
        return quiz[questionNumber].answers
    }
    
    func getProgress() -> Float {
        return Float(questionNumber) / Float(quiz.count)
    }
    
    mutating func getScore() -> Int {
        return score
    }
    
     mutating func nextQuestion() {
        
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
    }
    
  
    mutating func checkAnswer(userAnswer: String) -> Bool {
        //Need to change answer to rightAnswer here.
        if userAnswer == quiz[questionNumber].rightAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    
    func showAlert(vc: UIViewController) {
    
        switch quiz[questionNumber].answers.count {
        case 0:
            if quiz[questionNumber].rightAnswer != quiz[questionNumber].rightAnswer {
            let alert1 = UIAlertController(title: "Oops, sorry!", message: "The Answer is Adam. Genesis 1:27 says: And God went on to create the man in his image, in God's image he created him; male and female he created them", preferredStyle: .alert)
                
                let okAction1 = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                
                alert1.addAction(okAction1)
            vc.present(alert1, animated: true, completion: nil)
            }
        case 1:
             if quiz[questionNumber].rightAnswer != quiz[questionNumber].rightAnswer {
            let alert1 = UIAlertController(title: "Oops, sorry!", message: "The Answer is Adam. Genesis 1:27 says: And God went on to create the man in his image, in God's image he created him; male and female he created them", preferredStyle: .alert)
                
                let okAction1 = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                
                alert1.addAction(okAction1)
            
            vc.present(alert1, animated: true, completion: nil)
            }
        case 2:
             if quiz[questionNumber].rightAnswer != quiz[questionNumber].rightAnswer {
            let alert1 = UIAlertController(title: "Oops, sorry!", message: "The Answer is Adam. Genesis 1:27 says: And God went on to create the man in his image, in God's image he created him; male and female he created them", preferredStyle: .alert)
                
                let okAction1 = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                
                alert1.addAction(okAction1)
            
            vc.present(alert1, animated: true, completion: nil)
            }
        default:
            break
        }
    }
       
    func timeaction(){
        var questionEnd = questionNumber
        guard let viewController = viewController else { return }
        if quiz[questionNumber].answers.count == .max {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                viewController.performSegue(withIdentifier: "Level2Segue", sender: viewController)
            })
        }
    }
    
}

