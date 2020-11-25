//
//  RegisterPasswordView.swift
//  timecapsule
//
//  Created by James Lee on 2020-11-24.
//

import SwiftUI

struct RegisterPasswordView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var password = ""
    @State private var confirmpassword = ""
    @EnvironmentObject var globalData: GlobalData
    var body: some View {
        ZStack{
            Image("space-clean-background").resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all).frame(maxWidth: UIScreen.main.bounds.width)
            VStack{
                HStack{
                    Button(action: {self.presentationMode.wrappedValue.dismiss()}){
                    Image(systemName: "chevron.left").font(Font.system(size: 20, weight: .semibold))
                    }
                    Spacer()
                }.foregroundColor(.blue)
                Text("Create a Password").tracking(2).foregroundColor(.white).padding().font(.system(size: 30))
                ZStack(alignment: .leading){
                    if(password.isEmpty){
                        Text("Password").foregroundColor(.gray).padding(10)
                    }
                    TextField("", text: $password).foregroundColor(.white)
                    .frame(height: 50).padding([.leading, .trailing], 10)
                    .background(Color(red: 19/255, green: 46/255, blue: 75/255, opacity: 0.5)).cornerRadius(5).autocapitalization(.none)
                }
                ZStack(alignment: .leading){
                    if(confirmpassword.isEmpty){
                        Text("Confirm Password").foregroundColor(.gray).padding(10)
                    }
                    TextField("", text: $confirmpassword).foregroundColor(.white)
                    .frame(height: 50).padding([.leading, .trailing], 10)
                    .background(Color(red: 19/255, green: 46/255, blue: 75/255, opacity: 0.5)).cornerRadius(5).autocapitalization(.none)
                }
                Spacer()
                Button(action: {self.globalData.isAuthenticated = true}){
                    Text("Register").bold().padding(10).frame(width: UIScreen.main.bounds.width-40).background(Color(UIColor.systemBlue)).foregroundColor(.white).cornerRadius(5)
                }
            }.padding()
        }.navigationBarTitle("").navigationBarHidden(true)
    }
}

struct RegisterPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPasswordView()
    }
}
