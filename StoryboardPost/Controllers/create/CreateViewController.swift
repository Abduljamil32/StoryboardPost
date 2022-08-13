

import UIKit
import Alamofire

class CreateViewController: BaseViewController {
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var bodyText: UITextField!
    var viewModel = CreateViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
    }

    // MARK: - Methods
    

    
    
    // MARK: - Actions
    
    @IBAction func createBut(_ sender: Any) {
        viewModel.apiCreatePost(post: Post(title: titleText.text!, body: bodyText.text!))
        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
