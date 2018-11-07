# Gilded Rose Project

*[This project is also on Diode](https://diode.makersacademy.com/students/neoeno/projects/1732)*

This is a project and set of resources designed to help you learn good object
oriented design principles.

You will start with a given codebase for a shop inventory system. The codebase
is completely functional and tested. Your task is to explore a number of ways
to improve its design. In the process you have the opportunity to learn:

* What 'well-designed code' means
* Forwarding (often called Delegation)
* Polymorphism
* Mocking
* Dependency injection

## Exercises

Hi and welcome to team Gilded Rose. As you know, we are a small inn with a prime
location in a prominent city ran by a friendly innkeeper named Allison. We also
buy and sell only the finest goods. Unfortunately, our goods are constantly
degrading in quality as they approach their sell by date. We have a system in
place that updates our inventory for us. It was developed by a no-nonsense type
named Leeroy, who has moved on to new adventures. Your task is to add new
features to our system so that we can begin selling new categories of items.
First an introduction to our system:

* All items have a `sell_in` value which denotes the number of days we have to sell
  the item
* All items have a `quality` value which denotes how valuable the item is
* At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:

* Once the sell by date has passed, `quality` degrades twice as fast
* The `quality` of an item is never negative
* "Aged Brie" actually increases in `quality` the older it gets
* The `quality` of an item is never more than 50
* "Sulfuras", being a legendary item, never has to be sold or decreases in
  `quality`
* "Backstage passes", like aged brie, increases in `quality` as its `sell_in` value
  approaches; `quality` increases by 2 when there are 10 days or less and by 3
  when there are 5 days or less but `quality` drops to 0 after the concert

Feel free to make any changes to the `#update_quality` method and add any new
code as long as everything still works correctly. However, do not alter the
`Item` class as it belongs to the goblin in the corner who will insta-rage and
one-shot you as he doesn't believe in shared code ownership.

Just for clarification, an item can never have its Quality increase above 50,
however "Sulfuras" is a legendary item and as such its Quality is 80 and it
never alters.

### Write the tests (optional)

If you would like to get more practice writing tests or an extra challenge, go
ahead and delete the contents of `spec/gilded_rose_spec.rb`. You can then write
your own tests. Note that this won't be good practice for test-driven
development as the code is already written, but you will still learn much about
testing legacy code in the process.

### Refactor the project

Right now, the project is very hard to change — not a good thing for software.
To make life easier for yourself, you should refactor it to make it easier to
change.

This will likely involve refactoring your tests too, but remember to preserve
your test coverage by test-driving your design changes.

Feel free to keep in mind the first change illustrated below to guide your
design changes.

### Add the first new feature

We have recently signed a supplier of conjured items. This requires an update to
our system:

* "Conjured" items degrade in `quality` twice as fast as normal items

### Get feedback

Send your code to your coach via Slack, who will give it a quick once-over and
give you two things:

1. A short paragraph of feedback
2. A new feature to add

The feature will be designed to encourage you to further improve your design,
or change it to learn a new design technique.

While you are waiting for feedback, use the time however you think best — for
example to review some of the material below. It may take up to a day for
someone to get back to you.

### Keep going

Improve the design, implement the new feature, get feedback — and keep going
until next week or until a coach tells you you've learned everything you can
from this exercise

## Resources

In the rough order you might want to try to cover them.

* [What makes well-designed code?](https://github.com/makersacademy/course/blob/master/pills/what_makes_well_designed_code.md)
* Using [Domain Model Diagramming](https://github.com/makersacademy/skills-workshops/tree/master/week-2/domain_model_diagramming) to help you design programs (this is a workshop, but you can cover it without a coach too)
* Designing for [high cohesion using encapsulation](https://github.com/makersacademy/skills-workshops/blob/master/practicals/object_oriented_design/encapsulation.md).
* Using [Forwarding & Polymorphism](https://github.com/makersacademy/skills-workshops/blob/master/practicals/object_oriented_design/oo_relationships.md) to reduce coupling.
* Using [Dependency Injection](https://github.com/makersacademy/skills-workshops/blob/master/practicals/object_oriented_design/dependency_injection.md) to ensure your unit tests are isolated.
* [Testing relationships between classes](https://github.com/makersacademy/skills-workshops/blob/master/practicals/object_oriented_design/testing_relationships.md)
* Using [Complexity Metrics](https://github.com/makersacademy/skills-workshops/blob/master/practicals/quality/complexity_metrics.md) to help you break up your programs.

### Exemplar

Sandi Metz has a conference talk that mirrors this task, during which she outlines a great process for refactoring and producing good designs.

You should watch it at some point this week, it's up to you when you do so. We recommend watching it at either of these moments:

1. If you feel genuinely stuck and unable to proceed.
2. After you've done some serious work on the problem and would like to take your approach to the next level.

[All The Little Things by Sandi Metz](https://www.youtube.com/watch?v=8bZh5LMaSmE)
