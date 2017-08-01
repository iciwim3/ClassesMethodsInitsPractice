//: Playground - noun: a place where people can play

import UIKit

// Module 2

class User {
    var username: String
    var fullName: String
    var email: String
    var posts: [Post] = []
    
    init(username: String, fullName: String, email: String) {
        self.username = username
        self.fullName = fullName
        self.email = email
        
        self.posts = []
    }
    
    func signedUpSuccessfully() -> Bool {
        print("Making a sign up request for user with the username of: \(username).")
        print("...")
        print("Sign-up SUCCESSFUL!")
        return true
    }
    
    func loginSuccessful() -> Bool {
        print("Making request to login user with the username: \(username) and email: \(email).")
        print("...")
        print("Login was SUCCESSFUL!")
        return true
    }
    
    func post(new newPost: Post) {
        self.posts.append(newPost)
    }
    
}

class Post { // 2.2.1
    
    var text: String = "" // 2.2.2
    var userName: String = "" // 2.2.3
    var likers: [User] = [] // 2.5.2.2 
    var comments: [Comment] = [] // 2.5.3.1
    
    init(text: String, byUserWithUsername userName: String) { // 2.4.2
        self.text = text
        self.userName = userName

    }
    
    func liked(by users: User) { // 2.5.2.3
        self.likers.append(users)
    }
    
    func add(newComment: Comment) { // 2.5.3.2
        self.comments.append(newComment)
    }
    
    func getAllLikersString() -> String { // 2.5.4.1
        var result = ""
        
        for liker in likers {
            if result == "" {
                result += liker.username
            } else {
                result += ", \(liker.username)"
        }
        
    
        }
        
        return result
    }
    
    func getAllCommenters() -> String { // 2.5.5
        var results = ""
        
        for comment in comments {
            if results == "" {
                results += comment.text
            } else {
                results += ", \(comment.text)"
            }
        }
        
        return results
    }
    
    func getPoints() -> Int { // 2.5.6.1&2
        
        var points = likers.count * 5
        
        for comment in comments {
            let text = comment.text.lowercased()
            if text.contains("dork") || text.contains("stupid") || text.contains("mean") {
                points -= 3
            } else {
                points += 10
            }
        }
        
        return points
    }
}

class Comment { // 2.5.1.1
    var user: User
    var text: String
    
    init(user: User, text: String) { // 2.5.2.1
        self.user = user
        self.text = text
    }
}

let currentUser: User = User(username: "dtran", fullName: "Duc Tran", email: "support@ductran.co") // 2.3.1


let samplePost: Post = Post(text: "This is the worst arrow I've ever seen in my life", byUserWithUsername: currentUser.username) // 2.3.2

let anotherUser: User = User(username: "kungfukenny", fullName: "Kendrick Lamar", email: "kdot@topdawg.com") // 2.4.1

let anotherPost: Post = Post(text: "My resume real enough for two milleniums", byUserWithUsername: anotherUser.username) // 2.4.3

anotherPost.text = "Ain't no other love like the one I know!" // 2.4.4

let userComment: Comment = Comment(user: anotherUser, text: "I got royalty inside my DNA!") // 2.5.2.4

let newPost: Post = Post(text: "I'm rolling down the ave and I'm looking good...", byUserWithUsername: anotherUser.username) // 2.5.2.4

newPost.liked(by: anotherUser) // 2.5.2.4

let newUser: User = User(username: "chamillionaire", fullName: "Hakeem Seriki", email: "chamillitarymane@chamillionaire.com") // 2.5.3.3

let newComment: Comment = Comment(user: newUser, text: "It's going down!") // 2.5.3.3

let post1: Post = Post(text: "Pop trunk", byUserWithUsername: newUser.username) // 2.5.3.3

post1.add(newComment: newComment) // 2.5.3.3

newPost.liked(by: currentUser) // 2.5.4.3
newPost.liked(by: newUser) // 2.5.4.3

newPost.getAllLikersString() // 2.5.4.3

let userOne = User(username: "tsops", fullName: "Tony Soprano", email: "iworkinwastemanagement@innewjersey.com")
let userTwo = User(username: "mjordan", fullName: "Michael Jordan", email: "thegoat23@jumpman.com")
let userThree = User(username: "drake", fullName: "Aubrey Graham", email: "champagnepapi@ovo.com")

let yetAnotherNewPost = Post(text: "Lavar Ball couldn't beat me if I had one leg", byUserWithUsername: userTwo.username)

yetAnotherNewPost.text = "He played college ball and averaged 2.2 points per game?!"

yetAnotherNewPost.liked(by: userOne)
yetAnotherNewPost.liked(by: userTwo)
yetAnotherNewPost.liked(by: userThree)


let userOneComment = Comment(user: userOne, text: "That was pretty funny!")
let userTwoComment = Comment(user: userTwo, text: "I am pretty funny guy! Lavar ball is a dork!")
let userThreeComment = Comment(user: userThree, text: "LOL LOL OVO XO!")

yetAnotherNewPost.add(newComment: userOneComment)
yetAnotherNewPost.add(newComment: userTwoComment)
yetAnotherNewPost.add(newComment: userThreeComment)

yetAnotherNewPost.getPoints()

