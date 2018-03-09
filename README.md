# Make it Cheaper Code Test

#### 1. Fork this project to your github

#### 2. Do the test
- Api Documentation on http://mic-leads.dev-test.makeiteasy.com/api/v1/docs
- Copy/paste .env.example to .env
- Setup Api token provide by Make It Cheaper
- `bundle install`
- `rails s`

#### 3. When finish provide:
- Git url to allow us reading/run code or create a Pull Request

#### 4. Your app must start with:
- `bundle install`
- `rake db:create db:migrate` (If you use DB, sqlite3. Possible to do the test without any DB)
- `rails s`

## Test
    bundle exec rspec

### Environments variables
Check .env.example
- LEAD_API_PGUID="CFFBF53F-6D89-4B5B-8B36-67A97F18EDEB"
- LEAD_API_PACCNAME="MicDevtest"
- LEAD_API_PPARTNER="MicDevtest"
- LEAD_API_ACCESS_TOKEN=provide_by_maket_it_cheaper

Added changes:
1. The project can now run through docker
2. Added support for feature test through docker (though no feature tests were completed yet) - rake docker:test:cucumber
3. To start the project simply go to the project directory and execute docker-compose up
4. Request Test were added
5. Unit tests were added 
