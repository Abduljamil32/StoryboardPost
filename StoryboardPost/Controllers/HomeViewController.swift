//
//  HomeViewController.swift
//  StoryboardPost
//
//  Created by Avaz Mukhitdinov on 21/07/22.
//

import UIKit

class HomeViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    var items: Array<Post> = Array()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
        
    }
    
    // MARK: -- Methods
    
    func initViews() {
        tableView.dataSource = self
        tableView.delegate = self
        
        initNavs()
        
        items.append(Post(name: "Best Friend", phone: "+998 98 001 02 03"))
        items.append(Post(name: "Bro", phone: "+998 97 777 77 77"))
        items.append(Post(name: "Me", phone: "+998 93 998 86 89"))
    }
    
    func initNavs() {
        let refresh = UIImage(systemName: "arrow.clockwise")
        let add = UIImage(systemName: "plus")
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: refresh, style: .plain, target: self, action: #selector(leftTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: add, style: .plain, target: self, action: #selector(rightTapped))
        title = "Contacts"
    }
    
    func callCreateViewcontroller(){
        let vc = CreateViewController(nibName: "CreateViewController", bundle: nil)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func callEditViewController(){
        let vc = EditViewController(nibName: "EditViewController", bundle: nil)
        let navigationController = UINavigationController(rootViewController: vc)
        self.present(navigationController, animated: true, completion: nil)
    }
    
    
    // MARK: -- Actions
    
    @objc func leftTapped() {
        
    }
    
    @objc func rightTapped() {
        callCreateViewcontroller()
    }
    
    // MARK: -- Table View
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)-> Int{
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)-> UITableViewCell{
        let item = items[indexPath.row]
        
        let cell = Bundle.main.loadNibNamed("PostTableViewCell", owner: self, options: nil)?.first as! PostTableViewCell
        
        cell.titleLabel.text = item.name
        cell.bodyLabel.text = item.phone
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [
            makeCompleteContextualAction(forRowAt: indexPath, post: items[indexPath.row])
        ])
    }
    
    
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        return UISwipeActionsConfiguration(actions: [
            makeDeleteContextualAction(forRowAt: indexPath, post: items[indexPath.row])
        ])
    }
    
    
    
    // MARK: Contextual ACtions
    
    private func makeDeleteContextualAction(forRowAt indexPath: IndexPath, post: Post)-> UIContextualAction{
        return UIContextualAction(style: .normal, title: "Delete") { (action, swipeButtonView, completion) in
            print("Delete Here")
            
            completion(true)
            //            self.apiPostDelete(post: post)
        }
    }
    
    
    private func makeCompleteContextualAction(forRowAt indexPath: IndexPath, post: Post)-> UIContextualAction{
        return UIContextualAction(style: .normal, title: "Edit") { (action, swipeButtonView, completion) in
            print("Complete Here")
            
            completion(true)
            //            self.apiPostDelete(post: post)
            self.callEditViewController()
        }
    }
    
}
