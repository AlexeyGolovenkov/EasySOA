//
//  UserInfo.swift
//  EasySOA
//
//  Created by Alex Golovenkov on 06.03.2022.
//

import SwiftUI

struct UserDetails: View {
    @Binding var user: UserInfo
    var body: some View {
        VStack(spacing: 10) {
            Text("First name: \(user.firstName)")
            Text("Last name: \(user.lastName)")
            Text("Likes: \(user.likesCount)")
        }
    }
}

struct UserDetails_Previews: PreviewProvider {
    @State static var info = UserInfo(firstName: "Peter", lastName: "Mikhailov", likesCount: 52)
    static var previews: some View {
        UserDetails(user: $info)
    }
}
