//
//  CreateViewModel.swift
//  StoryboardPost


import Foundation
import Bond

class CreateViewModel{
    var controller: BaseViewController!
    

    func apiCreatePost(post: Post){
        controller?.showProgress()
        AFHttp.post(url: AFHttp.API_POST_CREATE, params: AFHttp.paramsPostCreate(post: post), handler: { response in
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
