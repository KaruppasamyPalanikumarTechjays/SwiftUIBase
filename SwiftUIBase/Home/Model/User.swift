//
//  User.swift
//  SwiftUIBase
//
//  Created by Karuppasamy Palanikumar on 31/10/22.
//

import Foundation

struct VidRivalUser: Codable,Hashable,Identifiable {
    let id = UUID()
    var username: String?
    var fullname: String {
        guard let firstname = firstname else { return "" }
        guard let lastname = lastname else { return "" }
        return firstname + " " + lastname
    }
    var email: String?
    var firstname: String?
    var lastname: String?
    var city: String?
    var zipcode: String?
    var zipCodeOrCity: String?
    var mobileNumber: String?
    var formattedMobileNumber: String?
    var password: String?
    var password2: String?
    var countryCode: String?
    var source: String?
    var userType: String?
    var bio: String?
    var streetAddress: String?
    var otp: String?
    var otpVerified: Bool?
    var token: String?
    var dateOfBirth: String?
    var userId: Int?
    var displayID: String {
        get {
            if let userId = userId {
                return "\(userId)"
            } else {
                return ""
            }
        }
    }
    var msg: String?
    var currentPassword: String?
    var newPassword: String?
    var confirmPassword: String?
    var title: String? //for terms and condition
    var link: String?  //for terms and condition
    var profilePic: String?
    var mediumProfilePic: String?
    var thumbnailProfilePic: String?
    var schnikes: Double?
    var totalSchnikes: Double?
    var TotalSchnikes: String? {String(describing: totalSchnikes)}
    var status: String?
    var chivalryRating: Int?
    var friendStatus: String?
    var requestedUserId: Int?
    var searchType: String?
    var searchText: String?
    var otherUserId: Int?
    var realMonenyDuel : Bool?
    var discountSchnikes : Double?
    var promoCode : String?
    var winPercentage: Double?
    var averageBetAmount: Double?
    var diplayWinPercentageValue: String {
        get {
            if let winPercentage = winPercentage {
                return Int(winPercentage).description + "%"
            } else {
                return ""
            }
        }
    }
    var displayAverageSchnikes: String {
        get {
            if let averageBetAmount = averageBetAmount {
                let value = Int(averageBetAmount).description
                return value
            } else {
                return ""
            }
        }
    }
    var DiscountSchnikes: String? {
        get {
            if let discountSchnikes = discountSchnikes {
                return Int(discountSchnikes).description
            } else {
                return nil
            }
        }
    }
    var isPromoApplied: Bool?
    var showAddSchnikes: Bool?
    var isEmailVerified: Bool?
    var numberOfBets: Int?
    var winnings: Int?
    var message: String?
    var isVidrivalsUser: Bool?
    var lockedSchnikes: Int?
    
    private enum CodingKeys: String, CodingKey {
        case   username,
               email,
               schnikes,
               totalSchnikes = "total_schnikes",
               formattedMobileNumber,
               zipCodeOrCity = "zip_code_or_city",
               mobileNumber = "mobile_number",
               password,
               password2,
               currentPassword = "current_password",
               confirmPassword = "confirm_password",
               newPassword = "new_password",
               countryCode = "country_code",
               source,
               userType = "user_type",
               bio,
               streetAddress = "street_address",
               otp = "otp_verification_code",
               token,
               userId = "user_id",
               msg,
               title,
               link,
               profilePic = "profile_pic",
               mediumProfilePic = "medium_profile_pic",
               thumbnailProfilePic = "thumbnail_profile_pic",
               status,
               chivalryRating = "chivalry_rating",
               friendStatus = "friend_status",
               requestedUserId = "requested_user_id",
               searchType = "search_type",
               searchText = "search",
               otherUserId = "other_user_id",
               realMonenyDuel = "real_money_duel",
               discountSchnikes = "discount_schnikes",
               promoCode = "promo_code",
               isPromoApplied = "is_promo_applied",
               showAddSchnikes = "show_add_schnikes",
               firstname = "first_name",
               lastname = "last_name",
               city = "city",
               zipcode = "zip_code",
               isEmailVerified = "is_email_verified",
               numberOfBets = "number of bets",
               winnings,
               message,
               isVidrivalsUser = "is_vidrivals_user",
               dateOfBirth = "date_of_birth",
               lockedSchnikes = "locked_schnikes",
               otpVerified = "otp_verified",
               winPercentage = "win_percentage",
               averageBetAmount = "average_bet_amount"
    }
}
