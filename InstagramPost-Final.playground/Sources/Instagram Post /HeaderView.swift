//
//  TurkishKit
//  Apple dünyasında sınırları belirleyecek nitelikte uygulamalar
//  tasarlamak ve geliştirmek isteyen lise & üniversite öğrencilerinin buluşma noktası.

//  HeaderView.swift
//  Emirhan Erdoğan tarafından 8.12.2018 tarihinde oluşturuldu.
//  Telif Hakkı © 2019 TurkishKit. Tüm hakları saklıdır.
//

import UIKit

/// HeaderView, bir Instagram gönderisinde gönderinin kime ait olduğu bilgisini içeren alandır.
public class HeaderView: UIView, ViewInitializable {
    
    // ---------------------------------------------------------------------
    // Arayüz Elementlerinin Tanımlanması
    
    /// Kullanıcı fotoğrafı görüntülenecek alan
    var profileImageView: TKImageView!
    
    /// Kullanıcı adının görüntüleceği alan
    var usernameLabel: TKLabel!
    
    /// Lokasyon bilgisinin görüntüleceği alan
    var locationLabel: TKLabel!
    
    /// Gönderinin sağ üstünde bulunan more(yan-yana üç daire) butonu
    var moreButton: TKButton!
    
    // ---------------------------------------------------------------------
    // Arayüz Elementlerinin Eklenmesi
    
    /// Bir HeaderView alanı oluşturmak için kullanacağımız fonksiyon.
    public convenience init(position: Position, profileImage: UIImage, username: String, location: String) {
        self.init(position: position, size: (375, 55))
        
        // Gönderi bilgilerini ekranda gösterebilmek için arayüz elementleri oluşturmalıyız. Bunlar;
        // profileImageView: Profil fotoğrafı
        // usernameLabel: Kullanıcı adı
        // locationLabel: Lokasyon bilgisi
        // moreButton: (yan-yana üç daire) butonu
        
        // -----------------------------------
        // Arayüz Elementi 1: profileImageView
        profileImageView = TKImageView(position: (10, 12), size: (32, 32), image: profileImage)
        
        // Profil fotoğrafının yuvarlak şekle sahip olmasını sağlıyoruz.
        profileImageView.isRounded = true
        
        // Arayüz elementini görünür hale getiriyoruz.
        addSubview(profileImageView)
        
        
        // -----------------------------------
        // Arayüz Elementi 2: usernameLabel
        usernameLabel = TKLabel(position: (profileImageView.right + 10, 12))
        
        // Label'da yazacak olan yazıyı, kullanıcının adı olarak belirliyoruz.
        usernameLabel.text = username
        
        // Font bilgisini, Sketch tasarımındaki değerler ile değiştiriyoruz.
        usernameLabel.changeFont(size: 14, style: .semibold, color: .black)
        
        // Arayüz elementini görünür hale getiriyoruz.
        addSubview(usernameLabel)
        
        
        // -----------------------------------
        // Arayüz Elementi 3: locationLabel
        locationLabel = TKLabel(position: (profileImageView.right + 10, usernameLabel.bottom))
        
        // Label'da yazacak olan yazıyı, gönderi lokasyonu olarak belirliyoruz.
        locationLabel.text = location
        
        // Font bilgisini, Sketch tasarımındaki değerler ile değiştiriyoruz.
        locationLabel.changeFont(size: 12, style: .regular, color: .black)
        
        // Arayüz elementini görünür hale getiriyoruz.
        addSubview(locationLabel)
        
        
        // -----------------------------------
        // Arayüz Elementi 4: moreButton
        moreButton = TKButton(position: (346, 18), size: (20, 20))
        
        // Button'ın göstereceği ikonu belirtiyoruz.
        moreButton.normalImage = UIImage.moreIcon
        
        // Arayüz elementini görünür hale getiriyoruz.
        addSubview(moreButton)
    }
}

