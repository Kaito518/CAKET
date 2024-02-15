//
//  ContentView.swift
//  Caket
//
//  Created by 肥後凱斗 on 2024/01/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = TaskViewModel()
    
    var body: some View {
        Task1DayView(viewModel: viewModel)
    }
}

#Preview {
    ContentView()
}
