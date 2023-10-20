# Instructions

Chaitana owns a very popular theme park.
She only has one ride in the very center of beautifully landscaped grounds: The Biggest Roller Coaster in the World(TM).
Although there is only this one attraction, people travel from all over the world and stand in line for hours for the opportunity to ride Chaitana's hypercoaster.

There are two queues for this ride, each represented as a `array`:

1. Normal Queue
2. Express Queue (_also known as the Fast-track_) - where people pay extra for priority access.

You have been asked to write some code to better manage the guests at the park.
You need to implement the following functions as soon as possible before the guests (and your boss, Chaitana!) get cranky.

## 1. Add person to the queue

Define the `ColossalCoaster.add_to_queue` method that takes 4 arguments `<express_queue>, <normal_queue>, <ticket_type>, <person_name>` and returns the appropriate queue updated with the person's name.

1. `<ticket_type>` is an `Int32` with 1 == express_queue and 0 == normal_queue.
2. `<person_name>` is the name (as a `String`) of the person to be added to the respective queue.

```crystal
express_queue = ["Tony", "Bruce"]
normal_queue = ["RobotGuy", "WW"]
ColossalCoaster.add_to_queue(express_queue, normal_queue, 1, "RichieRich")
# => ["Tony", "Bruce", "RichieRich"]
```

## 2. Where are my friends?

One person arrived late at the park but wants to join the queue where their friends are waiting.
But they have no idea where their friends are standing and there isn't any phone reception to call them.

Define the `ColossalCoaster.find_my_friend` method that takes 2 arguments `queue` and `friend_name` and returns the position in the queue of the person's name.

1. `<queue>` is an `array` of people standing in the queue.
2. `<friend_name>` is the name of the friend whose index (place in the queue) you need to find.

```crystal
ColossalCoaster.find_my_friend(["Natasha", "Steve", "T'challa", "Wanda", "Rocket"], "Steve")
# => 1
```

## 3. Can I please join them?

Now that their friends have been found (in task #2 above), the late arriver would like to join them at their place in the queue.
Define the `ColossalCoaster.add_with_friends` method that takes 3 arguments `queue`, `friend_name` and `person_name`.

1. `<queue>` is an `array` of people standing in the queue.
2. `<friend_name>` is the name of the friend at whose position the person should be added.
2. `<person_name>` is the name of the person to add at the index position.

Return the queue updated with the late arrival's name.

```crystal
ColossalCoaster.add_with_friends(["Natasha", "Steve", "T'challa", "Wanda", "Rocket"], "Steve", "Bucky")
# => ["Natasha", "Bucky", "Steve", "T'challa", "Wanda", "Rocket"]
```

## 4. Mean person in the queue

You just heard from the queue that there is a really mean person shoving, shouting, and making trouble.
You need to throw that miscreant out for bad behavior!

Define the `ColossalCoaster.remove_from_queue` method that takes 2 arguments `queue` and `person_name`.

1. `<queue>` is an `array` of people standing in the queue.
2. `<person_name>` is the name of the person that needs to be kicked out.

Return the queue updated without the mean person's name.

```crystal
ColossalCoaster.remove_from_queue(["Natasha", "Steve", "Eltran", "Wanda", "Rocket"], "Eltran")
# => ["Natasha", "Steve", "Wanda", "Rocket"]
```

## 5. Sort the Queue List

For administrative purposes, you need to get all the names in a given queue in alphabetical order.

Define the `ColossalCoaster.sorted_queue` method that takes 1 argument, `queue` (the `array` of people standing in the queue).
The method should return a sorted copy of the `array`.

```crystal
ColossalCoaster.sorted_queue(["Natasha", "Steve", "Eltran", "Natasha", "Rocket"])
# => ['Eltran', 'Natasha', 'Natasha', 'Rocket', 'Steve']
```
