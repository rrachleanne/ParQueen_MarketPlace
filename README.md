# ParQueen

### T2A2 Market Place Assignment 

by Rachel Williams

------

Visit ParQueen - https://parqueenaustralia.herokuapp.com/

GitHub Repo - https://github.com/rrachleanne/ParQueen_MarketPlace

#### ParQueen

The ParQueen Market place application is the best market place application to connect people to easily purchase car spots available in Australia.

This cloud-based market place enables individuals and businesses to upload their available car spaces anywhere at anytime to sell.

ParQueen is the only application to use when selling a car spot or looking for a new one. No longer do people have to wait for periods of time when looking for a carspot, whether it be a regular visit to the shopping centre, a monday to friday commute to the city for your staff, consistent travelling to the airport or your favourite beach in summer. ParQueen can help you save time and money by providing you with an easy and convenient method for searching or selling your carspot.

As the population grows, there are more cars on the road and a bigger demand on where to park. Join the community and list your carspot today, no matter if it's street parking, residential, Airport or a business there is always a need. 

#### The ParQueen Experience

Gone are the days when you had to wait to find a car spot in busy peak periods. ParQueen ensures you have a spot for every trip. Whether your searching for a carspot at the beach or a security underground carpark, look no further, ParQueen has it all. 

Behind every carpark, is a successful journey to your destination. 

#### Target Audience 

The are two types of target audience for ParQueen, for people and businesses who:

1. Need an online presence to reach a greater audience in order to sell their carspots quickly; and
2. An easy and convenient application to find and purchase a carspot for every need

#### Functionality and Features

##### <u>Purpose</u>	

If people or businesses have an extra carspot or entire parking lot, they can earn more money by selling their carspot. The ParQueen profile ensures that the user has full control over the availability and prices of their carspots. In just a few steps, with an easy to use interface, they can list their space for free and have their ad up in seconds.

Users selling their car can charge what they want and get paid quickly. 

On the other end, if a user is not selling and is looking for a carspot, they will have access to a huge variety of available carspots in Australia.

##### <u>Functionality</u>

With easy an easy to use interface, users can purchase or sell a carspot in the matter of minutes. 

ParQueen has designed the app to be quick and efficient for buying and selling, with fast sign up forms and limited information required for the profile. From there, users can search for a carspot by suburb or view all making it easier and quicker for them to locate their dream spot. 

The application offers a secure platform for payment processing called Stripe so people and businesses can get paid faster.

##### <u>Features</u>

1. **Secure login** - ParQueen requires users to have an account should they wish to sell or buy a carspot. 
2. **Profile** - Users have access to their profile, in which they can manage their details, view analytics, carspots and create new carspot listings.
3. **Profile Dashboard** - The dashboard can help users track and manage all carspot listings from the Profile dashboard. This dashboard allows users to view all their listings and manage them, see what they have purchased from ParQueen and what they have sold from ParQueen.
4. **Profile  Analytics** - Users can see a quick overview of of total Listings, Carspots Purchased by them and Carspots Sold by them.
5. **Profile Modals** - Users never have to leave their profile to view their listings, carspots sold or purchased as all the information is displayed in a pop-up modal on the profile page.
6. **Product Forms** - ParQueen offers easy to use new product listing forms with minimal information required to get the listing up within minutes. Inbuilt are dropdown options making the selection quicker.
7. **Listings** - Once a carspot is listed, it will display automatically on the listings page
8. **Search** - With an inbuilt search method, people can easily find a car located in or 20km around the desired location by entering in the suburb.
9. **Availability** - If a user is not read to sell their carspot or for some reason doesn't want to advertise it anymore, then the user can change the availability of the listing to no longer show.
10. **Image control** - Users are only able to upload gif, png, jpg and jpeg files
11. **Google Maps Integration** - ParQueen is integrated with Google Maps allowing people to review where the carspot is exactly situated. This provides a seamless user experience.
12. **AWS Data storage** - ParQueen stores and protects images from profiles and listings securely on AWS.
13. **Stripe Integration** - ParQueen is integrated with Stripe allowing users the flexability and security when making payments online. In return, people selling a car will receive their money faster.

<u>**Sitemap**</u>

##### ![](https://github.com/rrachleanne/ParQueen_MarketPlace/blob/master/docs/Sitemap.jpeg)

<u>**Screenshots**</u>



**Home Page**

![](https://github.com/rrachleanne/ParQueen_MarketPlace/blob/master/docs/HOMEPICTURE.jpg)

**Buyers User Experience**

![](https://github.com/rrachleanne/ParQueen_MarketPlace/blob/master/docs/buyexp.jpg)

**Profile Page**

![](https://github.com/rrachleanne/ParQueen_MarketPlace/blob/master/docs/Profile.jpg)

![](https://github.com/rrachleanne/ParQueen_MarketPlace/blob/master/docs/analytics.jpg)

![](https://github.com/rrachleanne/ParQueen_MarketPlace/blob/master/docs/mylistings.jpg)

**Profile Sign-up Form and Product Form**

![](https://github.com/rrachleanne/ParQueen_MarketPlace/blob/master/docs/profileform.jpg)

![](https://github.com/rrachleanne/ParQueen_MarketPlace/blob/master/docs/uploadcar.jpg)

**Stripe Feature**

![](https://github.com/rrachleanne/ParQueen_MarketPlace/blob/master/docs/stripe.jpg)

**Google Map Feature**

![](https://github.com/rrachleanne/ParQueen_MarketPlace/blob/master/docs/Googlemaps.jpg)

**Search Feature**

![](https://github.com/rrachleanne/ParQueen_MarketPlace/blob/master/docs/search.jpg)



**Welcome and Contact Page**

![](https://github.com/rrachleanne/ParQueen_MarketPlace/blob/master/docs/welcome.jpg)

![](https://github.com/rrachleanne/ParQueen_MarketPlace/blob/master/docs/contact.jpg)

**<u>Technology Stack</u>**

ParQueen Tech stack consists of:

- Front-end: HTML5, CSS3, SCSS, Bootstrap and JavaScript

- Back-end: PostgreSQL, Ruby 2.7.1 and Ruby on Rails 6.0.3.2.

- DevOps: Git, Github, Visual Studio Code and Heroku

- APIs: Google Geocoding API, Stripe and AWS S3

  

![](https://github.com/rrachleanne/ParQueen_MarketPlace/blob/master/docs/techstack.jpeg)

#### User Stories

There are two types of user experiences. 

1. Customer 
2. Vendor

![](https://github.com/rrachleanne/ParQueen_MarketPlace/blob/master/docs/customerexp.jpeg)



- Customer is on home page

- Customer clicks 'Buy' from Nav bar or button on home page

- User is redirected to the Listing page where they are presented with the carspots available or they can search by suburb

- User clicks on 'Details' of a particular listing and is then re-directed to login page

  If existing user logs in:

  - Redirected to that ProductID to view listing 
  - User clicks 'Buy'
  - Redirected to stripe to pay
  - Upon successful payment, user is re-directed back to profile to view their purchased products

  If new user logs in :

  - Redirected to create a new profile

  - Upon profile save, user is re-directed to that previous ProductID

  - User clicks 'Buy'

  - Redirected to stripe to pay

  - Upon successful payment, user is re-directed back to profile to view their purchased products

    



![](https://github.com/rrachleanne/ParQueen_MarketPlace/blob/master/docs/sellerexp.jpeg)

- Vendor is on home page

- Vendor clicks 'Sell' from Nave bar or button on home page

- Vendor is re-directed to the login page

  If existing user logs in:

  - Redirected to Sell Carspot form
  - Upon saving, vendor is redirected to the ProductID to view listing 
  - Vendor can access profile to view listings, add, edit, delete and see what has been sold

  If new user logs in :

  - Redirected to create a new profile
  - Upon profile save, vendor is redirected to Sell Carspot form
  - Upon saving, vendor is redirected to the ProductID to view listing 
  - Vendor can access profile to view listings, add, edit, delete and see what has been sold

#### Wireframes

![](https://github.com/rrachleanne/ParQueen_MarketPlace/blob/master/docs/HomePage.png)

![](https://github.com/rrachleanne/ParQueen_MarketPlace/blob/master/docs/signin.png)

![](https://github.com/rrachleanne/ParQueen_MarketPlace/blob/master/docs/profileform.png)

![](https://github.com/rrachleanne/ParQueen_MarketPlace/blob/master/docs/uploadcar.png)

![](https://github.com/rrachleanne/ParQueen_MarketPlace/blob/master/docs/listings.png)

![](https://github.com/rrachleanne/ParQueen_MarketPlace/blob/master/docs/userprofile.png)

#### ERD



#### High-level components



#### Third Party Services



#### Model - Relationships



#### Database Relations



#### Database Schema Design



#### Task Allocation and Tracking