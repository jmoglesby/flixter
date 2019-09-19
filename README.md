# Flixter
http://flixter-jeremy-oglesby.herokuapp.com/

Flixter is a Rails app that emulates a video-learning platform. It allows users to take on the role of instructor or student, giving access to API's for creating Classes that can be divided into Sections with multiple Lessons.

CarrierWave and AWS are used to host image and video uploading, and Devise is used to handle User security features. The Stripe API has also been implemented to accept user credit card payments (although it only runs in test mode, to prevent actual payment processing).

Most of the styling derives from Bootstrap, but with modifications in the CSS(SASS) to customize the look and feel of the site.

*If you are checking the site out to evaluate my work, please feel free to create a user account and manipulate content.*

**Rails Version: 5.2.3**
**Ruby Version: 2.5.3**

**Key Gems Used:**
* gem 'bootstrap'
* gem 'jquery-rails'
* gem 'jquery-ui-rails'
* gem 'font-awesome-rails'
* gem 'simple_form'
* gem 'devise'
* gem 'carrierwave'
* gem 'carrierwave-aws'
* gem 'figaro'
* gem 'fog-aws'
* gem 'mini_magick'
* gem 'stripe'
* gem 'ranked-model'
