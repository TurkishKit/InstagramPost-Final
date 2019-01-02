//
//  TurkishKit
//  Apple dünyasında sınırları belirleyecek nitelikte uygulamalar
//  tasarlamak ve geliştirmek isteyen lise & üniversite öğrencilerinin buluşma noktası.

//  BodyView.swift
//  Emirhan Erdoğan tarafından 8.12.2018 tarihinde oluşturuldu.
//  Telif Hakkı © 2019 TurkishKit. Tüm hakları saklıdır.
//

import UIKit

/// BodyView, bir Instagram gönderisinde paylaşılan fotoğraflar, kalp,
/// yorum ve beğeni butonu gibi etkileşim ve bilgilerin yer aldığı alandır.
public class BodyView: UIView, ViewInitializable {
    
    // ---------------------------------------------------------------------
    // Arayüz Elementlerinin Tanımlanması
    
    /// Fotoğrafların yan yan eklenmesini ve kaydırılmasını sağlayan alan
    var imagesScrollView: TKScrollView!
    
    /// Kaç adet fotoğraf olduğunu ve o an hangi fotoğrafta olunduğunu belirten alan
    var pageControl: TKPageControl!
    
    /// Kalp butonu
    var heartButton: TKButton!
    
    /// Yorum butonu
    var commentButton: TKButton!
    
    /// Mesaj butonu
    var messageButton: TKButton!
    
    /// Kaydetme butonu
    var bookmarkIcon: TKButton!
    
    // ---------------------------------------------------------------------
    // Değişkenlerin Tanımlanması
    
    /// Kullanıcının gönderi ile paylaştığı fotoğrafların bir arada tutulduğu array(dizi)
    var photos: [UIImage]!
    
    // ---------------------------------------------------------------------
    // Arayüz Elementlerinin Eklenmesi
    
    /// Bir BodyView alanı oluşturmak için kullanacağımız fonksiyon.
    public convenience init(position: Position, photos: [UIImage]) {
        self.init(position: position, size: (375, 430))
        self.photos = photos
        
        // Bu alanda göstereceğimiz arayüz elementleri;
        // imagesScrollView: Görsellerin yan yana, kaydırılabilir bir yapıda gösterilmesi
        // pageControl: Kaç adet görsel olduğu ve üzerinde durulan görsel bilgisi
        // heartButton: Gönderiyi beğenme butonu
        // commentButton: Gönderiye yorum yapma butonu
        // messageButton: Gönderi sahibine mesaj gönderme butonu
        // bookmarkIcon: Gönderiyi kaydetme butonu
        
        // -----------------------------------
        // Arayüz Elementi 1: imagesScrollView
        imagesScrollView = TKScrollView(size: (375, 375))
        
        // Kullanıcının, görseller arasında kaydırma işlemi ile yeni bir görsele geçtiğini bildirir.
        imagesScrollView.notifyWhenPageChanges { (newPage) in
            // newPage: Kaydırma işlemi sonucunda ekranda görüntülenen görselin index(sıra numarası)
            // Not: index değeri dizilerde (array) olduğu gibi 0'dan başlar.
            
            // Kullanıcının kaçıncı görselde olduğunu ifade eden yapı olan pageControl'ün
            // değerini yeni görselin index(sırası) ile değiştiriyoruz.
            self.pageControl.currentPage = newPage
        }
        
        // Bu döngü, 'photos' array'inin eleman sayısı kadar kez çalışacak.
        // Her seferinde 'photo' adındaki değişken, array içerisinde bir sonraki elemanı ifade edecek.
        // Böylece bu dizi içerisindeki tüm elemanlar ile işlem yapabileceğiz.
        for photo in photos {
            // photo adındaki görsel ile yeni bir ImageView alanı oluşturuyoruz.
            let postImageView = TKImageView(size: (375, 375), image: photo)
            
            // Oluşturduğumuz ImageView alanını imagesScrollView'a ekliyoruz.
            // Her eklediğimiz görsel, otomatik olarak bir öncekinin sağına(ekranın dışına doğru) ekleniyor.
            // Böylece kullanıcı elini bu alanda sağ&sol kaydırma hareketi ile tüm görseller arasında gezebilecek.
            imagesScrollView.addSubview(postImageView)
        }
        
        // Arayüz elementini görünür hale getiriyoruz.
        addSubview(imagesScrollView)
        
        
        // -----------------------------------
        // Arayüz Elementi 2: pageControl
        pageControl = TKPageControl(position: (375 / 2, imagesScrollView.bottom + 25))
        // 375 / 2 -> Ekranın yatayda tam ortası
        // imagesScrollView.bottom + 25 -> Bir önceki arayüz elementinin altından 25 birim aşağı
        
        // Yan yana kaç adet top göstermesi istediğimizi veriyoruz. (Görsel sayısı kadar)
        pageControl.numberOfDots = photos.count
        
        // Aktif olacak topun rengini belirtiyoruz.
        pageControl.activeDotColor = .instaBlue
        
        // İnaktif olacak topların rengini belirtiyoruz.
        pageControl.inactiveDotColor = .instaLightGray
        
        // Arayüz elementini görünür hale getiriyoruz.
        addSubview(pageControl)
        
        
        // -----------------------------------
        // Arayüz Elementi 3: heartButton
        heartButton = TKButton(position: (15, imagesScrollView.bottom + 15), size: (24, 24))
        // imagesScrollView.bottom + 15 -> imagesScrollView elementinin altından 15 birim aşağı
        
        // Butona tıklanmadığı zaman (normal durumda) göstermesini istediğimiz ikonu belirtiyoruz.
        heartButton.normalImage = .lineHeartIcon
        
        // Butonun üzerine tıklandığı zaman göstermesini istediğimiz ikonu belirtiyoruz.
        heartButton.selectedImage = .filledHeartIcon
        
        // Butonun üzerine tıklandığı zaman ikonun animasyon ile değişmesini istiyoruz.
        heartButton.isAnimated = true
        
        // Arayüz elementini görünür hale getiriyoruz.
        addSubview(heartButton)
        
        
        // -----------------------------------
        // Arayüz Elementi 4: commentButton
        commentButton = TKButton(position: (heartButton.right + 12, imagesScrollView.bottom + 15), size: (24, 24))
        // heartButton.right + 12 -> heartButton elementinin sağından 12 birim ileri
        // imagesScrollView.bottom + 15 -> imagesScrollView elementinin altından 15 birim aşağı
        
        // Butona tıklanmadığı zaman (normal durumda) göstermesini istediğimiz ikonu belirtiyoruz.
        commentButton.normalImage = .commentIcon
        
        // Arayüz elementini görünür hale getiriyoruz.
        addSubview(commentButton)
        
        
        // -----------------------------------
        // Arayüz Elementi 5: messageButton
        messageButton = TKButton(position: (commentButton.right + 12, imagesScrollView.bottom + 15), size: (24, 24))
        // commentButton.right + 12 -> commentButton elementinin sağından 12 birim ileri
        // imagesScrollView.bottom + 15 -> imagesScrollView elementinin altından 15 birim aşağı
        
        // Butona tıklanmadığı zaman (normal durumda) göstermesini istediğimiz ikonu belirtiyoruz.
        messageButton.normalImage = .messageIcon
        
        // Arayüz elementini görünür hale getiriyoruz.
        addSubview(messageButton)
        
        
        // -----------------------------------
        // Arayüz Elementi 6: bookmarkButton
        bookmarkIcon = TKButton(position: (messageButton.right + 225, imagesScrollView.bottom + 15), size: (24, 24))
        // messageButton.right + 225 -> messageButton elementinin sağından 225 birim ileri
        // imagesScrollView.bottom + 15 -> imagesScrollView elementinin altından 15 birim aşağı
        
        // Butona tıklanmadığı zaman (normal durumda) göstermesini istediğimiz ikonu belirtiyoruz.
        bookmarkIcon.normalImage = .lineBookmarkIcon
        
        // Butonun üzerine tıklandığı zaman göstermesini istediğimiz ikonu belirtiyoruz.
        bookmarkIcon.selectedImage = .filledBookmarkIcon
        
        // Butonun üzerine tıklandığı zaman ikonun animasyon ile değişmesini istiyoruz.
        bookmarkIcon.isAnimated = true
        
        // Arayüz elementini görünür hale getiriyoruz.
        addSubview(bookmarkIcon)
    }
}

