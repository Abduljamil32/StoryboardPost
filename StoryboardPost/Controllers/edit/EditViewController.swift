import Alamofire
import UIKit

class EditViewController: BaseViewController {
    
    @IBOutlet weak var nText: UITextField!
    @IBOutlet weak var btext: UITextField!
    
    var viewModel = EditViewModel()
    
    var editPost: Post?
    
    override func viewDidLoad() {
        super.viewDidLoad()

       initViews()
    }


    
    // MARK: - Methods
    
    func initViews()  {
        nText.text = editPost?.title
        btext.text = editPost?.body
    }

  
    
    @IBAction func editTapped(_ sender: Any) {
        viewModel.apiEditPost(post: Post(id: (editPost?.id!)!, title: nText.text!, body: btext.text!))
        self.navigationController?.dismiss(animated: true)
    }
    

}
