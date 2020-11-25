//
//  SettingsView.swift
//  timecapsule
//
//  Created by James Lee on 2020-11-24.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var globalData: GlobalData
    var body: some View {
        ZStack{
            Color(red: 24/255, green: 44/255, blue: 80/255).ignoresSafeArea()
            VStack{
                Rectangle()
                    .fill(Color(red: 36/255, green: 65/255, blue: 119/255)).frame(width: UIScreen.main.bounds.width/3, height: 5).cornerRadius(25).padding()
                VStack(alignment: .leading, spacing: 20){
                    HStack{
                        Image(systemName: "bell.fill").padding(.trailing)
                        Text("Notifications")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    HStack{
                        Image(systemName: "questionmark.circle.fill").padding(.trailing)
                        Text("Help")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    HStack{
                        Image(systemName: "info.circle.fill").padding(.trailing)
                        Text("About")
                        Spacer()
                        Image(systemName: "chevron.right")
                    }
                    Spacer()
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                        self.globalData.isAuthenticated = false
                    }){
                        Text("Logout").bold()
                    }
                }.foregroundColor(.white).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading).padding().font(.system(size: 20))
                Spacer()
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
