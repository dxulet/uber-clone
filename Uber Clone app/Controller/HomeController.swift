//
//  HomeController.swift
//  Uber Clone app
//
//  Created by Daulet Ashikbayev on 22.07.2022.
//

import UIKit
import Firebase
import MapKit

class HomeController: UIViewController {
    
    //MARK: - Properties
    
    private let mapView = MKMapView()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
    }
    
    //MARK: - API
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginController())
                if #available(iOS 13.0, *) {
                    nav.isModalInPresentation = true
                }
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        } else {
            configureUI()
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("DEBUG: Error signing out")
        }
    }
    
    //MARK: - Helper Functions
    
    func configureUI() {
        view.addSubview(mapView)
        mapView.frame = view.frame
    }
    
}
