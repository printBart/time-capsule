//
//  GlobalData.swift
//  timecapsule
//
//  Created by James Lee on 2020-11-24.
//

import Foundation
import SwiftUI
import Combine

final class GlobalData: ObservableObject  {
    @Published var isAuthenticated = false
    @Published var userId = ""
}
