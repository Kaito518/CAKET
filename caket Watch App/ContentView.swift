//
//  ContentView.swift
//  caket Watch App
//
//  Created by 肥後凱斗 on 2024/01/25.
//

import SwiftUI

import WatchConnectivity

class WatchConnectivityProvider: NSObject, WCSessionDelegate, ObservableObject {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    @Published var receivedMessage: String = ""
    
    override init() {
        super.init()
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        DispatchQueue.main.async { [weak self] in
            self?.receivedMessage = message["message"] as? String ?? "不明なメッセージ"
        }
    }
    
    // Other WCSessionDelegate methods...
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")

        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)

        let r = Double((rgb >> 16) & 0xFF) / 255.0
        let g = Double((rgb >> 8) & 0xFF) / 255.0
        let b = Double(rgb & 0xFF) / 255.0

        self.init(red: r, green: g, blue: b)
    }
}

struct ContentView: View {
    @State private var presentTask1Day = false
    @State private var walkAnimation = false
    @State private var OptionHome = false
    
    @State private var inputMessage: String = "" // 入力されたメッセージ
    @State private var showingMessageDialog = false // メッセージダイアログを表示するかどうかのフラグ
    
    @ObservedObject var connectivityProvider = WatchConnectivityProvider()
    
    @State private var moveDistance: CGFloat = 0 // 移動距離
    let maxDistance: CGFloat = 100 // 最大移動距離
    
    @State private var penguinOffset: CGFloat = 0
    let penguinWalkRange: CGFloat = 100
    
    @State private var imageIndex = 0 // 表示する画像のインデックス
    
    let penguinImages = ["small_pengin", "rightpengin"]  // ペンギンの画像名
    
    let penguinMessages = ["こんにちは！", "今日もいい天気ですね！", "お腹がペコペコです！", "あなたのお名前は？", "今は何をしているの？"]
    
    @State private var currentMessage = "こんにちは！" // 初期のメッセージ
    
    // 再利用するためにアニメーションを定義
    let walkCycle = Animation.linear(duration: 0.5).repeatForever(autoreverses: true)
    // ペンギンの画像に適用するアニメーションのトリガー
    @State private var swingAnimation = false
    
    @State private var isPenguinJumping = false
    
    @State private var userMessage: String = "" // ユーザーの入力メッセージ
    @State private var showMessageField = false // メッセージ入力フィールドを表示するかどうか
    
    @State private var scale: CGFloat = 1.0
    
    func formattedDate() -> String {
       let formatter = DateFormatter()
       formatter.dateFormat = "yyyy年MM月dd日"
       return formatter.string(from: Date())
    }

    var body: some View {
        ZStack {
            // 背景画像
            GeometryReader { geometry in
                Image("haikei")
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
                    .edgesIgnoringSafeArea(.all)
            }
            
            // コンテンツ
            ScrollView {
                VStack {
                    // 日付の表示
                    Text(formattedDate())
                        .padding()
                        .foregroundColor(.black) // テキストの色を黒に設定
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(10)
                    
                    // ペンギンの画像の表示
                    Image(penguinImages[imageIndex])
                        .resizable()
                        .frame(width: 100, height: 120)
                        // より高くジャンプ
                        .offset(x: swingAnimation ? 20 : -20, y: isPenguinJumping ? -20 : 0)
                    
                        .onAppear {
                                // アニメーションのトリガーを設定
                                swingAnimation.toggle()

                        let timer = Timer(timeInterval: 1, repeats: true) { _ in // アニメーションの間隔を短くした
                            withAnimation(walkCycle) {
                                self.swingAnimation.toggle()
                            }
                            self.imageIndex = self.imageIndex == 0 ? 1 : 0
                        }
                        RunLoop.current.add(timer, forMode: .common)
                        
                    }
                    // 現在のメッセージを表示
                    Text(connectivityProvider.receivedMessage)
                        .padding()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
