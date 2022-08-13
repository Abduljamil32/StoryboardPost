

import Foundation

class Post: Decodable {
    
    var id: String? = ""
    var title: String? = ""
    var body: String? = ""
//    var userId: Int?
    
    init(title: String, body: String){
        
        self.title = title
        self.body = body
    }
    
    init(id: String, title: String, body: String){
        self.id = id
        self.title = title
        self.body = body
    }
   
}
