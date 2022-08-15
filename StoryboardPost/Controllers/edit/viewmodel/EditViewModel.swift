//
//  EditViewModel.swift
//  StoryboardPost


import Foundation
import Bond


class EditViewModel{
    var controller: BaseViewController!
    var editPost: Post?
    
    func apiEditPost(post: Post){
        controller?.showProgress()
        AFHttp.put(url: AFHttp.API_POST_UPDATE + post.id!, params: AFHttp.paramsPostUpdate(post: post), handler: { response in
            self.controller?.hideProgress()
            switch response.result{
            case .success:
                print(response.result)
                
            case let .failure(error):
                print(error)
            }
        })
    }
    
    
}
