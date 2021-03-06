# [Monocle](https://turingmonocle-production.herokuapp.com)

[Monocle](https://turingmonocle-production.herokuapp.com) is company and job seeking tool for the Turing School community. It's purpose is to provide access to a large directory of technical companies that can be navigated in a simple and intuitive way. Once signed in, users will have the option to star companies and listings they are interested in to review at a later time. It can be accessed with a TuringSchool Census account, which you will be prompted to create from Monocle..

Monocle has 2 Heroku sites for you to use:
* [Staging](https://turingmonocle-staging.herokuapp.com)
* [Production](https://monocle.turing.io)

## Behind the Scenes

* Ruby version: 2.3.1
* Database: Postgresql
* Rails version: 5.0.1

## Setting up the Development Environment

 1. Fork this Repo
 2. Run `bundle install`
 3. You will need API Keys for Census, Google Maps, and AWS.
 4. Install Figaro to access the application.yml file and place your keys in with this syntax to ensure matching variables:

 ```
 S3_KEY: "enter_key"
 S3_SECRET: "enter_key"
 S3_REGION: "region_from_AWS"
 S3_DIRECTORY: "directory_from_AWS"

 census_id: enter_key
 census_secret: enter_key

 google_maps_key: "enter_key"
```

 5. run `rake db:create`
 6. run `rake db:migrate`
 7. run `rake db:seed`


 The project uses RSPEC for testing; run `rspec` in the terminal to run the test suite.
 
## Authentication 
Monocle is authenticated through [Census](https://github.com/turingschool-projects/omniauth-census). Depending on the environment you are trying use Census in, use the following in your Gemfile: 

Staging: 
```
gem 'omniauth'
gem 'omniauth-census', git: "https://github.com/NZenitram/census_staging_oauth"
```
Note: to avoid SSL issues while running the application locally, follow these [steps](https://github.com/NZenitram/census_staging_oauth#important-note)

Production: 
```
gem 'omniauth'
gem 'omniauth-census', git: "https://github.com/turingschool-projects/omniauth-census"
```
## LookingFor
Monocle maintains a close relationship with LookingFor. LookingFor is a job aggregator that finds jobs and associates them with companies in Monocle. If the jobs are available for the given company, they will appear on that company's show page. 

## Important Rake tasks
The job listener task that subsribes to the queue of incoming jobs is started by running the following command:  
`rake job_fetch:joblistener`

In Rails console, run the following command to load individual files from data: 
`SeedFixtureData.run("data/formatted_for_rake/<filename>")`

From the command line, load all the available data files using:<br> 
`rake db:seed_all_data_files`

