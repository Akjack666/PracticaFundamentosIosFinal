//
//  MemberDetailViewController.swift
//  Westeros
//
//  Created by Dani rica on 23/02/2019.
//  Copyright © 2019 Alexandre Freire. All rights reserved.
//

import UIKit

class MemberDetailViewController: UIViewController {

    @IBOutlet weak var memberName: UILabel!
    @IBOutlet weak var aliasMember: UILabel!
    @IBOutlet weak var houseMember: UILabel!
    @IBOutlet weak var imageHouseMember: UIImageView!
    var model: Person
    
    init(model: Person) {
        
        self.model = model
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        syncModelWithView()
        

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        syncModelWithView()
        // Nos damos de alta en las notificaciones
        // Tan pronto como te des de alta, implementa el código para darte de baja. Si no, te olvidarás
        let notificationCenter = NotificationCenter.default
        let name = Notification.Name(MEMBER_DID_CHANGE_NOTIFICATION_NAME)
        
        notificationCenter.addObserver(self,
                                       selector: #selector(memberDidChange(notification:)),
                                       name: name,
                                       object: nil) // Object es quien manda la notific
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // Nos damos de baja en las notificaciones
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    func syncModelWithView() {
        
    
        memberName.text = model.name
        aliasMember.text = model.alias
        houseMember.text = model.house.name
        imageHouseMember.image = model.house.sigil.image
        
    }
    
    @objc func memberDidChange(notification: Notification) {
        // Sacar el userInfo de la noti, y la casa del userInfo
        guard let info = notification.userInfo,
            let person = info[MEMBER_KEY] as? Person else {
                return
        }

        model = person
   
}

}

extension MemberDetailViewController: MemberListViewControllerDelegate {
    func memberListViewController(_ viewController: MemberListViewController, didSelectPerson person: Person) {
        self.model = person
        
        // Sincroniza modelo (el nuevo) con la vista
        syncModelWithView()
    }
    

}

