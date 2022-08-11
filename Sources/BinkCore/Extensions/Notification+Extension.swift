//
//  NotificationNameExtension.swift
//  binkapp
//
//  Created by Paul Tiriteu on 09/09/2019.
//  Copyright © 2019 Bink. All rights reserved.
//
import Foundation

extension Notification.Name {
    static public let noInternetConnection = Notification.Name("no_internet_connection")
    static public let shouldLogout = Notification.Name("should_logout")

    // MARK: - Wallet
    static public let didLoadWallet = Notification.Name("did_download_wallets")
    static public let didLoadLocalWallet = Notification.Name("did_load_local_wallets")
    static public let didDeleteWalletCard = Notification.Name("did_delete_membership_card")
    static public let didAddMembershipCard = Notification.Name("did_add_membership_card")
    static public let shouldTrashLocalWallets = Notification.Name("should_trash_local_wallets")

    // MARK: - SSL Pinning
    static public let didFailServerTrustEvaluation = Notification.Name("did_fail_server_trust_evaluation")
    
    // MARK: - Server Errors
    static public let outageError = Notification.Name("outage_error")
    static public let outageSilentFail = Notification.Name("outage_silent_fail")
    static public let logoutOutage = Notification.Name("logout_outage")
    
    // MARK: - Local points scraping
    static public let webScrapingUtilityDidUpdate = Notification.Name("web_scraping_utility_did_complete")

    // MARK: - Theming
    static public let themeManagerDidSetTheme = Notification.Name("theme_manager_did_set_theme")
}
