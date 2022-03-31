//
//  Camera.swift
//  Alura Ponto
//
//  Created by Rogerio Cardoso Filho on 31/03/22.
//

import Foundation
import UIKit

protocol CameraDelegate: AnyObject {
    func didSelectFoto(_ image: UIImage)
}

class Camera: NSObject {
    
    weak var delegate: CameraDelegate?
    
    func abrirCamera(_ controller: UIViewController, _ imagePicker: UIImagePickerController) {
        
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .camera
        imagePicker.cameraDevice = UIImagePickerController.isCameraDeviceAvailable(.front) ? .front : .rear
        
        controller.present(imagePicker, animated: true, completion: nil)
    }
}

extension Camera: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        picker.dismiss(animated: true)
        
        guard let foto = info[.editedImage] as? UIImage else { return }
        
        delegate?.didSelectFoto(foto)
        
    }
}
