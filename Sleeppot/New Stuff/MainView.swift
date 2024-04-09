//
//  MainView.swift
//  Sleeppot
//
//  Created by Felix Parey on 24/10/23.
//

import SwiftUI


struct MainView: View {
    
    @Environment(ScenePresentedViewModel.self) private var scenePresentedVM
    @State var count = 0
    
    func presentClouds(){
        scenePresentedVM.showClouds = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
        scenePresentedVM.showClouds = true
        }
    }
    
    func changeSceneWithDelay(scene: Int){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            scenePresentedVM.scenePresented = scene
        }
    }
    
    func setCloudsFalse(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            scenePresentedVM.showClouds = false
        }
    }
    
    var body: some View {
        
        let textEditor = TextEditorView()
        ZStack{
            VStack {
                Spacer()
                Image("backgroundImage")
                    .resizable()
                    .blur(radius: 2)
                    .scaleEffect(x: 1.3, y: 1.3)
                Spacer()
            }
            .ignoresSafeArea(.keyboard)
            .onTapGesture {
                hideKeyboard()
                // scenePresentedVM.scenePresented = 0
            }
            VStack {
                Spacer()
                
                switch scenePresentedVM.scenePresented{
                    
                case 0:
                    IdleView()
                        .offset(y: -50)
                    
                case 1:
                    ZStack {
                        ChatView()
                            .offset(y: -110)
                            .onTapGesture {
                                hideKeyboard()
                                presentClouds()
                                changeSceneWithDelay(scene: 0)
                                setCloudsFalse()
                            }
                        // CloudView()
                        
                    }
                    
                case 2:
                    
                    Response2View()
                        .offset(y: -50)
                        .overlay(alignment: .topLeading) {
                            Button {
                                presentClouds()
                                changeSceneWithDelay(scene: 0)
                                setCloudsFalse()
                                
                            } label: {
                                HStack {
                                    Image(systemName: "arrow.backward.circle")
                                        .symbolEffect(.bounce, value: scenePresentedVM.counterForAnimation)
                                        .font(.title)
//                                        .scaleEffect(x: 1.1, y: 1.1)
                                        .foregroundStyle(Color.white)
                                        .padding([.top, .leading, .bottom])
                                        .padding(.trailing, 5)
                                        .clipShape(Circle())
                                        
                                    VStack(alignment: .leading) {
                                        Text("Express more")
                                         
                                    }  
                                    .shadow(color: .black, radius: 30)
                                    .foregroundStyle(Color.white)
                                        
                                    
                                    Spacer()
                                }
                            }
                        }
                    
                    
                    
                default:
                    IdleView()
                        .offset(y: -50)
                }
                
                Spacer()
            }
            .ignoresSafeArea(.keyboard)
            .onTapGesture {
                hideKeyboard()
                //  scenePresentedVM.scenePresented = 0
            }
            
            
            
            if scenePresentedVM.scenePresented == 0 || scenePresentedVM.scenePresented == 1{
                
                VStack {
                    Spacer()
                    PottyIdleTextView()
                    textEditor
                        .onTapGesture() {
                            scenePresentedVM.showClouds = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                scenePresentedVM.scenePresented = 1
                            }
                            
                            
                        }
                    //                    Button("GetResponse"){
                    //                        hideKeyboard()
                    //                        presentClouds()
                    //                        changeSceneWithDelay(scene: 2)
                    //                        print("Text: \(userInputText.userInput)")
                    //                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    //                            showClouds = false
                    //                        }
                    //
                    //
                    //                    }
                    //                    .foregroundStyle(.white)
                }
                
            }
            if scenePresentedVM.showClouds{
                CloudView()
            }
            
        }
    }
}

#Preview {
    MainView()
        .environment(ScenePresentedViewModel())
        .environment(UserInput())
        .environment(ViewModel())
}

extension View {
    
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {
            
            ZStack(alignment: alignment) {
                placeholder().opacity(shouldShow ? 1 : 0)
                self
            }
        }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


struct TextEditorView: View {
    @Environment(UserInput.self) private var userInput
    @Environment(ScenePresentedViewModel.self) private var scenePresentedVM
    @Environment(ViewModel.self) private var viewModel
    @State private var userText = ""
    
    func saveText(){
        userInput.savedText = userInput.userInput
        print(userInput.savedText)
    }
    
    func presentClouds(){
        scenePresentedVM.showClouds = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
            scenePresentedVM.showClouds = true
        }
    }
    
    func changeSceneWithDelay(scene: Int){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            scenePresentedVM.scenePresented = scene
        }
    }
    
    var body: some View {
        
        let butto = Button(action: {
                DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
                    scenePresentedVM.counterForAnimation = 1
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    scenePresentedVM.counterForAnimation = 2
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    scenePresentedVM.counterForAnimation = 3
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    scenePresentedVM.counterForAnimation = 4
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    scenePresentedVM.counterForAnimation = 5
                }
            userInput.savedText = userText
            userText = ""
            viewModel.analyzeSentimentButtonTapped(userInput.savedText)
            hideKeyboard()
            presentClouds()
            changeSceneWithDelay(scene: 2)
            print(userInput.savedText)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                scenePresentedVM.showClouds = false
            }
        }, label: {
            ZStack{
                Circle()
                Image(systemName: "paperplane.fill")
                    .rotationEffect(.degrees(45))
                    .offset(x: -2)
                    .foregroundStyle(.white)
            }
            .frame(width: 30, height: 30)
            
        })
            TextEditor(text: $userText)
                .placeholder(when: userText.isEmpty, placeholder: {
                    VStack{
                        Label("Tell me your feelings here... ", systemImage: "pencil.line")
                            .foregroundStyle(Color.gray)
                            .padding([.top, .trailing], 7.0)
                        Spacer()
                    }
                })
                .padding(EdgeInsets(top: 4, leading: 10, bottom: 10, trailing: 10))
                .lineLimit(4)
                .textFieldStyle(.roundedBorder)
                .foregroundStyle(Color("purpleTextColor"))
                .scrollContentBackground(.hidden)
                .background(Color(.white))
                .frame(height: 120)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .padding()
                .overlay(alignment: .bottomTrailing) {
                    butto
                        .opacity(scenePresentedVM.scenePresented == 1 ? 1 : 0)
                        .padding([.bottom, .trailing], 20.0)
                    
                }
                    
                }
        }
    




