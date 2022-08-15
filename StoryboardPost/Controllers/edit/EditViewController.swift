import Alamofire
import UIKit

class EditViewController: BaseViewController {
    
    @IBOutlet weak var nText: UITextField!
    @IBOutlet weak var btext: UITextField!
    
    var viewModel = EditViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       initViews()
    }


    
    // MARK: - Methods
    
    func initViews()  {
        nText.text = viewModel.editPost?.title
        btext.text = viewModel.editPost?.body
    }

  
    
    @IBAction func editTapped(_ sender: Any) {
        viewModel.apiEditPost(post: Post(id: (viewModel.editPost?.id!)!, title: nText.text!, body: btext.text!))
        self.navigationController?.dismiss(animated: true)
    }
    

}
