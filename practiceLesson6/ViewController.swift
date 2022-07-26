//
//  ViewController.swift
//  practiceLesson6
//
//  Created by Александр Калашников on 25/7/22.
//

import UIKit

class ViewController: UIViewController {

    private lazy var testBtn: UIButton = {
        let view = UIButton()
        view.backgroundColor = .blue
        view.setTitle("Generate", for: .normal)
        return view
    }()
    
    enum generateErrors: Error {
        case noInternetConnection
        case proxyServerError
        case serviceUnavable
        case HTTPVersionNotSupported
        case notFound
        case gone
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        layout()
    }
    
    func layout() {
        view.addSubview(testBtn)
        testBtn.translatesAutoresizingMaskIntoConstraints = false
        testBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        testBtn.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        testBtn.widthAnchor.constraint(equalToConstant: 150).isActive = true
        testBtn.heightAnchor.constraint(equalToConstant: 60).isActive = true
        testBtn.addTarget(self, action: #selector(generateNum), for: .touchUpInside)
    }
            
    func randNum() throws {
        let num = Int.random(in: 200...599)
        
        switch num {
        case 200...299:
            let secondVC = SecondVC()
            navigationController?.pushViewController(secondVC, animated: true)
        case 299...349:
            throw generateErrors.noInternetConnection
        case 350...409:
            throw generateErrors.HTTPVersionNotSupported
        case 410...450:
            throw generateErrors.notFound
        case 451...499:
            throw generateErrors.proxyServerError
        case 500...552:
            throw generateErrors.serviceUnavable
        case 553...599:
            throw generateErrors.gone
        default:
            print("15 its ok")
        }
    }
    
    @objc func generateNum() throws {
            
        do {
            try randNum()
        } catch generateErrors.gone {
            let alert = UIAlertController(title: "Ошибка", message: "Запршиваемый контент удалён с сервера", preferredStyle: .alert)
            
            present(alert, animated: true, completion: nil)
        } catch generateErrors.serviceUnavable {
            let alert = UIAlertController(title: "Ошибка", message: "Сервис недоступен", preferredStyle: .alert)
            
            present(alert, animated: true, completion: nil)
        } catch generateErrors.proxyServerError {
            let alert = UIAlertController(title: "Ошибка", message: "Используйте другой прокси сервер", preferredStyle: .alert)
            
            present(alert, animated: true, completion: nil)
        } catch generateErrors.HTTPVersionNotSupported {
            let alert = UIAlertController(title: "Ошибка", message: "Используйте другую версию HTTP", preferredStyle: .alert)
            
            present(alert, animated: true, completion: nil)
        } catch generateErrors.noInternetConnection {
            let alert = UIAlertController(title: "Ошибка", message: "Нет интернет соединения", preferredStyle: .alert)
            
            present(alert, animated: true, completion: nil)
        } catch generateErrors.notFound {
            let alert = UIAlertController(title: "Ошибка", message: "Страница не найдена", preferredStyle: .alert)
            
            present(alert, animated: true, completion: nil)
        }
        
        }
        
}

