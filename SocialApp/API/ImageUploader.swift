//
//  ImageUploader.swift
//  SocialApp
//
//  Created by MadCow on 2023/12/14.
//

import FirebaseStorage

struct ImageUploader {
    // TODO: @escaping이란?
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void) {
        // MARK: compressionQuality: 고용량의 이미지는 서버 비용이 상승하니 압축하여 quality를 낮춰주는 역할
        guard let imageData = image.jpegData(compressionQuality: 0.6) else { return }
        let fileName = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images\(fileName)")
        
        ref.putData(imageData, metadata: nil) { FIRStorage, error in
            if let error = error {
                print("DEBUG: Failed upload image : \(error.localizedDescription)")
                return
            }
            
            ref.downloadURL { URL, error in
                guard let imageUrl = URL?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
