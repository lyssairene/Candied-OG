//
//  ViewController.swift
//  Candied OG
//
//  Created by Alyssa Pollard on 10/7/23.

import SwiftUI
//import Firebase

struct ViewController: View {
    @State private var email = ""
    @State private var password = ""
    @State private var wrongEmail = false
    @State private var wrongPassword = false
    @State private var userIsOnline = false
    
    var body: some View {
        if userIsOnline{
            ListView()
        }else{
            content
        }
    }
    
    var content: some View {
        NavigationView {
            ZStack {
                Color.purple
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)
                Circle()
                    .scale(1.1)
                    .foregroundColor(.white)
                VStack {
                    Text("Candied POS")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    TextField("Email", text: $email)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(wrongEmail ? Color.red : Color.clear)
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color.black.opacity(0.05))
                        .cornerRadius(10)
                        .border(wrongPassword ? Color.red : Color.clear)
                    Button("Login") {
                        login()
                    }
                    .foregroundColor(.white)
                    .frame(width: 300, height: 50)
                    .background(Color.purple)
                    .cornerRadius(10)
                    
                    Button {
                        register()
                    } label: {
                        Text("Don't have an account? Sign up!")
                            .bold()
                            .foregroundColor(.purple)
                    }
                    .padding(.top)
                    .offset(y: 11)
                }
                .frame(width: 350)
                .onAppear {
                    Auth.auth().addStateDidChangeListener { auth, user in
                        if user != nil {
                            userIsOnline.toggle()
                        }
                    }
                }
            }
            .ignoresSafeArea()
        }
    }
    
    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewController()
    }
}

