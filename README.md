# Volopay Test

### Miguel Alberto U. Dagatan

## Tech Stack

- Rails 7.0.4
- Rails Views FE
- Rubocop
- RSpec
- FactoryBot

## Why use Rails views?

My proficiency on the front end is for ReactJS. However, since we're not being tested on the FE, I decided to just use the Rails views.

## How did you get 100% Coverage?

I removed some boilerplate code from the coverage of SimpleCov.

## What could you do to make this better?

I think the most controversial part of the code is the `services/seating/generate_seat_view.rb`. I would normally get portions separated into `named blocks / classes` in order to organize my code. But for this one, I resorted to naming instead. Separating them may cause more confusion.
