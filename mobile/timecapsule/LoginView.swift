//
//  LoginView.swift
//  timecapsule
//
//  Created by James Lee on 2020-11-23.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var globalData: GlobalData
    var body: some View {
        ZStack{
            Image("space-clean-background").resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all).frame(maxWidth: UIScreen.main.bounds.width)
            VStack{
                Spacer()
                Text("Time Capsule").tracking(5).foregroundColor(.white).bold().padding().font(.system(size: 30))
                ZStack(alignment: .leading){
                    if(email.isEmpty){
                        Text("Email").foregroundColor(.gray).padding(10)
                    }
                    TextField("", text: $email).foregroundColor(.white)
                        .frame(height: 50).padding([.leading, .trailing], 10)
                        .background(Color(red: 19/255, green: 46/255, blue: 75/255, opacity: 0.5)).cornerRadius(5).autocapitalization(.none)
                }
                ZStack(alignment: .leading){
                    if(password.isEmpty){
                        Text("Password").foregroundColor(.gray).padding(10)
                    }
                    SecureField("", text: $password).foregroundColor(.white)
                        .frame(height: 50).padding([.leading, .trailing], 10)
                        .background(Color(red: 19/255, green: 46/255, blue: 75/255, opacity: 0.5)).cornerRadius(5).autocapitalization(.none)
                }
                Spacer()
                Spacer()
                Button(action: {self.globalData.isAuthenticated = true}){
                    Text("Log in").bold().padding(10).frame(width: UIScreen.main.bounds.width-40).background(Color(UIColor.systemBlue)).foregroundColor(.white).cornerRadius(5)
                }
                Spacer()
            }.padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
