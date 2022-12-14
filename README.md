# Volopay Test

### Miguel Alberto U. Dagatan

## Tech Stack

- Rails 7.0.4
- Rails Views FE
- Rubocop
- RSpec
- FactoryBot

## How to test

```
rails s
go to localhost:3000
input the data on `Seating rows and columns` and `Number of passengers`
click `Create seat plan`
```

## Why not use an endpoint?

It would help make my code a lot cleaner as I'll be using serializers. But, I decided I'd show the visual portion of the seat plan for the test.

## Why use Rails views?

My proficiency on the FE is with ReactJS. However, since we're not being tested on the FE, I decided to just use the Rails views.

## How did you get 100% Coverage?

I removed some boilerplate code from the coverage of SimpleCov.

## What could you do to make this better?

I think the most controversial part of the code is the `services/seating/generate_seat_view.rb`. I would normally get portions separated into `named blocks / classes` in order to organize my code. But for this one, I resorted to naming instead. Separating them may cause more confusion.
