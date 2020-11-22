//
//  AddView.swift
//  timecapsule
//
//  Created by James Lee on 2020-11-21.
//

import SwiftUI

struct AddView: View {
    init() {
        UINavigationBar.appearance().isUserInteractionEnabled = false
        UINavigationBar.appearance().backgroundColor = .clear
        UINavigationBar.appearance().barTintColor = .clear
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().tintColor = .clear
    }

    var body: some View {
        NavigationView{
            ZStack{
                Image("space-background").resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Build a New Capsule").foregroundColor(.white).font(.system(size: 35)).fontWeight(.bold).padding()
                    Spacer()
                    HStack{
                        Spacer()
                        NavigationLink(
                            destination: AddText(),
                            label: {
                                VStack(spacing: 10){
                                    Image(systemName: "doc.plaintext").font(.system(size: 35)).foregroundColor(.white)
                                    Text("Text").foregroundColor(.white).fontWeight(.bold)
                                }
                            })
                        Spacer()
                        VStack(spacing: 10){
                            Image(systemName: "photo.on.rectangle").font(.system(size: 35)).foregroundColor(.white)
                        Text("Image").foregroundColor(.white).fontWeight(.bold)
                        }
                        Spacer()
                        VStack(spacing: 10){
                            Image(systemName: "video.badge.plus.fill").font(.system(size: 35)).foregroundColor(.white)
                            Text("Video").foregroundColor(.white).fontWeight(.bold)
                        }
                        Spacer()
                    }
                    //Spacer()
                    Spacer()
                    NavigationLink(
                        destination: CapsuleListView(),
                        label: {
                            Text("My Capsules").fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                                .padding().background(Color(red: 18/255, green: 33/255, blue: 60/255, opacity: 0.9)).foregroundColor(.white).cornerRadius(25)
                        }).buttonStyle(PlainButtonStyle())
                    Spacer()
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
