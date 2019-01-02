//
//  TurkishKit
//  Apple dünyasında sınırları belirleyecek nitelikte uygulamalar
//  tasarlamak ve geliştirmek isteyen lise & üniversite öğrencilerinin buluşma noktası.

//  FooterView.swift
//  Emirhan Erdoğan tarafından 8.12.2018 tarihinde oluşturuldu.
//  Telif Hakkı © 2019 TurkishKit. Tüm hakları saklıdır.
//

import UIKit

/// FooterView, bir Instagram gönderisinde paylaşılan caption(açıklama),
/// view all comment(tüm yorumları göster) butonu, beğeni ve yorum sayısı gibi bilgilerin yer aldığı alandır.
public class FooterView: UIView, ViewInitializable {
    
    // ---------------------------------------------------------------------
    // Arayüz Elementlerinin Tanımlanması
    
    /// Beğeni sayısının gösterildiği yazı alanı
    var likeCountLabel: TKLabel!
    
    /// caption (açıklama) yazısının gösterildiği yazı alanı
    var captionLabel: TKLabel!
    
    /// 'Tüm yorumları göster' butonu
    var viewAllCommentsButton: TKButton!
    
    // ---------------------------------------------------------------------
    // Arayüz Elementlerinin Eklenmesi
    
    /// Bir FooterView alanı oluşturmak için kullanacağımız fonksiyon.
    public convenience init(position: Position, caption: String, numberOfLikes: Int, numberOfComments: Int) {
        self.init(position: position, size: (375, 75))
        
        // -----------------------------------
        // Arayüz Elementi 1: likeCountLabel
        likeCountLabel = TKLabel(position: (15, 0))
        
        // Label'da yazacak olan yazıyı, aşağıdaki format ile belirliyoruz.
        // Format: 'numberOfLikes' değişkeninin değeri (örn: 21) ile "likes" yazısını birleştiriyoruz.
        likeCountLabel.text = "\(numberOfLikes) likes"
        
        // Font bilgisini, Sketch tasarımındaki değerler ile değiştiriyoruz
        likeCountLabel.changeFont(size: 14, style: .semibold, color: .black)
        
        // Arayüz elementini görünür hale getiriyoruz.
        addSubview(likeCountLabel)
        
        
        // -----------------------------------
        // Arayüz Elementi 2: captionLabel
        captionLabel = TKLabel(position: (15, likeCountLabel.bottom + 5))
        // likeCountLabel.bottom + 5 -> likeCountLabel elementinin altından 5 birim aşağı
        
        // Label'da yazacak olan yazıyı, caption parametresinin değeri olarak belirtiyoruz.
        captionLabel.text = caption
        
        // Font bilgisini, Sketch tasarımındaki değerler ile değiştiriyoruz
        captionLabel.changeFont(size: 14, style: .regular, color: .black)
        
        // Arayüz elementini görünür hale getiriyoruz.
        addSubview(captionLabel)
        
        
        // -----------------------------------
        // Arayüz Elementi 3: viewAllCommentsButton
        viewAllCommentsButton = TKButton(position: (15, captionLabel.bottom))
        // captionLabel.bottom -> captionLabel elementinin hemen altı
        
        // Label'da yazacak olan yazıyı, aşağıdaki format ile belirliyoruz.
        // Format: "View all" yazısı, 'numberOfComments' değişkeninin değerini (örn: 38)
        // ve "comments" yazısını birleştiriyoruz.
        viewAllCommentsButton.title = "View all \(numberOfComments) comments"
        
        // Font bilgisini, Sketch tasarımındaki değerler ile değiştiriyoruz
        viewAllCommentsButton.changeFont(size: 14, style: .regular, color: .instaDarkGray)
        
        // Arayüz elementini görünür hale getiriyoruz.
        addSubview(viewAllCommentsButton)
    }
}

