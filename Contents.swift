//: Playground - noun: a place where people can play

import UIKit
import PlaygroundSupport


class MyViewController: UIViewController {
    
    
    let redLabel: UILabel = {
       let label = UILabel()
        label.text = "5"
        label.backgroundColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        return label
    }()
    
    let blueLabel: UILabel = {
       let label = UILabel()
        label.text = "4"
        label.backgroundColor = .blue
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        return label
    }()
    
    let winnerLabel: UILabel = {
       let label = UILabel()
        label.text = "Who won"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Roll Dice", style: .plain, target: self, action: #selector(handleRollDices))
        
        //Makes live easier with stackView
        let arrangedSubViews = [redLabel, blueLabel]
        let stackView = UIStackView(arrangedSubviews: arrangedSubViews)
        stackView.distribution = .fillEqually
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: topLayoutGuide.bottomAnchor, constant: 12).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
        view.addSubview(winnerLabel)
        NSLayoutConstraint.activate([winnerLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 12),winnerLabel.widthAnchor.constraint(equalTo: view.widthAnchor), winnerLabel.heightAnchor.constraint(equalToConstant: 24)])
        
        
    }
    
    @objc
    fileprivate func handleRollDices(){
        
        let redValue = arc4random_uniform(6) + 1
        redLabel.text = "\(redValue)"
        
        let blueValue = arc4random_uniform(6) + 1
        blueLabel.text = "\(blueValue)"
        
//        redLabel.text = nil
//        blueLabel.text = nil
        
        evaluateWinner()
    }
   
    fileprivate func evaluateWinner() {
     winnerLabel.text = "figuring out the result..."
        
        guard let redLabel = redLabel.text, let blueLabel = blueLabel.text else {
            //prompt error when values are invalid
            winnerLabel.text = "values are invalid"
            return
        }
        if redLabel == blueLabel {
            winnerLabel.text = "TIE!"
        } else if redLabel > blueLabel {
            winnerLabel.text = "Red won!"
        } else {
            winnerLabel.text = "Blue won!"
        }
        
        
    }
    
}




PlaygroundPage.current.liveView = UINavigationController(rootViewController: MyViewController())
