<p align="center">
  <img src="Crafter.png" />
</p>

|Component|`Crafter`|
|---|---|
|**Module**|`ARCHEAN_machines`|
|**Mass**|200 kg|
|[**Size**](# "Based on the component's occupancy in a fixed 25cm grid.")|100 x 100 x 200 cm|
|**Push/Pull Fluid**|Accept Push, Initiate Pull|
|**Push/Pull Item**|Initiate Push/Pull|
#
---

# Description
The Crafter is a component that allows for the rapid crafting of items.

# Usage
The Crafter requires high voltage power and consumes 500 watts when idle and 10kw when operational.

It can be manually controlled through its integrated touch screen and/or through its data port for more advanced control.


### List of Inputs
|Channel|Function|Value|
|---|---|---|
|0|Continuous Crafting|0 or 1|
|1|Override Craft Selection|text|

### List of Outputs
|Channel|Function|Value|
|---|---|---|
|0|Progress|-1 or 0 to 1|
|1|Craft Selection|text|

> #### Informations:
>- When `progress` in the output data is `-1`, it means that the recipe cannot be performed either due to missing resources or the requested craft does not exist in the game.
>- Even though the Crafter only has two fluid ports, it can use as much fluid as needed for recipes by using [Fluid Junctions](../fluids/FluidJunction.md), which can be connected to all necessary fluid sources. The Crafter will simply use them when needed.
>
> #### Hints:
> - You can simply use a [Toggle Button](../controllers/ToggleButton.md) to start continuous crafting as long as the button is active and there are enough resources in the connected inventory.
>

# Built-in Program
The interface and logic of the Crafter are implemented using a built-in XenonCode program. You can use this program as inspiration to understand how the Crafter works and create your own program on a computer to control the Crafter in a more advanced way.


### Go further with the crafter:
The crafter offers three XenonCode functions to retrieve information about available recipes:
- `get_recipes_categories("crafter")`: Returns the list of recipe categories available in the crafter.
- `get_recipes("crafter", "PARTS")`: Returns the list of recipes available for the `PARTS` category.
- `get_recipe("crafter", "PARTS", "Circuit")`: Returns the list of ingredients needed for the `Circuit` recipe.
With these functions, you can create a XenonCode program to control the crafter in a more advanced way, such as creating an auto-crafting system.

```xc
var $cursor = 0
var $currentCraft:text
var $categories:text

var $upX : number
var $upY : number
var $downX : number
var $downY : number
var $initTime : number
var $error : number

init
	if $initTime == 0
		$initTime = time
	$upX = screen_w-14
	$upY = screen_h/4
	$downX = screen_w-14
	$downY = screen_h*3/4-2
	array $recipesCategories : text
	$recipesCategories.from(get_recipes_categories("crafter"), ",")
	foreach $recipesCategories ($i, $category)
		$categories.$category = 0
	$categories.coffee = 0

tick
	blank()
	text_size(1)
	
	var $p = progress
	
	if time < $initTime+4
		if time > $initTime+1
			write(10,10,cyan,"Initializing Crafter...")
		return
	
	var $dpIndex = 0
	foreach $categories ($category, $open)
		if button(0,(12*$dpIndex)-$cursor,color(10,10,10),screen_w-17,11)
			$categories.$category!!
		write(3,((12*$dpIndex)+2)-$cursor,color(60,60,60),$category)
		$dpIndex++
		if $open
			array $craftArray:text
			$craftArray.from(get_recipes("crafter", $category), ",")
			if $category == "coffee"
				$craftArray.append("Americano","Espresso","Mocha")
			foreach $craftArray ($index, $craft)
				if button(0,(12*$dpIndex)-$cursor,color(10,10,10),screen_w-17,11)
					if $currentCraft == $craft
						$currentCraft = ""
						cancel_craft()
					else
						cancel_craft()
						start_craft($craft)
						$currentCraft = $craft
						$error = 0
				if $currentCraft == $craft
					if $p > 0 and $p < 1
						if $error
							draw(0,(12*$dpIndex)-$cursor,color(128,0,0,64),(screen_w-17)*$p,11)
						else
							draw(0,(12*$dpIndex)-$cursor,color(0,64,64,64),(screen_w-17)*$p,11)
					elseif $p == 1
						draw(0,(12*$dpIndex)-$cursor,color(0,128,0,64),screen_w-17,11)
						$error = 0
					elseif $p < 0
						draw(0,(12*$dpIndex)-$cursor,color(30,15,15),screen_w-17,11)
						$error = 1
					if $error
						write(10,(12*$dpIndex+2)-$cursor,color(80,40,0),$craft)
					else
						write(10,(12*$dpIndex+2)-$cursor,color(20,80,0),$craft)
					var $recipeInputs = get_recipe("crafter", $category, $currentCraft)
					$dpIndex++
					foreach $recipeInputs ($item, $qty)
						write(20,(12*$dpIndex+2)-$cursor,color(40,40,40), $item & ": " & $qty)
						$dpIndex++
					if $category == "coffee"
						write(20,(12*$dpIndex+2)-$cursor,color(40,0,0), "Sorry, out of beans!")
						$error = 1
						$dpIndex++
				else
					write(10,(12*$dpIndex+2)-$cursor,color(40,40,40),$craft)
					$dpIndex++

	if button(screen_w-16,0,color(20,20,20),15,screen_h/2)
		if $cursor > 0
			$cursor -= 50
			if $cursor < 0
				$cursor = 0
	if button(screen_w-16,screen_h/2+1,color(20,20,20),15,screen_h/2)
		$cursor = clamp($cursor + 50, 0, max(0,$dpIndex*12-screen_h/5*4))
	
	draw_triangle(0+$upX,0+$upY,10+$upX,0+$upY,5+$upX,-9+$upY,white,white)
	draw_triangle(0+$downX,0+$downY,10+$downX,0+$downY,5+$downX,9+$downY,white,white)
	
	if $error
		output.0 (-1, $currentCraft)
	else
		output.0 ($p, $currentCraft)

input.0 ($on:number, $craft:text)
	if time < $initTime+5
		return
	var $p = progress
	if $on and ($p == 0 or $p == -1 or $p == 1)
		if $craft and $currentCraft != $craft
			$currentCraft = $craft
			$error = 0
		if $p == 1 or $p == 0
			$error = 0
		elseif $p == -1
			$error = 1
		start_craft($currentCraft)

```