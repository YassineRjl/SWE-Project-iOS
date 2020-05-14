//
//  AppDelegate.swift
//  SWE ios
//
//  Created by YR on 5/8/20.
//  Copyright © 2020 swe ios. All rights reserved.
//


import UIKit
import AWSAppSync
import AWSMobileClient
import AWSCognitoIdentityProvider

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {
    
    var window: UIWindow?
    
    var appSyncClient: AWSAppSyncClient?
    var userPool: AWSCognitoIdentityUserPool?
    
    


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

     
        
        AWSDDLog.sharedInstance.logLevel = .debug
        
        let databaseURL = URL(fileURLWithPath:NSTemporaryDirectory()).appendingPathComponent("unicorn_db")//, isDirectory: false)
        
        
        
        do {
            //AppSync configuration & client initialization

            let cacheConfiguration = try AWSAppSyncCacheConfiguration()



            let appSyncConfig = try AWSAppSyncClientConfiguration(appSyncServiceConfig: AWSAppSyncServiceConfig(),
                                                                  userPoolsAuthProvider: {
                                                                    class MyCognitoUserPoolsAuthProvider : AWSCognitoUserPoolsAuthProviderAsync {
                                                                        func getLatestAuthToken(_ callback: @escaping (String?, Error?) -> Void) {
                                                                            AWSMobileClient.default().getTokens { (tokens, error) in
                                                                                if error != nil {
                                                                                    print("the token error is: \(error)")
                                                                                    
                                                                                    callback(nil, error)
                                                                                } else {
                                                                                    callback(tokens?.idToken?.tokenString, nil)
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                    return MyCognitoUserPoolsAuthProvider()}(),
                                                                  cacheConfiguration: cacheConfiguration)

            // Initialize the AWS AppSync client
            appSyncClient = try AWSAppSyncClient(appSyncConfig: appSyncConfig)
//            syncUserLogs()

        } catch {
            print("Error initializing appsync client. \(error)")
        }
        //other methods


        AWSMobileClient.default().signOut()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

