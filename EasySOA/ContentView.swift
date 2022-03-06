//
//  ContentView.swift
//  EasySOA
//
//  Created by Alex Golovenkov on 05.03.2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var model: UserInfoManager
    @State var english = true
    @State var isAlert: Bool = false
    @State var errorText: String?
    
    var body: some View {
        VStack (spacing: 50) {
            let background = model.isLoading ? Color.gray : Color.black
            UserDetails(user: $model.user)
                .foregroundColor(background)
            
            HStack(alignment: .center, spacing: 10) {
                Text("Russian")
                Toggle("", isOn: $english)
                    .frame(width: 50)
                    .onChange(of: english) { newValue in
                        replaceService(isEnglish: newValue)
                    }
                Text("English")
            }
            
            Button("Error request") {
                generateError()
            }
            .alert(isPresented: $isAlert) {
                Alert(title: Text("Error"), message: Text(errorText ?? ""), dismissButton: .cancel())
            }
        }
    }
    
    func replaceService(isEnglish: Bool) {
        if isEnglish {
            UserInfoManager.shared.userService = EnglishUserService()
        } else {
            UserInfoManager.shared.userService = RussianUserService()
        }
        load()
    }
    
    func generateError() {
        UserInfoManager.shared.userService = ErrorService()
        load()
    }
    
    func load() {
        Task {
            do {
                try await UserInfoManager.shared.load()
            } catch {
                errorText = (error as NSError).description
                isAlert = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @State static var model = UserInfoManager.shared
    static var previews: some View {
        ContentView()
            .onAppear {
                model.user.firstName = "Demo"
                model.user.lastName = "User"
                model.user.likesCount = 13
            }
            .environmentObject(model)
    }
}
