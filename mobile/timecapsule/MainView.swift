//
//  MainView.swift
//  timecapsule
//
//  Created by James Lee on 2020-11-21.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var globalData: GlobalData
    var body: some View {
        NavigationView{
            if(self.globalData.isAuthenticated){
                AddView().navigationBarTitle("")
                    .navigationBarHidden(true)
            }
            else{
                AuthView().navigationBarTitle("")
                    .navigationBarHidden(true)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
