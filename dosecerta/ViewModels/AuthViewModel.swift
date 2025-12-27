import Foundation
import FirebaseAuth
import FirebaseFirestore

@Observable
class AuthViewModel {
    private var db = Firestore.firestore()
    var email = ""
    var password = ""
    var name = ""
    var birthDate = Date()
    var isSignUp = false
    var errorMessage = ""
    var showAlert = false
    
    var isFormValid: Bool {
        if isSignUp {
            return !name.isEmpty && !email.isEmpty && password.count >= 6 && email.contains("@")
        }
        return !email.isEmpty && !password.isEmpty
    }

    func authenticate() {
        if isSignUp {
            signUp()
            return
        }
        login()
    }

    func signUp() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                self.showAlert = true
                return
            }
            
            guard let uid = result?.user.uid else { return }
            
            let userData: [String: Any] = [
                "uid": uid,
                "name": self.name,
                "dateOfBirth": self.birthDate,
                "email": self.email,
                "createdAt": FieldValue.serverTimestamp()
            ]

            self.db.collection("users").document(uid).setData(userData) { error in
                if let error = error {
                    self.errorMessage = "Error while creating user: \(error.localizedDescription)"
                    self.showAlert = true
                }
            }
        }
    }
    
    private func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                self.showAlert = true
            }
        }
    }
}
