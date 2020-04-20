//
//  ViewController.swift
//  FinalBibleQuiz
//
//  Created by Bhawnish Kumar on 4/15/20.
//  Copyright © 2020 Bhawnish Kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var tapInt = 0
    var startInt = 1
    var startTimer = Timer()
    var gameInt = 20
    var gameTimer = Timer()
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    //Added another button and a corroponding outlet.
    @IBOutlet weak var choice1: UIButton!
    @IBOutlet weak var choice2: UIButton!
    @IBOutlet weak var choice3: UIButton!
    @IBOutlet weak var choice4: UIButton!
    
    
    @IBOutlet weak var answerButtonLabel1: UIButton!
    @IBOutlet weak var answerButtonLabel2: UIButton!
    @IBOutlet weak var answerButtonLabel3: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        quizBrain.timeaction()
        updateUI()
  
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    @IBOutlet weak var allChoices: UIButton!
    var viewController: ViewController?
    
    //New button needs to be linked to this IBAction too.
    @IBAction func answerButtonPressed(_ sender: UIButton) {
         let answerChoices = quizBrain.getAnswers()
       var questionEnd = 11
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
            squashButtonTapped()
            springButtonTapped1(sender)
        } else {
            sender.backgroundColor = UIColor.red
            
        }
        
        if quizBrain.quiz[questionEnd].answers.count == .zero {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                                   self.performSegue(withIdentifier: "Level2Segue", sender: self)
                              })
        }
        quizBrain.nextQuestion()
      
       
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        

        
    }
    
    @objc func updateUI() {
        
        questionLabel.text = quizBrain.getQuestionText()
        //Need to fetch the answers and update the button titles using the setTitle method.
        let answerChoices = quizBrain.getAnswers()
        choice1.setTitle(answerChoices[0], for: .normal)
        choice2.setTitle(answerChoices[1], for: .normal)
        choice3.setTitle(answerChoices[2], for: .normal)
        
        
        
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "🏆 Score: \(quizBrain.getScore())"
        
        choice1.backgroundColor = UIColor.clear
        choice2.backgroundColor = UIColor.clear
        
        //Third button needs to be reset too.
        choice3.backgroundColor = UIColor.clear
        
        
    }
    
    func showAlert() {
        let userAnswer1 = answerButtonLabel1.currentTitle!
        let userAnswer2 = answerButtonLabel2.currentTitle!
          let userAnswer3 = answerButtonLabel3.currentTitle!
        
         let userGotItRight1 = quizBrain.checkAnswer(userAnswer: userAnswer1)
        let userGotItRight2 = quizBrain.checkAnswer(userAnswer: userAnswer2)
        let userGotItRight3 = quizBrain.checkAnswer(userAnswer: userAnswer3)


         switch quizBrain.quiz[0] {
         case quizBrain.quiz[0] :
            guard userGotItRight3 == true else {
             let alert1 = UIAlertController(title: "Oops, sorry!", message: "The Answer is Adam. Genesis 1:27 says: And God went on to create the man in his image, in God's image he created him; male and female he created them", preferredStyle: .alert)
             
             let okAction1 = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
              alert1.addAction(okAction1)
             present(alert1, animated: true, completion: nil)
                return }
             
         case quizBrain.quiz[1]:
             let alert = UIAlertController(title: "It's Ok, But now you know!", message: "Genesis 1:27 says: And God went on to create the man in his image, in God's image he created him; male and female he created them ", preferredStyle: .alert)
             alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
             present(alert, animated: true)
         
         default:
             break
         }
     }
 
    
    
    @objc private func springButtonTapped1(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnswer)
        
        sender.transform = CGAffineTransform(scaleX: 0.0001, y: 0.0001)
        UIView.animate(withDuration: 3.0,
                       delay: 0,
                       usingSpringWithDamping: 0.3,
                       initialSpringVelocity: 0,
                       options: [],
                       animations: {
                        sender.transform = .identity
        },
                       completion: nil)
    }
    
    
    
    @objc private func squashButtonTapped() {
        imageView.center = CGPoint(x: view.center.x, y: -imageView.bounds.size.height)
        
        let animBlock = {
            UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.4) {
                self.imageView.transform = .identity
            }
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.20) {
                self.imageView.transform = CGAffineTransform(scaleX: 1.7, y: 0.6)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.2) {
                self.imageView.transform = CGAffineTransform(scaleX: 0.6, y: 1.7)
            }
            
            UIView.addKeyframe(withRelativeStartTime: 0.7, relativeDuration: 0.15) {
                self.imageView.transform = CGAffineTransform(scaleX: 1.11, y: 0.9)
            }
            UIView.addKeyframe(withRelativeStartTime: 0.85, relativeDuration: 0.15) {
                self.imageView.transform = .identity
            }
        }
        UIView.animateKeyframes(withDuration: 1.5,
                                delay: 0,
                                options: [],
                                animations: animBlock ,
                                completion: nil)
        
    }
    
  
    
    
}
