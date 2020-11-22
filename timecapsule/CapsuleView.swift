//
//  CapsuleView.swift
//  timecapsule
//
//  Created by James Lee on 2020-11-21.
//

import SwiftUI

struct CapsuleView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        ZStack{
            Image("space-clean-background").resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all).frame(maxWidth: UIScreen.main.bounds.width)
            VStack{
                HStack{
                    Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
                        Text("Back")
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
                Spacer()
            }
        }.navigationBarTitle("").navigationBarHidden(true)
    }
}

struct CapsuleView_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleView()
    }
}
