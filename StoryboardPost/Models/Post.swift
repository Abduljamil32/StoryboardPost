

import Foundation

class Post: Decodable {
    
    var id: String? = ""
    var name: String? = ""
    var phone: String? = ""
    
    init(name: String, phone: String){
        
        self.name = name
        self.phone = phone
    }
}
