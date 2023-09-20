# Win/loss tracker for Collectible Card Games
# Demo: http://fierce-journey-80025.herokuapp.com/
								Description:
The Custom Card Game (CCG) Tracker app is meant for players of Magic the Gathering to easily track the game statistics of specific decks they play, as well as browse other users decks. 

Users, once created, can make decks linked to the formats they play and then create specific games. Generalized tags are included, and users are able to leave comments about each individual game. Decks then show the total wins, losses, as well as the individual tag counts.  

 

## Installation 

 Video: https://youtu.be/NiRl5sgtvSI

1. From github, download or clone the repo into a desired folder. 

2. Navigate terminal to  the root folder for the application. 

3. Run “bundle install” which will  install the appropriate gem files for the application. 

4. Run “rake db:migrate”  which will create the tables in which all the information will be stored. 

5. Run rake db:seed which will  populate the formats and tags. 

6. Run “rails s” to start up the server. 

7. Navigate an internet browser to the running server (local host 3000 by default) 

The app is up and running! 

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/cjwood032/format_game_tracker. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the format_game_tracker project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'cjwood032'/format_game_tracker/blob/master/CODE_OF_CONDUCT.md).
