import Foundation

class DetailViewModel {
    
    let name : String
    let username: String
    let email: String
    let phone: String
    
    let street: String
    let suite: String
    let city: String
    
    init(user: User) {
        self.name = user.name
        self.username = user.username
        self.email = user.email
        self.phone = user.phone
        
        self.street = user.address.street
        self.suite = user.address.suite
        self.city = user.address.city
    }
}
