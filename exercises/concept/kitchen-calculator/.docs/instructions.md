# Instructions

While preparing to bake cookies for your friends, you have found that you have to convert some of the measurements used in the recipe.
Only being familiar with the metric system, you need to come up with a way to convert common US baking measurements to milliliters (mL) for your own ease.

Use this conversion chart for your solution:

| Unit to convert | volume | in milliliters (mL) |
| --------------- | ------ | ------------------- |
| mL              | 1      | 1                   |
| US cup          | 1      | 240                 |
| US fluid ounce  | 1      | 30                  |
| US teaspoon     | 1      | 5                   |
| US tablespoon   | 1      | 15                  |

Being a talented programmer in training, you decide to use milliliters as a transition unit to facilitate the conversion from any unit listed to any other (even itself).

## 1. Get the numeric component from a volume-pair

Implement the `KitchenCalculator.get_volume` method.
Given a volume-pair tuple, it should return just the numeric component.

```crystal
KitchenCalculator.get_volume({:cup, 2.0})
# => 2.0
```

## 2. Convert the volume-pair to milliliters

Implement the `KitchenCalculator.to_milliliter` method.
Given a volume-pair tuple, it should convert the volume to milliliters using the conversion chart.

```crystal
KitchenCalculator.to_milliliter({:cup, 2.5})
# => {:milliliter, 600.0}
```

## 3. Convert the milliliter volume-pair to another unit

Implement the `KitchenCalculator.from_milliliter` method. 
Given a volume-pair tuple and the desired unit, it should convert the volume to the desired unit using the conversion chart.

```crystal
KitchenCalculator.from_milliliter({:milliliter, 1320.0}, :cup)
# => {:cup, 5.5}
```

## 4. Convert from any unit to any unit

Implement the `KitchenCalculator.convert` method.
Given a volume-pair tuple and the desired unit, it should convert the given volume to the desired unit.

```crystal
KitchenCalculator.convert({:teaspoon, 9.0}, :tablespoon)
# => {:tablespoon, 3.0}
```
