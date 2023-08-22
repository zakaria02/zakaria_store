# Zakaria Store

A simple flutter application that consumes the api (https://fakestoreapi.com) and display its data
The app contains 3 screens:
1 - Home page : contains the list of categories and selected category products
2 - Product details page : contains informaion (image, title, description, price, rating ...) of the selected product with the possibility to change quantity and add the product to cart, in case of error, an error view is displayed
3 - Cart : Displays the list of products added to cart or empty cart view otherwise

## Getting Started

### Install the application
#### 1 - Download the demo apk from this link: https://drive.google.com/file/d/1g30x2ETUlvr9HpEDEdNy9t2-gnUUhjn0/view?usp=sharing
#### 2 - Consider disabling google protect to install the apk in your device : go to play store -> click on your profile icon -> click on google protect and disable it

### Application avaliability
You can download and use the application in any android device that has the android sdk >= 16, so any android version bigger than 4.1

### The main used packages
1 - Bloc : for state management I prefered to use the Bloc state management, it makes easy to separate to business part from the feature part, we have different states (intitial, loading, successn and failure), and a list of event, each event trigger an action (ex: fetch data from endpoint), and based on the result we emit a state (success or failure)

2 - Get_it : For locator service, I used get_it to initialize all of my important objects, I declared them as lazySingleton or Factory

3 - Auto_route : For navigation I used auto_route that is one of the very powrful packages for navigation in flutter, it makes our life more easy :)

4 - Dio & Retofit : For my services I used Retrofit & Dio to call my remote data sources, with retrofit I make it easy to add the endpoints and the used methods to call them (Get, Post, ...), and in my dio I added those interceptors :
#### 4-1 : Curl interceptor: to have all the curls of all of my calls for better debugging
#### 4-2 : Cache interceptor: to cache my response in local, so I don't have to call the remote data source each time
#### 4-3 : A better way to manage errors and get a specific error message for each error type

5 - Hive : For local data storage I used hive as database

### Clean architecture and Folder/File structure

The app architecture is simulaire to MVVM architecture

For each screen I have two folders : 
#### 1 - business : contains service -> repository -> use cases
#### 2 - feature : contains bloc -> views -> screens

In a screen the user trigger an action and send his data in a uio object, the bloc will be charged to define which usecase to call and to transform the uio object to a dto object, the usecase call the repository who calls the service, after getting a response the bloc defines which state to emit, a success or a failure.