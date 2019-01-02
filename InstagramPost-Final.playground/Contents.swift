//
//  TurkishKit
//  Apple dünyasında sınırları belirleyecek nitelikte uygulamalar
//  tasarlamak ve geliştirmek isteyen lise & üniversite öğrencilerinin buluşma noktası.

//
//  Emirhan Erdoğan tarafından 8.12.2018 tarihinde oluşturuldu.
//  Telif Hakkı © 2019 TurkishKit. Tüm hakları saklıdır.
//

import UIKit
import PlaygroundSupport

// ---------------------------------------------------------------------
// Post(Gönderi) Bilgileri
// Çizilmesini istediğimiz Instagram gönderisinde kullanılacak olan bilgiler

/// Profil fotoğrafımız
let profileImage = UIImage.profileImage

/// Kullanıcı Adımız
let username = "turkish.kit"

/// Paylaşım Lokasyonumuz
let location = "BK Nakkaştepe 50. Yıl Kampüsü"

/// Gönderi ile paylaştığımız fotoğraf(lar)
let postImages = [UIImage.postImage1, UIImage.postImage2, UIImage.postImage3]

/// Gönderimize gelen beğeni sayısı
let likeCount = 38

/// Gönderimize gelen yorum sayısı
let commentCount = 21

/// Gönderimizin altına yazdığımız yazı
let postCaption = "Burada, sizlerle olmak harika! #tkozeletkinligi"

// ---------------------------------------------------------------------
// Gönderinin Ekranda Çizilmesi
// Bir Instagram gönderisi üç temel parçadan oluşur. Bunlar;
// header, body ve footer

// Header, body ve footer alt alta dizilerek bir Instagram gönderisini ekranda oluşturur.
// Bu parçaları bir arada tutacak "instagramPost" adında bir alana ihtiyacımız var.

// -----------------------------------
// Aşama 1: Post
// Bu alanın görevi; header, body ve footer parçalarını bir arada tutmaktır.
let postSize = (375.0, 560.0) // Bir Instagram gönderisinin boyutu
let instagramPost = TKView(position: (0, 0), size: postSize)


// -----------------------------------
// Aşama 2: Header
// Bu alanda bulunan bilgiler: profil fotoğrafı, kullanıcı adı, lokasyon
let header = HeaderView(position: (0, 0), profileImage: profileImage, username: username, location: location)

// Oluşturduğumuz "header" alanını, "instagramPost" alanına eklemeliyiz.
instagramPost.addSubview(header)


// -----------------------------------
// Aşama 3: Body
// Bu alanda bulunan bilgiler: paylaşılan fotoğraflar, kalp, yorum, mesaj ve kaydet butonları
let body = BodyView(position: (0, header.bottom), photos: postImages)

// Oluşturduğumuz "body" alanını, "instagramPost" alanına eklemeliyiz.
instagramPost.addSubview(body)


// -----------------------------------
// Aşama 4: Footer
// Bu alanda bulunan bilgiler: beğeni ve yorum sayısı, gönderi yazısı, "tüm yorumları gör" butonu
let footer = FooterView(position: (0, body.bottom), caption: postCaption, numberOfLikes: likeCount, numberOfComments: commentCount)

// Oluşturduğumuz "footer" alanını, "instagramPost" alanına eklemeliyiz.
instagramPost.addSubview(footer)

// ---------------------------------------------------------------------

// En başta oluşturduğumuz ve tüm alanları (header, body ve footer) içerisinde tutan
// "instagramPost" adındaki alanımızın anlık olarak ekranda çizilmesini sağlıyoruz.
PlaygroundPage.current.liveView = instagramPost

