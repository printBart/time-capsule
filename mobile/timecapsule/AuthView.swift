//
//  AuthView.swift
//  timecapsule
//
//  Created by James Lee on 2020-11-23.
//

import SwiftUI

struct AuthView: View {
    @State var test = 0;
    var body: some View {
        ZStack{
            Image("space-clean-background").resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all).frame(maxWidth: UIScreen.main.bounds.width)
            VStack{
                NavigationLink(destination: LoginView()){
                    HStack{
                        Image(systemName: "envelope").foregroundColor(.gray).font(Font.system(size: 20, weight: .medium))
                        Spacer()
                        Text("Sign in with Email").fontWeight(.bold).foregroundColor(Color(red: 24/255, green: 44/255, blue: 80/255))
                        Spacer()
                    }.padding().frame(width: UIScreen.main.bounds.width-20).background(Color.white).cornerRadius(25)
                }.buttonStyle(PlainButtonStyle())
                Button(action: {test = test+1}){
                    HStack{
                        Image("googleicon").resizable().frame(width: 20, height: 20)
                        Spacer()
                        Text("Continue with Google").fontWeight(.bold).foregroundColor(Color(red: 24/255, green: 44/255, blue: 80/255))
                        Spacer()
                    }.padding().frame(width: UIScreen.main.bounds.width-20).background(Color.white).cornerRadius(25)
                }.buttonStyle(PlainButtonStyle())
            }
        }
    }
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
