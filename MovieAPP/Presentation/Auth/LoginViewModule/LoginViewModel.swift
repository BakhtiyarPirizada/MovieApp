//
//  LoginViewModel.swift
//  MovieAPP
//
//  Created by Bakhtiyar Pirizada on 06.01.25.
//

import Foundation

final class LoginViewModel {
    enum ViewState {
        case loading
        case loaded
        case success
        case error(String)
    }
    var callback: ((ViewState)->Void)?
    
    private let navigation:AuthNavigation
    init(navigation: AuthNavigation) {
        self.navigation = navigation
    }
   
    func loginValidation(email: String, pass: String){
        callback?(.loading)
        FirebaseHelper.shared.loginUser(email: email, password: pass) { [weak self] authResult in
            guard let self = self else { return }
            self.callback?(.loaded)
            switch authResult {
            case .success(_):
                self.callback?(.success)
                UserDefaults.standard.set(true, forKey: "islogin")
                showHome()
            case .failure(let error):
                self.callback?(.error((error.localizedDescription)))
            }
        }
    }
    func showHome() {
        navigation.showHome()
    }
    func showRegister() {
        navigation.showRegister()
    }
}
