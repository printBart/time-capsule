//
//  RegisterEmailView.swift
//  timecapsule
//
//  Created by James Lee on 2020-11-24.
//

import SwiftUI

struct RegisterEmailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var email = ""
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
                Text("Enter Email").tracking(2).foregroundColor(.white).padding().font(.system(size: 30))
                ZStack(alignment: .leading){
                    if(email.isEmpty){
                        Text("Email").foregroundColor(.gray).padding(10)
                    }
                    TextField("", text: $email).foregroundColor(.white)
                    .frame(height: 50).padding([.leading, .trailing], 10)
                    .background(Color(red: 19/255, green: 46/255, blue: 75/255, opacity: 0.5)).cornerRadius(5).autocapitalization(.none)
                }
                Spacer()
                NavigationLink(destination: RegisterPasswordView()){
                    Text("Next").bold().padding(10).frame(width: UIScreen.main.bounds.width-40).background(Color(UIColor.systemBlue)).foregroundColor(.white).cornerRadius(5)
                }
            }.padding()
        }.navigationBarTitle("").navigationBarHidden(true)
    }
}

struct RegisterEmailView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterEmailView()
    }
}
