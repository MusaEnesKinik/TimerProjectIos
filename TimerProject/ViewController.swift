

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    
    var timer = Timer() // Timer; belirli bir zaman geçtikten sonra istediğin terget object e mesaj gönderiyor, şunu yap diye
    var counter = 0
    
    override func viewDidLoad() { // Uygulama ilk çalıştığında
        super.viewDidLoad()
        
        counter = 10 // değişken değerini 10 yaptık
        timeLabel.text = "Time: \(counter)" // değişkeni yazdırdık
        
        // 10 dan geriye doğru 1 azaltma işlemini timer içinde yapacağız
        // Timer.scheduledTimer ; planlanmış timer. timeInterval: 1 saniye belirttik. target: self ; viewController ı self olarak yazdık. selector: #selector(timerFunction) ; hangi fonksiyonu çağırması gerektiğini belirttik. userInfo: nil ; kullanıcıya info yollanacak mı onu soruyor. repeats: true ; tekrar ediyor muyu evet yaptık
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerFunction), userInfo: nil, repeats: true)
        
    }
    
    @objc func timerFunction() { // timer çalıştırılırken selector da belirteceğimiz fonksiyonu buraya yazdık
        
        timeLabel.text = "Time: \(counter)"
        counter -= 1
        
        if counter == 0 {
            timer.invalidate() // Timer ı bitirir, durdurur
            timeLabel.text = "Süre Bitti!"
        }
        
    }

    @IBAction func buttonClicked(_ sender: Any) {
        print("button clicked")
    }
    
}

