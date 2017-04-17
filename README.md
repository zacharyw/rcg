# README

## Setup

1. Clone repository
2. `bundle install`
3. `brew install chromedriver`
4. `rspec spec` All specs should pass

## Description

RCG is a hybrid chat/forum software.

The primary features as I see it are:

* A home page with a list of 'topic cards'. This are equivalent to a post in the Facebook group, except they don't show replies, just a topic with sample text from the topic. The cards will be lined up side-by-side and down the page. A responsive design will be used so if you go to the site on your phone there will just be a single column list of cards, but on a desktop they would fill the entire browser.

* Clicking on a card takes you into that conversation. A conversation is a real time chatroom. 

* At the beginning this is all we need. There are several things we can add, though:
  * Notifications (desktop, SMS)
  * Click and react to individual messages
  * Private conversations
  * Click a conversation message and break it off into a new topic
  * For long running or highly active conversations, a pane or tab that shows top reacted comments and comments that were broken into new topics.
  * A @mention system for saying things to specific people in a conversation
  * Ability to search topics and conversation (use ElasticSearch for this)
  * Ability to post picture, video, gif, or HTML5 video have it load into the chat.
  * Ability to upload/download files
  * Link to Steam account
  * Emoticon support
  * Markdown formatting support
