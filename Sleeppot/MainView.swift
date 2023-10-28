//
//  ContentView.swift
//  SentimentAnalyzer
//
//  Created by sara hu lihua on 22/10/23.
//

import SwiftUI
import Foundation

struct MainView: View {
    
    @State private var viewModel = ViewModel()
    @State private var isKeyboardVisible = false
    

    
    var body: some View {
        
        
        
        ZStack{
            Spacer()
            Image("backgroundImage")
                .resizable()
                .blur(radius: 2) //sfocato
                .scaleEffect(x: 1.3, y: 1.3) //non so se è tanto giusto
                .frame(maxWidth: .infinity, maxHeight: .infinity) //fisso lo sfondo
            Spacer()
            
            IdleView()
                .offset(y: -50)
            
            VStack {
                Spacer()
                

                if !viewModel.sentimentPrediction.isEmpty {
                    Text(viewModel.sentimentPrediction)
                        .font(.headline)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(20)
                        .padding()
                        .padding(.horizontal)
                
                } else if !viewModel.MLmodelPrediction.isEmpty {
                    Text(viewModel.MLmodelPrediction)
                        .font(.headline)
                        .foregroundColor(.black)
                        .background(Color.white)
                        .cornerRadius(20)
                        .padding()
                        .padding(.horizontal)
                }
                
                
                TextField("Tell me your feelings here...", text: $viewModel.userInput )
                    .padding()
                    .background(Color("textBoxColor"))
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .foregroundColor(.black)
                    .padding([.top, .leading, .trailing], 7.0)
                
                Button(action: {
                    viewModel.analyzeSentimentButtonTapped()
                }){
                    Text("GetResponse")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical,10)
                        .padding(.horizontal,30)
                        .background(Color.purple)
                        .cornerRadius(50)
                    
                }
                .padding()
            }
            
        }
        
    }
}
    
#Preview {
    MainView()
}
    
    
    
    
    //            VStack{
    //                TextField("Enter the text here",text: $viewModel.userInput)
    //                    .padding()
    //                    .background(Color.white)
    //                    .cornerRadius(10)
    //                    .shadow(radius: 10)
    //
    //                Button(action: {
    //                    viewModel.analyzeSentimentButtonTapped()
    //                }){
    //                    Text("Perform analysis")
    //                        .fontWeight(.bold)
    //                        .foregroundColor(.white)
    //                        .padding(.vertical,10)
    //                        .padding(.horizontal,30)
    //                        .background(Color.blue)
    //                        .cornerRadius(50)
    //
    //                }
    //                .padding()
    //
    //
    //                Text("Sentiment Analysis: \(viewModel.sentimentPrediction)")
    //                    .padding()
    //                    .font(Font(UIFont(name: "Arial", size: 20)!))
    //
    //                Text("Problem Analysis: \(viewModel.MLmodelPrediction)")
    //                    .padding()
    //                    .font(Font(UIFont(name: "Arial", size: 20)!))
    //
    //            }
    //            .padding(.horizontal,30)
    //            .cornerRadius(10)
    //            .padding()
    //            Spacer()
    //        }
    //    }
    //
    
    
    
    
    //struct TextEditorView: View {
    //    @State var userInput = UserInput()
    //    @State var scenePresentedVM = ScenePresentedViewModel()
    //
    //    func saveText(){
    //        userInput.savedText = userInput.userInput
    //        print(userInput.savedText)
    //    }
    //
    //    var body: some View {
    //        TextEditor(text: $userInput.userInput)
    //            .placeholder(when: userInput.userInput.isEmpty, placeholder: {
    //                VStack{
    //                    Label("Tell me your feelings here...", systemImage: "pencil.line")
    //                        .foregroundStyle(Color.gray)
    //                        .padding([.top, .leading, .trailing], 7.0)
    //                    Spacer()
    //                }
    //            })
    //            .textFieldStyle(.roundedBorder)
    //            .foregroundStyle(Color("purpleTextColor"))
    //            .scrollContentBackground(.hidden)
    //            .background(Color("textBoxColor"))
    //            .frame(height: 120)
    //            .clipShape(RoundedRectangle(cornerRadius: 10))
    //            .padding()
    //            .overlay(alignment: .topTrailing) {
    //                Button(action: {
    //                    saveText()
    //                    userInput.userInput = ""
    //                    hideKeyboard()
    //                }, label: {
    //                    Circle()
    //                        .frame(width: 30, height: 30)
    //                })
    //                .padding([.top, .trailing], 20.0)
    //            }
    //    }
    //}
