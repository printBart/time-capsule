//
//  CapsuleView.swift
//  timecapsule
//
//  Created by James Lee on 2020-11-21.
//

import SwiftUI

struct CapsuleView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    let columns = [
        GridItem(.adaptive(minimum: UIScreen.main.bounds.width/3))
    ]
    var body: some View {
        ZStack{
            Image("space-clean-background").resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all).frame(maxWidth: UIScreen.main.bounds.width)
            VStack{
                HStack{
                    Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
                        Image(systemName: "chevron.left").font(.system(size: 25))
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    Text("Title Capsule").foregroundColor(.white).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }.padding()
                ScrollView(showsIndicators: false){
                    LazyVGrid(columns: columns, spacing: 20){
                        ForEach((1...5), id: \.self){
                            capsuleitem in
                            VStack(alignment: .leading){
                                Text("testing but I").multilineTextAlignment(.leading).foregroundColor(.white)
                                Spacer()
                            }.padding(10).frame(width: UIScreen.main.bounds.width/2.5, height: UIScreen.main.bounds.height/3).background(Color(red: 19/255, green: 46/255, blue: 75/255)).cornerRadius(5)
                        }
                    }.padding(.horizontal)
                }
                Spacer()
            }
        }.navigationBarTitle("").navigationBarHidden(true).edgesIgnoringSafeArea(.bottom)
    }
}

struct CapsuleView_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleView()
    }
}
