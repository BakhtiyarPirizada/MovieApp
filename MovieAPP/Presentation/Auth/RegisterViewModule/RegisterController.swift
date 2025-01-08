//
//  RegisterController.swift
//  RegisterScene
//
//  Created by Bakhtiyar Pirizada on 02.11.24.

import UIKit
class RegisterController: CoreController {
    private var ValidationMapping: [UITextField: RegisterViewModel.ValidationType] = [:]
    private var viewModel: RegisterViewModel
    init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented") }
    
    private lazy var emailText: ReusableText = {
        let t = ReusableText(title:"Valid email")
        t.translatesAutoresizingMaskIntoConstraints = false
        return t }()
    
    private lazy var passwordContainer: UIView = {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.layer.cornerRadius = 8
        container.addSubview(passwordText)
        container.addSubview(eyeButton)
        NSLayoutConstraint.activate([
            passwordText.topAnchor.constraint(equalTo: container.topAnchor),
            passwordText.leftAnchor.constraint(equalTo: container.leftAnchor),
            passwordText.rightAnchor.constraint(equalTo: container.rightAnchor),
            passwordText.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            
            eyeButton.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            eyeButton.rightAnchor.constraint(equalTo: container.rightAnchor, constant: -10),
            eyeButton.widthAnchor.constraint(equalToConstant: 24),
            eyeButton.heightAnchor.constraint(equalToConstant: 24),
        ])
        return container }()
    
    private lazy var passwordText: ReusableText = {
        let t = ReusableText(title:"Strong password")
        t.translatesAutoresizingMaskIntoConstraints = false
        return t }()
    
    private lazy var alreadyMemberLabel: UILabel = {
        let l = UILabel()
        l.text = "Already a member? Login"
        l.textAlignment = .center
        l.numberOfLines = 1
        l.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        l.textColor = .gray
        let attributedText = NSMutableAttributedString(string: l.text!)
        let range = (l.text! as NSString).range(of: "Login")
        attributedText.addAttribute(.foregroundColor, value: UIColor.blue, range: range)
        l.attributedText = attributedText
        l.isUserInteractionEnabled = true
        gestureRecognizer(to: l, action: #selector(showLogin))
        l.translatesAutoresizingMaskIntoConstraints = false
        return l }()
    
    private lazy var scrollView: UIScrollView = {
        let s = UIScrollView()
        s.translatesAutoresizingMaskIntoConstraints = false
        return s }()
    
    private lazy var stackView: UIStackView = {
        let s = UIStackView(arrangedSubviews: [emailText, passwordContainer])
        scrollView.addSubview(s)
        s.axis = .vertical
        s.spacing = 12
        s.translatesAutoresizingMaskIntoConstraints = false
        return s }()
    
    private lazy var eyeButton: UIButton = {
        let b = UIButton(type: .custom)
        b.setImage(UIImage(systemName: "eye"), for: .normal)
        b.setImage(UIImage(systemName: "eye.slash"), for: .selected)
        b.tintColor = .gray
        b.translatesAutoresizingMaskIntoConstraints = false
        b.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        return b }()
    
    private lazy var signUp: ReusableButton = {
        let b = ReusableButton(title: "Sign Up") {
            [weak self] in self?.signUpClicked()
        }
        b.translatesAutoresizingMaskIntoConstraints = false
        return b }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .fon
    }
    override func configureView() {
        super.configureView()
        [scrollView,signUp,alreadyMemberLabel].forEach {view.addSubview($0)}
        configureText()
        configureViewModel()
        setupMapping()
    }
    
    override func configureConstraint() {
        super.configureConstraint()
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
            scrollView.bottomAnchor.constraint(equalTo: signUp.topAnchor, constant: -52),
            emailText.heightAnchor.constraint(equalToConstant: 48),
            emailText.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            passwordContainer.heightAnchor.constraint(equalToConstant: 48),
            passwordContainer.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 0),
            stackView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 0),
            stackView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 0),
            stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            signUp.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            signUp.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            signUp.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -52),
            signUp.heightAnchor.constraint(equalToConstant: 48),
            alreadyMemberLabel.topAnchor.constraint(equalTo: signUp.bottomAnchor, constant: 8),
            alreadyMemberLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
            alreadyMemberLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
        ]) }
    
    private func configureViewModel() {
        viewModel.callback = { [weak self] state in
            guard let self else {return}
            switch state {
            case .loading:
                print(state)
            case .loaded:
                print(state)
            case .success:
                showAlert(title: "Success", message: "User has been created successfully")
            case .error(let message):
                showAlert(title: "Invalid Info", message: message)
            default: break
                
            }
        }
    }
    func setupMapping(){
        ValidationMapping = [
            emailText: .email,
            passwordText: .password,
            
        ]
    }
    private func checkValidation() {
        let fields: [(UITextField, RegisterViewModel.ValidationType)] = [
            (emailText, .email),
            (passwordText, .password)
        ]
        var isValid = true
        for (textField, validationType) in fields {
            guard let text = textField.text, !text.isEmpty else {
                textField.layer.borderColor = UIColor.red.cgColor
                isValid = false
                continue
            }
            if viewModel.validationType(value: text, type: validationType) {
                textField.layer.borderColor = UIColor.green.cgColor
            } else {
                textField.layer.borderColor = UIColor.red.cgColor
                isValid = false
            }
        }
        if !isValid {
            showAlert(title: "Error", message: "Please fix the errors in the highlighted fields.")
            return
        }
        guard let email = emailText.text,
              let pass = passwordText.text else { return }
        viewModel.createUser(email: email, pass: pass)
    }
    
    private func configureText() {
        [emailText,passwordText].forEach {$0.delegate = self}
    }
    
    @objc private func signUpClicked() {
        checkValidation()
    }
    
    @objc private func togglePasswordVisibility() {
        passwordText.isSecureTextEntry.toggle()
        eyeButton.isSelected.toggle()
    }
    
    @objc private func showLogin(){
        viewModel.showLogin()
    }
}

extension RegisterController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let validationType = ValidationMapping[textField] else { return }
        let isValid = viewModel.validationType(value: textField.text ?? "", type: validationType)
        textField.layer.borderColor = isValid ? UIColor.green.cgColor : UIColor.red.cgColor
    }
}


