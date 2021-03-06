//
//  CapsuleListView.swift
//  timecapsule
//
//  Created by James Lee on 2020-11-21.
//

import SwiftUI

struct CapsuleListView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

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
                    Text("My Capsules").foregroundColor(.white).fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    Spacer()
                    Button(action: {self.presentationMode.wrappedValue.dismiss()}) {
                        Image(systemName: "plus.square").font(.system(size: 25))
                    }
                }.padding()
                ScrollView(showsIndicators: false){
                    ForEach((1...10), id: \.self){
                        capsule in
                        NavigationLink(destination: CapsuleView()){
                            HStack{
                                Image(systemName: "lock.fill").foregroundColor(.gray).font(.system(size: 25))
                                Image(systemName: "doc.circle.fill").foregroundColor(.white).font(.system(size: 75)).padding([.leading,.trailing])
                                VStack(alignment: .leading){
                                    Text("This is the title").foregroundColor(.white).fontWeight(.bold).font(.system(size: 20))
                                    Text("Dec 12 2019").foregroundColor(.white).fontWeight(.semibold)
                                }
                                Spacer()
                                Image(systemName: "chevron.right").foregroundColor(.white).font(Font.title.weight(.semibold))
                            }.padding([.top, .bottom])
                        }.buttonStyle(PlainButtonStyle())
                    }.listRowBackground(Color.clear)
                }.padding()
                Spacer()
            }
        }.navigationBarTitle("").navigationBarHidden(true).edgesIgnoringSafeArea(.bottom)
    }
}

struct CapsuleListView_Previews: PreviewProvider {
    static var previews: some View {
        CapsuleListView()
    }
}
