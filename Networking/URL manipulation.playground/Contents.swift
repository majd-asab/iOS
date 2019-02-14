import UIKit

let website = "http://udacity.com"
// -------------------------------
// Task 1: Create a valid URL
//         by calling URL(string:)
// -------------------------------
var url = URL(string: website)// failable initializer, its optional if it fails it returns nil

// -------------------------------
// Task 2: Append an "ios" path
//         component to the URL
//         with appendPathComponent(_:)
// -------------------------------
if var validUrl = url {
    validUrl.appendPathComponent("ios")
    print(validUrl)
}
// we suggest you print out your URL to verify the result


// create a new URLComponents
var newUrl = URLComponents()

// set the scheme
newUrl.scheme = "https"
// set the host
newUrl.host = "google.com"
// set the path
newUrl.path = "/search"
// set the query, you'll need to create a new URLQueryItem
newUrl.queryItems = [URLQueryItem(name: "query", value: "udacity")]
// print the url to verify (URLComponents has a property called "url")
print(newUrl.url ?? "didn't work")
