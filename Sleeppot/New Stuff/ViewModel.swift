//
//  ViewModel.swift
//  Sleeppot
//
//  Created by Felix Parey on 30/10/23.
//

import Foundation
import Observation
import CoreML
import NaturalLanguage
import SwiftUI

@Observable
class ViewModel {
   // var userInput = UserInput()
    var sentimentPrediction = ""
    var mlModelPrediction = ""
    var dictionary: [String: [String]] = [
        "Positive": ["I'm happy to hear that!", "Keep up the great work!","This is truly positive!","You're an inspiration.", "Fantastic!"],
        
        "SELFSTEEM": ["Hi honey, I'm here to support you anyway I can, you just have to relax a bit and think about what you've become and the things you accomplished.",
                              "Hi sweetie! Self-esteem can be challenging, but remember that many people struggle with it at some point in their lives, and you are not alone",
                              "Now listen to Potty, Relax a bit and take some time for self-reflection and identify your strengths and accomplishments to boost your self-esteem",
                              "Hey sleep seeker! Surround yourself with positive influences and supportive people who uplift you, there's no space for negative people in your life so just concentrate on what and who makes you happy! ",
                              "When i feel like that i think about how i would like to be treated. Practice self-compassion and treat yourself with the same kindness you'd offer to a friend",
                              "Hey dream catcher! Set achievable goals and celebrate your successes, no matter how small they may seem",
                              "Hey night traveler! Consider seeking the guidance of a therapist or counselor to work on your self-esteem in a more structured way",
                              "When something seems to be off about how i think about myself, i try to take another path! Avoid negative self-talk and challenge your critical thoughts about yourself",
                              "Well thing a bit about you, honey! Engage in activities or hobbies that make you feel confident and capable",
                              "Now listen, You're the best version of yourself! If you thing about what you have been throught and what you have became, you'll realize that this is your best shape and having a bad day can't ruin it."],
                
                
        "SOCIALANXIETY": ["Hey sleep seeker! I understand that social anxiety can be challenging, and you're not alone in experiencing these feelings, try to get in touch with someone who face your same problem. Seeing your problems from another perspective can be helpful!",
                          "Don't rush sweetie! It's okay to take small steps when facing social anxiety. Gradual exposure to social situations can help you build confidence",
                          "Hey honey! I always imagine people i have to talk to wearing just underwears, it's much more easier. Try it!",
                          "Close your eyes and breath! Breathing exercises can be a useful tool to calm your nerves before social interactions",
                          "Hi dream catcher, Remember that most people are more focused on themselves than on judging you. The pressure you feel is often self-imposed",
                          "Well thing a bit about you, honey! Practice positive self-talk and challenge negative thoughts that contribute to social anxiety.",
                          "Seek support from a therapist or counselor who specializes in treating social anxiety. They can provide valuable strategies and techniques",
                          "Hey night traveler! Consider joining social or support groups where you can connect with others who may be experiencing similar challenges",
                          "Visualization techniques can help you mentally prepare for social situations and reduce anxiety, but don't try to foresee and predict every situation because most of them are umpredictable",
                          "Now listen to Potty! Self-acceptance is crucial. Embrace your unique qualities and understand that social anxiety doesn't define you",
                          "Hi little dreamer! practice relaxation techniques like progressive muscle relaxation to clear your mind and reduce anxiety, allowing for a more peaceful night's rest. For example i always do mindfulness... even if my head is actually.. empty."],
                
        "FAMILY": [ "Hi sweetie! I understand that feeling a lack of support from your family can be challenging, and it's important to address these feelings",
                    "Maybe they didn't get your point! It's okay to express your concerns with your family. Open communication can lead to better understanding and support, but remain calm and be clear!",
                    "Hey sleep seeker! Consider seeking support from friends or other individuals who can provide the emotional support you may need",
                    "Hey Dream Catcher, Maybe they had a bad day! Remember that family dynamics can change over time. Patience and time may lead to improvements in your relationships",
                    "Sweetie, you're not alone! Look for community or support groups where you can connect with others who may be experiencing similar family challenges",
                    "Always think about you. Self-care is essential. Taking care of your well-being can help you navigate these challenges more effectively",
                    "Speak from the heart and be clear on your need! Setting boundaries with family members can be a helpful step in maintaining your emotional health",
                    "Seek professional advice if the lack of family support is causing significant distress. Therapists or counselors can provide valuable guidance",
                    "Hey night traveler! Focus on building your own support network outside of your family, which can provide the support you need and maybe can make your family understand better what you want",
                    "Hi honey, If your distress is to much and you feel treatened don't esitate to talk with a professional, social services and so on. Always remember that you are important, and if you don't feel confortable you can do something to get better!"
                  ],
        
        "TIME": ["Hey my dear! I see you're stuggling with time management, which is a common challenge. Think about the fact you did the best you can for today!",
                 "Well sweety, prioritizing tasks can be a game-changer. Try listing your tasks by importance and tackle them accordingly",
                 "Hey Night traveler! Consider using a to-do list or a time management app to help you organize your tasks more effectively",
                 "Break down your goals into smaller, manageable steps! It will make it easier to tackle them one at a time and you don't get at the end of the day with many zeros ",
                 "Now listen to Potty! Multitasking can be counterproductive; try focusing on one task at a time to boost efficiency ",
                 "Hey sleep catcher! Don't be afraid to say no to new commitments when your schedule is already full. Protect your time and make it meaningful",
                 "Sometime i tent to zone out when I have so much to do. Time blocking or the Pomodoro Technique (25 minutes of work, 5-minute breaks) can help you maintain focus ",
                 "If you have something to do, checking your phone ringing continuously can lead you off rail! Minimize distractions by turning off notifications and setting specific times for checking emails and social media ",
                 "Can't do it? Ask someone! Delegating tasks when possible can free up your time and reduce your workload ",
                 "Hey sleep seeker! Try to review and adjust your time management strategies based on what's working best for you. And remember, self-compassion is key as you work on these improvement"],

        
    
        
        "CAREER": ["I understand that lacking clear career goals can be unsettling, but it's a common challenge that many people face",
                   "To gain more clarity about your career direction, take some time for self-reflection. Consider your interests, strengths, and values.",
                   "Start with setting short-term goals. They don't have to be a lifetime commitment and can guide you towards your long-term aspirations.",
                   "Don't hesitate to seek advice from mentors, career counselors, or peers. They can provide valuable insights and guidance.",
                   "Exploring different career paths is perfectly normal. Trying out new experiences can help you discover what resonates with you.",
                   "Consider taking personality assessments or career aptitude tests to gain insights into potential career choices.",
                   "Networking with professionals in fields of interest can provide valuable insights and connections.",
                   "Focus on personal growth and skill development. Being well-rounded can open up various career opportunities.",
                   "While having clear career goals is important, remember to appreciate the journey, as life is full of surprises.",
                   "Before going to sleep, try relaxation techniques like deep breathing or meditation to calm your mind, which can help you contemplate your career goals more effectively."
                  ],
        
        
        "OVERWHELMD": ["Feeling overwhelmed is completely normal at times, and it's okay to acknowledge these feelings",
                       "Take a few deep breaths to help calm your mind and reduce the sense of being overwhelmed",
                       "Break down your tasks into smaller, manageable steps to make them feel less daunting",
                       "Prioritize what needs to be done and tackle the most important tasks first",
                       "Consider creating a to-do list or using a task management app to help you stay organized",
                       "Don't hesitate to ask for help or delegate tasks when possible. You don't have to do everything alone",
                       "Take short breaks to relax and recharge when you're feeling overwhelmed",
                       "Practice mindfulness or meditation before bedtime to clear your mind and promote better sleep",
                       "Remember that it's okay to say no to additional commitments if you're already overwhelmed with existing responsibilities",
                       "Reach out to friends, family, or a professional if you need someone to talk to about your feelings of overwhelm. You don't have to face it alon"],
        
        "FINANCIAL": ["Financial stress can feel overwhelming, but remember, you're not alone. Take a few deep breaths to calm your mind.",
                      "Many people face financial stress. Creating a budget can give you a sense of control and relief.",
                      "Break down your financial issues into small, manageable goals. Achievable steps can make a big difference.",
                      "Don't hesitate to seek support from friends, family, or financial advisors. Talking about your stress is a step toward finding solutions.",
                      "Prioritize your spending and cut non-essential expenses to ease your financial burden.",
                      "Practice mindfulness or meditation before bed to clear your mind and improve your sleep.",
                      "Consider establishing an emergency fund for unexpected expenses. It provides a safety net and reduces worry.",
                      "Financial stress is temporary, and there are resources available to help. Look for financial education programs or counseling services.",
                      "Reflect on your achievements and strengths. Recognizing your ability to overcome challenges can boost your confidence.",
                      "Focus on aspects of life not related to money, like relationships, hobbies, and personal well-being, to shift your mindset and promote better slee",
                      "Financial stress can feel overwhelming, but remember, you're not alone. Take a few deep breaths to calm your mind."],
        
    ]
    
    func analyzeSentimentButtonTapped(_ inputText: String) {
    
        let sentimentModel = try! SentimentAnalyzer_()
        let model1 = try! MLmodel()
        let inputSentiment = SentimentAnalyzer_Input(text: inputText)
        let inputML = MLmodelInput(text: inputText)
        
        
        
        guard let SentimentOutput = try? sentimentModel.prediction(input: inputSentiment)
        else {
            return
        }
        
        if SentimentOutput.label == "positive" {
            if let positiveResponses = dictionary["Positive"] {
                let randomIndex = Int(arc4random_uniform(UInt32(positiveResponses.count)))
                sentimentPrediction = positiveResponses[randomIndex]
                mlModelPrediction = sentimentPrediction
            }
        } else if SentimentOutput.label == "negative" {
            sentimentPrediction = "☹️"
            
            guard let MLmodelOutput = try? model1.prediction(input: inputML)
            else {
                return
            }
            
            guard let MLmodelOutput = try? model1.prediction(input: inputML)
            else {
                return
            }
            if MLmodelOutput.label == "SelfSteem"{
                if let selfSteemResponses = dictionary["SELFSTEEM"] {
                    let randomIndex = Int(arc4random_uniform(UInt32(selfSteemResponses.count)))
                    mlModelPrediction = selfSteemResponses[randomIndex]
                }
            }
            
            else if MLmodelOutput.label == "SocialAnxiety"{
                if let socialAnxietyResponses = dictionary["SOCIALANXIETY"] {
                    let randomIndex = Int(arc4random_uniform(UInt32(socialAnxietyResponses.count)))
                    mlModelPrediction = socialAnxietyResponses[randomIndex]
                }
            }
            
            else if MLmodelOutput.label == "LackOfSupportFromFamily"{
                if let familyResponses = dictionary["FAMILY"] {
                    let randomIndex = Int(arc4random_uniform(UInt32(familyResponses.count)))
                    mlModelPrediction = familyResponses[randomIndex]
                }
            }
            
            else if MLmodelOutput.label == "Timemanagementissues"{
                if let timeResponses = dictionary["TIME"] {
                    let randomIndex = Int(arc4random_uniform(UInt32(timeResponses.count)))
                    mlModelPrediction = timeResponses[randomIndex]
                }
            }
            
            else if MLmodelOutput.label == "Lackofclearcareergoals"{
                if let lackofclearcareergoalsResponses = dictionary["CAREER"] {
                    let randomIndex = Int(arc4random_uniform(UInt32(lackofclearcareergoalsResponses.count)))
                    mlModelPrediction = lackofclearcareergoalsResponses[randomIndex]
                }
            }
            
            else if MLmodelOutput.label == "Overwhelmd"{
                if let overwhelmdResponses = dictionary["OVERWHELMD"] {
                    let randomIndex = Int(arc4random_uniform(UInt32(overwhelmdResponses.count)))
                    mlModelPrediction = overwhelmdResponses[randomIndex]
                }
            }
            
            else if MLmodelOutput.label == "Financial stress"{
                if let financialResponses = dictionary["FINANCIAL"] {
                    let randomIndex = Int(arc4random_uniform(UInt32(financialResponses.count)))
                    mlModelPrediction = financialResponses[randomIndex]
                }
            }
            
        } else {
            sentimentPrediction = "😐"
            mlModelPrediction = "Sorry, but I couldn't understand your problem. Please click on back-button on the top left to try again"
        }
    }
}
