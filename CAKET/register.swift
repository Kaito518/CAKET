//
//  register.swift
//  CAKET
//
//  Created by 肥後凱斗 on 2024/01/11.
//

import SwiftUI
import Firebase

class RegistrationViewModel: ObservableObject {
    @Published var password: String = ""
    @Published var email: String = ""
    @Published var isRegistered: Bool = false
    
    // 登録成功時に呼び出されるクロージャ
    var onRegistrationSuccess: (() -> Void)?

    func registerUser() {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                // エラーハンドリング
                print(error.localizedDescription)
            } else if let user = authResult?.user {
                // 登録成功の処理
                print("User created: \(user.uid)")
                DispatchQueue.main.async {
                    // 登録完了の状態をtrueにする
                    self.isRegistered = true
                }
            }
        }
    }
}

struct register: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel = RegistrationViewModel()
    
    var body: some View {
        ZStack() {
          Text("Register")
            .font(Font.custom("Niconne", size: 64))
            .foregroundColor(Color(red: 0.52, green: 0.52, blue: 0.52))
            .offset(x: -0.50, y: -311.50)
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 171.01, height: 1)
            .overlay(Rectangle()
            .stroke(.white, lineWidth: 2))
            .offset(x: -0.99, y: -270.30)
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
            
          Rectangle()
            .foregroundColor(.clear)
            .frame(width: 215, height: 50)
            .background(.white)
            .cornerRadius(12)
            .offset(x: 0, y: 285)
            
            // 登録ボタン
            Button(action: {
                // ViewModelのregisterUserメソッドを呼び出す
                viewModel.registerUser()
            }) {
                Text("Create Register")
                    .font(Font.custom("Niconne", size: 36))
                    .foregroundColor(Color(red: 0.53, green: 0.52, blue: 0.52))
            }
            .frame(width: 215, height: 50)
            .background(Color.white)
            .cornerRadius(12)
            .offset(x: 0, y: 285)
            
            NavigationLink(destination: login().navigationBarBackButtonHidden(true), isActive: $viewModel.isRegistered) {
                    EmptyView()
                }
           }
        .frame(width: 393, height: 915)
        .background(Color(red: 0.74, green: 0.92, blue: 1))
        .cornerRadius(36)
    }
}

struct register_Previews: PreviewProvider {
    static var previews: some View {
        register()
    }
}
