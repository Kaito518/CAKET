//
//  ContentView.swift
//  CAKET
//
//  Created by 肥後凱斗 on 2023/12/07.
//

import SwiftUI
import Firebase

class LoginViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    // ログイン成功時に画面遷移するためのフラグ
    @Published var isAuthenticated: Bool = false
    
    // ログイン処理
    func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                // エラーハンドリング
                print(error.localizedDescription)
            } else if authResult?.user != nil {
                // ログイン成功
                DispatchQueue.main.async {
                    self.isAuthenticated = true
                }
            }
        }
    }
}

struct login: View {
    @State private var isAuthenticated = false
    @StateObject var viewModel = LoginViewModel()

    var body: some View {
        NavigationView {
            ZStack {
                Group {
                    Text("Sign in")
                        .font(Font.custom("Niconne", size: 60))
                        .foregroundColor(Color(red: 0.52, green: 0.52, blue: 0.52))
                        .offset(y: -306.50)
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 171.01, height: 1)
                        .overlay(Rectangle().stroke(.white, lineWidth: 2))
                        .offset(x: 0, y: -270)
                    
                    ZStack {
                        Text("Email")
                            .font(Font.custom("Niconne", size: 36))
                            .foregroundColor(Color(red: 0.53, green: 0.52, blue: 0.52))
                            .offset(x: -119, y: -110)
                        TextField("Email", text: $viewModel.email)
                            .offset(x: 10, y: -70)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 300, height: 1)
                            .overlay(Rectangle().stroke(Color(red: 0.53, green: 0.52, blue: 0.52), lineWidth: 1))
                            .offset(x: -3, y: -57.50)
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 300, height: 1)
                            .overlay(Rectangle().stroke(Color(red: 0.53, green: 0.52, blue: 0.52), lineWidth: 1))
                            .offset(x: -3, y: 76.50)
                        
                        Text("password")
                            .font(Font.custom("Niconne", size: 36))
                            .foregroundColor(Color(red: 0.53, green: 0.52, blue: 0.52))
                            .offset(x: -95, y: 9.50)
                        SecureField("Password", text: $viewModel.password)
                            .offset(x: 10, y: 65)
                    }
                    .frame(width: 332, height: 283)
                    .overlay(Rectangle().inset(by: 2).stroke(.white, lineWidth: 4))
                    .offset(x: -0.50, y: -53.50)
                    
                    NavigationLink(destination: HomeView(viewModel: TaskViewModel()).navigationBarBackButtonHidden(true), isActive: $isAuthenticated) {
                                      EmptyView()
                                  }
                    
                    Button(action: {
                        // ログイン処理
                        viewModel.loginUser()
                    }) {
                        Text("Log in")
                            .font(Font.custom("Niconne", size: 40))
                            .foregroundColor(Color(red: 0.53, green: 0.52, blue: 0.52))
                    }
                    .frame(width: 203, height: 50)
                    .background(Color.white)
                    .cornerRadius(12)
                    .offset(x: 0, y: 179)
                    
                    NavigationLink(destination: HomeView(viewModel: TaskViewModel()), isActive: $viewModel.isAuthenticated) {
                                    EmptyView()
                        }
                    
                    NavigationLink(destination: register()) {
                        Text("Create Register")
                            .font(Font.custom("Niconne", size: 32))
                            .foregroundColor(Color(red: 0.53, green: 0.52, blue: 0.52))
                    }
                    .frame(width: 342, height: 45)
                    .background(Color.white)
                    .cornerRadius(12)
                    .offset(x: -5.50, y: 326.50)
                    
                    Text("新規登録")
                        .font(Font.custom("YuKyokasho Yoko", size: 24).weight(.medium))
                        .foregroundColor(Color(red: 0.53, green: 0.52, blue: 0.52))
                        .offset(x: -0.50, y: 268)
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 102, height: 1)
                        .overlay(Rectangle().stroke(Color(red: 0.53, green: 0.52, blue: 0.52), lineWidth: 0.50))
                        .offset(x: -125.50, y: 272)
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 89, height: 1)
                        .overlay(Rectangle().stroke(Color(red: 0.53, green: 0.52, blue: 0.52), lineWidth: 0.50))
                        .offset(x: 121, y: 272)
                }
            }
            .frame(width: 393, height: 880)
            .background(Color(red: 0.74, green: 0.92, blue: 1))
            .cornerRadius(36)
//            .navigationBarBackButtonHidden(true)
        }
    }
}

struct loginView_Previews: PreviewProvider {
    static var previews: some View {
        login()
    }
}



