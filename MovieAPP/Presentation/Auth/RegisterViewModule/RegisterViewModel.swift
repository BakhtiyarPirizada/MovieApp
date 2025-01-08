//
//  RegisterViewModel.swift
//  MovieAPP
//
//  Created by Bakhtiyar Pirizada on 06.01.25.
//
import Foundation

final class RegisterViewModel {
    enum ViewState {
        case loading
        case loaded
        case success
        case error(String)
        case fieldValid(ValidationType)
        case fieldError(ValidationType)
    }
    enum ValidationType {
        case email , password
    }
    private var check: [ValidationType: Bool] = [
        .password: false,
        .email: false,
    ]
    var callback:((ViewState)->Void)?
    private let navigation: AuthNavigation
    
    init(navigation: AuthNavigation?) {
        self.navigation = navigation!
    }
    func createUser(email: String, pass: String) {
        self.callback?(.loading)
        FirebaseHelper.shared.registerUser(email: email, password: pass) { [weak self] result in
            guard let self = self else { return }
            self.callback?(.loaded)
            switch result {
            case .success(_):
                self.callback?(.success)
                showHome()
            case .failure(let error):
                print("Registration failed: \(error.localizedDescription)")
                self.callback?(.error((error.localizedDescription)))
            }
        }
    }
    func validationType (value: String , type: ValidationType) -> Bool {
        let isValid: Bool
        switch type {
        case .email:
            isValid = value.isValidEmail()
        case .password:
            isValid = value.isValidPassword()
        }
        
        check[type] = isValid
        
        if isValid {
            callback?(.fieldValid(type))
        } else {
            callback?(.fieldError(type))
        }
        
        return isValid
    }
    func showLogin() {
        navigation.showLogin()
    }
    func showHome() {
        navigation.showHome()
    }
    
}
