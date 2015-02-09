TEST

LEARNING OUTCOMES

- Http networking with the Alamofire library.
- Experience with downloading JSON in Swift.
- Playing with the searchBarSearchButtonClicked method.
- Exposure to Swift Optionals.
- Using SwiftyJSON to extract data from JSON objects.
- Using numberOfRowsInSection and cellForRowAtIndexPath methods.
- TableCellViews.

LIBRARIES USED

- Alamofire
- SwiftyJSON

BRIEF

When the search bar field is filled in with a location, that location is saved to a variable within the ViewController class. The getJson function is then called which is then supplied the city variable aforementioned as a parameter so it can create the URL for the json object. Using the Alamofire library which is the Swift version of it's Objective-C counterpart, AFNetworking. Using a response Json Handler, I then save the latitudeString and longitudeString converting it to a String (with SwiftyJSON) to a variable which is then passed into the postJson function. 

In the postJson function, I have defined 2 parameters as AnyObject incase the values return from the json object aren't strings. The parameters are then used in the postParameters which is an NSDictionary with the format [ String: AnyObject ] so I can create a POST request with JSON-encoded parameters. Using the responseJson method in the Alamofire library, I then expect to receive a JSON object containing the offers information which includes a logo URL and title. Using a for loop and SwiftyJSON as there are multiple offers in the JSON file, I save the data for the logo URL and title into an array of strings within the ViewController class so the numberOfRowsInSection is able to figure out how many rows to create in the TableView by counting the number of elements in the array and cellForRowAtIndex is then able to insert each string element of the title array inside the respective cell's text attribute.

Unfortunately I wasn't able to get my head around in time to figure out how to get a UIImageView with in the TableViewCell to display images within the URLS taken from the images array. I tried a number of different approaches and was half way through using a for in loop on the array and then using the USURL object to get the data to put in the UIImageView but I ran out of time. With another day or 2, I believe I could wrap my head around this concept.

Also, I would of loved to have more time to explore Unit Testing. Coming from a Ruby foundation where testing is crucial to the Ruby mantra, I understand the importance of having unit testing within apps as a design tool and a safety net. I will also be exploring XCTest a little more.

I have learnt a tonne from doing this tech test and I must thank you for giving me the privilege of doing it. I am now trying to build a Weather app as a means to explore integrating APIs and Alamofire in iOS.