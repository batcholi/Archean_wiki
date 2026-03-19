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
Le Crafter est un composant qui permet la fabrication rapide d'objets.

# Usage
Le Crafter necessite une alimentation haute tension et consomme 500 watts au repos et 10 kW en fonctionnement.

Il peut etre controle manuellement via son ecran tactile integre et/ou via son port de donnees pour un controle plus avance.


### Liste des entrees
|Channel|Function|Value|
|---|---|---|
|0|Continuous Crafting OR Container data|`0` or `1` OR key-value from Container|
|1|Override Craft Selection|text|
|2|Container output for auto-craft|key-value from Container|

### Liste des sorties
|Channel|Function|Value|
|---|---|---|
|0|Progress|-1 or 0 to 1|
|1|Craft Selection|text|
|2|Fluid Levels|text|

> #### Informations :
>- Lorsque `progress` dans les donnees de sortie est `-1`, cela signifie que la recette ne peut pas etre realisee soit en raison de ressources manquantes, soit parce que la fabrication demandee n'existe pas dans le jeu.
>- Le Crafter affiche une alerte **"Not enough power"** si la fabrication echoue en raison d'une puissance insuffisante.
>- Bien que le Crafter n'ait que deux ports de fluide, il peut utiliser autant de fluide que necessaire pour les recettes en utilisant des [Fluid Junctions](../fluids/FluidJunction.md), qui peuvent etre connectees a toutes les sources de fluide necessaires. Le Crafter les utilisera simplement quand c'est necessaire.
>- `Fluid Levels` est un objet key-value contenant des valeurs entre 0 et 1 pour `h2`, `o2` et `h2o`
>
> #### Astuces :
> - Vous pouvez simplement utiliser un [Toggle Button](../controllers/ToggleButton.md) pour demarrer la fabrication continue tant que le bouton est actif et qu'il y a suffisamment de ressources dans l'inventaire connecte.
>

# Aller plus loin avec le Crafter :
## Configuration simple d'auto-fabrication

Le Crafter supporte nativement un comportement d'auto-fabrication lorsqu'il est correctement configure.

Pour l'activer, il suffit de :
- Connecter les ports d'entree et de sortie d'objets du Crafter au meme conteneur.
- Connecter le port de donnees de ce meme conteneur directement au port de donnees du Crafter (canal 0).

Cette configuration permet au Crafter de gerer automatiquement les recettes complexes avec des sous-fabrications en prenant les ingredients directement dans le conteneur.

Tant que le conteneur contient toutes les matieres premieres requises, le Crafter va :
- Fabriquer automatiquement les sous-composants manquants.
- Puis assembler le produit final.

C'est la maniere la plus simple de realiser un systeme d'auto-fabrication sans ecrire de code personnalise.

> - Dans cette configuration, puisque le port de donnees est deja connecte au conteneur, vous ne pourrez pas utiliser un [Toggle Button](../controllers/ToggleButton.md) pour activer la fabrication continue. Au lieu de cela, vous devrez utiliser son ecran integre pour demarrer les fabrications, une par une.
> - Si vous souhaitez implementer une veritable fabrication continue dans cette configuration, vous devrez utiliser une approche plus avancee en utilisant XenonCode pour controler le Crafter.

## Fabrication continue automatique depuis un ordinateur

Vous pouvez controler la fabrication continue automatique entierement depuis un ordinateur en utilisant le **canal 2** :

- **Canal 0** : Definir a `1` pour activer la fabrication continue
- **Canal 1** : Definir le nom de la recette a fabriquer
- **Canal 2** : Connecter la sortie de donnees du Container pour activer l'auto-fabrication avec des sous-fabrications recursives

Cela permet un controle programmatique complet du Crafter tout en beneficiant de la logique de fabrication recursive automatique.

## Auto-fabrication avancee avec XenonCode

Pour des systemes d'auto-fabrication plus avances, ou pour avoir un controle complet sur le processus de fabrication, vous pouvez utiliser XenonCode.

Le Crafter fournit quatre fonctions XenonCode pour recuperer des informations sur les recettes disponibles :

- `get_recipes_categories("crafter")` : Retourne la liste des categories de recettes disponibles dans le Crafter.
- `get_recipes("crafter", "PARTS")` : Retourne la liste des recettes disponibles dans la categorie `PARTS`.
- `get_recipe("crafter", "Circuit")` : Retourne la liste des ingredients necessaires pour la recette `Circuit`.
- `get_recipe_label("ARCHEAN_parts.Circuit")` : Retourne le nom d'affichage lisible (par ex. `"Circuit"`).

#### Programme integre
Le programme integre du Crafter -- celui automatiquement utilise dans la *Configuration simple d'auto-fabrication* -- implemente deja une logique d'auto-fabrication entierement fonctionnelle utilisant ces fonctions. Vous pouvez l'utiliser comme inspiration ou construire votre propre programme personnalise pour repondre a des besoins plus avances ou specifiques.


```xc
var $cursor = 0
var $currentCraft:text
var $categories:text

var $container:text
array $autocraftList:text
array $autocraftQty:number

var $upX : number
var $upY : number
var $downX : number
var $downY : number
var $initTime : number
var $error : number
var $popup = 1
var $continuous = 0
var $dirty = 0
var $maxScroll = 0

function @screenDirty()
	$dirty = 1

function @error()
	if !$error
		@screenDirty()
	$error = 1

function @clearError()
	if $error
		@screenDirty()
	$error = 0

recursive function @autoCraft($item:text, $n:number)
	var $recipe = get_recipe("crafter", $item)
	if $recipe
		$autocraftList.append($item)
		$autocraftQty.append($n)
		$container.$item += $n
		foreach $recipe ($k,$v)
			$container.$k -= $v * $n
			if $container.$k < 0
				recurse($k, -$container.$k)
				if $error
					break
	elseif $container.$item < $n && $item != "H2" && $item != "O2" && $item != "H2O"
		$autocraftList.clear()
		$autocraftQty.clear()
		@error()

function @drawScreen()
	$dirty = 0
	blank()
	text_size(1)
	
	var $p = progress
	if size($autocraftList)
		$p = ($p + 1) / (size($autocraftList) + 1)
	
	if time < $initTime+4
		if time > $initTime+1
			write(10,10,cyan,"Initializing Crafter...")
		return
	
	var $dpIndex = 0
	foreach $categories ($category, $open)
		if button(0,(12*$dpIndex)-$cursor,color(10,10,10),screen_w-17,11)
			$categories.$category!!
			@screenDirty()
		write(3,((12*$dpIndex)+2)-$cursor,color(180,180,180),$category)
		$dpIndex++
		if $open
			array $craftArray:text
			$craftArray.from(get_recipes("crafter", $category), ",")
			foreach $craftArray ($index, $craft)
				if button(0,(12*$dpIndex)-$cursor,color(10,10,10),screen_w-17,11)
					if $currentCraft == $craft
						$currentCraft = ""
						cancel_craft()
						$autocraftList.clear()
						$autocraftQty.clear()
					else
						cancel_craft()
						$autocraftList.clear()
						$autocraftQty.clear()
						$currentCraft = $craft
						@clearError()
						if $container; Autocrafting when a container is connected
							@autoCraft($craft, 1)
							if size($autocraftList)
								start_craft($autocraftList.last)
						else
							start_craft($craft)
					@screenDirty()
				if $currentCraft == $craft
					if $p > 0 and $p < 1
						if $error
							draw(0,(12*$dpIndex)-$cursor,color(128,0,0,64),(screen_w-17)*$p,11)
						elseif $continuous
							draw(0,(12*$dpIndex)-$cursor,color(0,0,64,64),screen_w-17,11)
						else
							draw(0,(12*$dpIndex)-$cursor,color(0,64,64,64),(screen_w-17)*$p,11)
					elseif $p == 1
						draw(0,(12*$dpIndex)-$cursor,color(0,128,0,64),screen_w-17,11)
						@clearError()
					elseif $p < 0
						draw(0,(12*$dpIndex)-$cursor,color(30,15,15),screen_w-17,11)
					if $error
						write(10,(12*$dpIndex+2)-$cursor,color(80,40,0),get_recipe_label($craft))
					else
						write(10,(12*$dpIndex+2)-$cursor,color(20,80,0),get_recipe_label($craft))
					var $recipeInputs = get_recipe("crafter", $currentCraft)
					$dpIndex++
					foreach $recipeInputs ($item, $qty)
						write(20,(12*$dpIndex+2)-$cursor,color(100,100,100), get_recipe_label($item) & ": " & $qty)
						$dpIndex++
				else
					write(10,(12*$dpIndex+2)-$cursor,color(100,100,100),get_recipe_label($craft))
					$dpIndex++

	if button(screen_w-16,0,color(20,20,20),15,screen_h/2)
		if $cursor > 0
			$cursor -= 50
			if $cursor < 0
				$cursor = 0
		@screenDirty()
	if button(screen_w-16,screen_h/2+1,color(20,20,20),15,screen_h/2)
		$cursor = clamp($cursor + 50, 0, $maxScroll)
		@screenDirty()
	
	; Update max scroll limit based on content
	$maxScroll = max(0, $dpIndex*12 - screen_h/5*4)
	
	draw_triangle(0+$upX,0+$upY,10+$upX,0+$upY,5+$upX,-9+$upY,white,white)
	draw_triangle(0+$downX,0+$downY,10+$downX,0+$downY,5+$downX,9+$downY,white,white)

	if $popup
		draw_rect(4,5,196,195,color(150,150,150,240),color(40,40,40,240))
		text_align(top)
		write(0,10,color(0,200,225),"How to enable Auto-Crafting ?")
		text_align(top_left)
		write(7,30,color(200,200,200),"1. Connect both Item ports of")
		write(25,40,color(200,200,200),"the Crafter to the same")
		write(25,50,color(200,200,200),"Container")
		write(7,70,color(200,200,200),"2. Connect the Container's Data")
		write(25,80,color(200,200,200),"port to the Crafter's Data")
		write(25,90,color(200,200,200),"port")
		write(15,110,color(200,200,200),"The Crafter will recursively")
		write(15,120,color(200,200,200),"craft everything using items")
		write(15,130,color(200,200,200),"from the Container.")
		if button_rect(25,150,175,180,color(120,120,120),color(30,30,30))
			$popup = 0
			@screenDirty()
		text_size(2)
		write(56,157,white,"Got it!")
	if !enough_power
		text_size(2)
		text_align(center)
		draw_rect(0,0,screen_w,screen_h,color(0,0,0,220),color(0,0,0,220))
		draw_rect(25,70,175,125,color(120,0,10,230),color(80,20,20,230))
		write(0,-3,color(200,200,200),"Not enough\npower")
		@screenDirty()
		
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
	
tick
	var $p = progress
	if $p < 0
		@error()
	
	; Autocrafting when a container is connected
	if $p >= 1 and size($autocraftList)
		var $qty = $autocraftQty.last - 1
		$autocraftQty.pop()
		if $qty > 0
			$autocraftQty.append($qty)
		else
			$autocraftList.pop()
		if size($autocraftList)
			start_craft($autocraftList.last)
	
	if ($p > 0 and $p < 1 and !$continuous) or time < $initTime+5 or $dirty
		@drawScreen()
	var $fluidLevels = ""
	$fluidLevels.h2 = text("{0.00}", fluid_level("H2"))
	$fluidLevels.h2o = text("{0.00}", fluid_level("H2O"))
	$fluidLevels.o2 = text("{0.00}", fluid_level("O2"))
	if $error
		output.0 (-1, $currentCraft, $fluidLevels)
	else
		output.0 ($p, $currentCraft, $fluidLevels)
	$container = ""
	
click
	@screenDirty()

scroll($scroll:number)
	; Scroll by ~1 line (12 pixels) per scroll step, respecting limits
	$cursor = clamp($cursor - $scroll * 16, 0, $maxScroll)
	@screenDirty()

input.0 ($onOrContainer:text, $craft:text, $autocraftContainer:text)
	print($onOrContainer, $craft, $autocraftContainer)

	; Autocrafting when a container is connected
	if $onOrContainer != "0" and $onOrContainer != "1"
		$container = $onOrContainer
		return
	
	var $on = $onOrContainer:number
	if $continuous != $on
		@screenDirty()
	$continuous = $on
	if time < $initTime+5
		return
	var $p = progress
	if $on and ($p == 0 or $p == -1 or $p == 1)
		if $craft and $currentCraft != $craft
			$currentCraft = $craft
			$autocraftList.clear()
			$autocraftQty.clear()
			@clearError()
			@screenDirty()
		if $p == 1 or $p == 0
			@clearError()
		elseif $p == -1
			@error()
		if $autocraftContainer
			$container = $autocraftContainer
			@autoCraft($currentCraft, 1)
			if size($autocraftList)
				start_craft($autocraftList.last)
		else
			start_craft($currentCraft)
	
	$onOrContainer = ""
	$craft = ""
	$autocraftContainer = ""
```
