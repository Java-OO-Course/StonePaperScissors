# Dispatch - Pierre, feuille, ciseaux

Rappel de la définition du **dispatch**:  
Le dispatch est un concept orienté objet qui consiste à **choisir** les comportements à exécuter en s'appuyant sur:
- Des envois de messages.
- Des méthodes polymorphiques.
- L'algorithme de lookup qui va déterminer les méthodes a exécuter en fonction des receveurs.

## Installer le projet

Pour installer le projet dans une image Pharo, copiez et coller le code suivant dans le playground (Meta + Shift + OW) d'**UNE IMAGE PHARO 12**:  

```st
Metacello new
  githubUser: 'Java-OO-Course' project: 'StonePaperScissors' commitish: 'main' path: 'src';
  baseline: 'StonePaperScissors';
  load
```

## 1 - Demander aux objets de définir l'élément gagnant

On va utiliser le dispatch pour **éviter** d'écrire le type d'algorithme suivant:
```st

Game >> #play: aLeftElement right: aRightElement

  ((aLeftElement isKindOf: Paper) and: [aRightElement isKindOf: Paper])
    ifTrue: [ ^ #draw ].
  ((aLeftElement isKindOf: Paper) and: [aRightElement isKindOf: Stone])
    ifTrue: [ ^ #paper ].
  ((aLeftElement isKindOf: Paper) and: [aRightElement isKindOf: Scissors])
    ifTrue: [ ^ #scissors ].

  ((aLeftElement isKindOf: Scissors) and: [aRightElement isKindOf: Scissors])
    ifTrue: [ ^ #draw ].
  ((aLeftElement isKindOf: Scissors) and: [aRightElement isKindOf: Paper])
    ifTrue: [ ^ #scissors ].
  ((aLeftElement isKindOf: Scissors) and: [aRightElement isKindOf: Stone])
    ifTrue: [ ^ #stone ].

  "etc..."
```

Pour ça, on définit une hiérarchie de classes qui va définir nos éléments de jeux:  
Puisque tous les éléments de jeux doivent savoir s'affronter deux à deux, ils vont tous implémenter la méthode `play: aGameElement`.  
On va spécifier cela en créant une classe abstraite GameElement à laquelle on ajoute la méthode play.  

Pour rappel, une classe abstraite est une classe qui définit des signatures de méthodes, i.e. qui donne un comportement à implémenter.  
Une classe abstraite ne doit pas être instanciée car justement tout le comportement définit n'est pas encore implémenté.  
Au même titre qu'une superclasse "standard", une classe abstraite peut aussi factoriser du comportement, i.e. définir un corps de méthode qui va être hérité par les sous-classes.  

Dans la classe GameElement, le code de la méthode `play: aGameElement` sera le suivant:
```st
play: aGameElement

  self subclassResponsibility "Indique que la méthode DOIT être implémentée par les sous-classes"
```

Ensuite on créer une classe pour chacun de nos trois éléments de jeu, `Stone`, `Paper`, `Scissors`.
Pour hériter de la classe `GameElement` on utilise la définition de classe suivante:

```st
GameElement << #Stone ou #Paper ou #Scissors
	slots: {};
	package: 'StonePaperScissors'
```

Lorsque c'est fait, dans l'onglet de définition du protocole des méthodes, on trouve le protocol suivant: `not yet implemented`.  
Comme son nom l'indique il contient toutes les méthodes abstraites qui n'ont pas été encore implémentées (dont la signature est définie dans la classe abstraite).

Pour rendre les méthodes concrètes il faut implémenter le comportement spécifique à chaque sous-classe de la classe abstraite.  

Dans la classe `Paper` par exemple:

```st
play: aGameElement

   "Ici, self est l'élément de gauche."

  (aGameElement isKindOf: Paper) ifTrue: [ ^ #draw ].
  (aGameElement isKindOf: Stone) ifTrue: [ ^ #paper ].
  (aGameElement isKindOf: Scissors) ifTrue: [ ^ #scissors ]
```

Donc maintenant on peut faire jouer une feuille avec n'importe quel élément de jeu:
```st
  Paper new play: Stone new "qui doit renvoyer >>> #paper"
"
   élément         élément
  de gauche       de droite
"
```

On a fait une première délégation, i.e. on a un premier niveau de dispatch.  
En effet, le premier algorithme qu'on a va être découpé en trois.  
Les conditions pour les objets de type `Stone`, celles pour les objets de type `Paper`, et idem pour `Scissors`.  

Chacune de nos conditions est coupée en deux.  
En effet, maintenant plus besoin de vérifier la classe de l'élément de gauche pour la comparer au deuxième car l'élément de gauche vient le receveur de `play: aGameElement`.  
Si l'objet de gauche est instance de la classe `Paper` le lookup se chargera au moment de l'exécution d'aller exécuter la méthode `play: aGameElement` de la classe `Paper`.  
Dans chaque classe on a donc juste besoin de vérifier le type du second élément pour renvoyer le résultat.  

Mais on est en objet, on peut faire mieux.  
Au lieu d'utiliser des conditions dans nos implémentations de la méthode `play: aGameElement`, on peut à nouveau utiliser le **dispatch**.  
Comme on a ici un second niveau de dispatch on appelle ça le **double dispatch**.  

Pour ce faire on va déléguer à notre élément de droite la responsabilité de nous renvoyer le gagnant.  
Mais pour connaître le gagnant il faut que notre élément de droite connaisse le type de l'élément de gauche.  
Pour signaler à notre élément de droite le type de l'élément de gauche, on utilise définit une méthode dédiée.  

Exemple pour la classe `Paper`:

```st
play: aGameElement

  "Ici aGameElement est l'élement de droite."
  "playAgainstPaper: est la méthode dédiée qui permet à un objet de la classe papier de signaler son type à l'élément de droite."
  
  ^ aGameElement playAgainstPaper: self
```

L'élément de droite sait qu'il joue contre une instance de `Paper`.  
Pour que le dispatch fonctionne il faut que la classe `Paper` puisse envoyer `playAgainstPaper:` à n'importe quel objet susceptible de se trouver à droite.  
Comme les élément de jeu sont permutables, toutes les classes doivent implémenter `playAgainstPaper:`, c'est ce qui rend notre dispatch **symétrique**.  

On aura donc trois implémentations de `playAgainstPaper:`:

```st
Stone << #playAgainstPaper: aPaper

  "self ici est une instance de Stone, élément de droite."
  "Quand l'élément de gauche est un papier, ici transmit en argument et que playAgainstPaper: aPaper s'exécute sur une instance de Stone, alors c'est #paper le gagnant."

  ^ #paper "À noter qu'ici on renvoit un symbole pour représenter le gagnant mais on pourrait aussi bien renvoyer l'objet gagnant directement ici aPaper."

Paper << #playAgainstPaper: aPaper

  "L'élément de droite peu aussi être instance de `Paper` donc il doit aussi implémenter playAgainstPaper:"

  ^ #draw

Scissors << #playAgainstPaper: aPaper

  ^ #scissors
```

Et voilà on a remplacé toutes nos doubles conditions par du double dispatch.  
Particulièrement utile pour découper des algorithmes de parcours de structures composites par exemple.  

Maintenant tous nos objets vont devoir être en mesure de répondre à:
-  playAgainstStone: aStone
-  playAgainstPaper: aPaper
-  playAgainstScissors: aScissors

Donc on déclare les signatures de méthodes en abstraite dans la classe abstraite `GameElement`.  
Et oui, ces méthodes sont elles aussi polymorphiques.  
En enfin on implémente toutes ces méthodes dans les sous-classes de `GameElement`.  

## 2 - Lancer le jeu

On peut maintenant simuler le jeu en tirant au sors les éléments de jeu qui vont s'affronter.
```st
| leftElement rightElement |

leftElement := (GameElement subclasses atRandom) new. "On demande toutes les sous-classes de GameElement, on en prend une au hasard et on créé une instance."
rightElement := (GameElement subclasses atRandom) new. 

leftElement play: rightElement.
```

## 3 - Ajouter une action en fonction du résultat

Maintenant, disons que l'on veut effectuer une action en fonction du résultat du jeu, par exemple "afficher le résultat dans la console".  

On peut écrire l'algorithme suivant:  

```st
| result leftElement rightElement |

Transcript open; clear. "Ouvre la console."

leftElement := (GameElement subclasses atRandom) new. 
rightElement := (GameElement subclasses atRandom) new. 

result := leftElement play: rightElement.

(result = #draw) ifTrue: [
  ('Draw between ', leftElement asString, ' and ', rightElement asString) crTrace
].
(result = #paper) ifTrue: [
  (leftElement isKindOf: Paper)
    ifTrue: [
      (leftElement asString , ' win against ', rightElement asString) crTrace "crTrace affiche la chaine dans la console"
    ]
    ifFalse: [
      (rightElement asString , ' win against ', leftElement asString) crTrace
    ]
].
(result = #stone) ifTrue: [
  (leftElement isKindOf: Stone)
    ifTrue: [
      (leftElement asString , ' win against ', rightElement asString) crTrace "crTrace affiche la chaine dans la console"
    ]
    ifFalse: [
      (rightElement asString , ' win against ', leftElement asString) crTrace
    ]
].
(result = #scissors) ifTrue: [
  (leftElement isKindOf: Scissors)
    ifTrue: [
      (leftElement asString , ' win against ', rightElement asString) crTrace "crTrace affiche la chaine dans la console"
    ]
    ifFalse: [
      (rightElement asString , ' win against ', leftElement asString) crTrace
    ]
].
```

Bof, pas terrible, on a du code répété, tout est dans des conditions.  
Dommage quand on sait qu'on a déjà la structure objet qui peut faire ça pour nous.  

On va réutiliser exactement le même principe qu'au dessus (double dispatch).  
Sauf que cette fois à la place de renvoyer un symbole (#draw, #stone, #paper, #scissors), on va donner le comportement à exécuter en fonction de si l'élément de gauche est gagant, perdant ou neutre.  

Pour donner le comportement à effectuer on va utiliser des blocks:  
```st

| leftElement rightElement |

Transcript open; clear. "Ouvre la console."

leftElement := (GameElement subclasses atRandom) new.
rightElement := (GameElement subclasses atRandom) new.

leftElement competeWith: rightElement 
	onDraw: [ :leftElement :rightElement | ('Draw between: ', leftElement asString, ' and ', rightElement asString) crTrace ]
	onReceiverWin: [ :leftElement :rightElement | (leftElement asString, ' win against ', rightElement asString) crTrace]
	onReceiverLose: [ :leftElement :rightElement | (leftElement asString, ' loose against ', rightElement asString) crTrace].

  "Dans le nom de méthode ici, Receiver fait référence à l'élément de gauche."
```

Quand on aura modifié un peut notre structure on pourra avoir cette écriture (ci-dessus) pour remplacer l'algorithme avec toutes les conditions.  

Le message `competeWith: aGameElement onDraw: aDrawBlock onReceiverWin: aWinBlock onReceiverLose: aLoseBlock` sera l'équivalent de `play: aGameElement` vu en section 1.  

Pour la classe `Paper` on aurait donc:  

```st
competeWith: aGameElement onDraw: aDrawBlock onReceiverWin: aWinBlock onReceiverLose: aLoseBlock

   "Ici, self est l'élément de gauche."

  (aGameElement isKindOf: Paper) ifTrue: [ aDrawBlock value: self value: aGameElement "Exécute le block en passant deux arguments" ].
  (aGameElement isKindOf: Stone) ifTrue: [ aWinBlock value: self value: aGameElement ].
  (aGameElement isKindOf: Scissors) ifTrue: [ aLoseBlock value: self value: aGameElement ]
```

Comme vu en section 1 ici on a un seul niveau de dispatch.  
On peut supprimer les conditions en ajoutant un deuxième niveau de dispatch.  
À nouveau on va ajouter des messages dédiés dans la classe de chaque élément de jeu censé savoir jouer contre une instance de `Paper`.  
Cependant on va aussi transmettre en argument le comportement à exécuter (les blocks) en cas de victoire de l'élément de gauche (ici un `a Paper`).  

```st
Stone << #playAgainstPaper: aPaper onDraw: aDrawBlock onReceiverWin: aWinBlock onReceiverLose: aLoseBlock

  ^ aWinBlock value: aPaper value: self

Paper << #playAgainstPaper: aPaper onDraw: aDrawBlock onReceiverWin: aWinBlock onReceiverLose: aLoseBlock

  ^ aDrawBlock value: aPaper value: self

Scissors << #playAgainstPaper: aPaper onDraw: aDrawBlock onReceiverWin: aWinBlock onReceiverLose: aLoseBlock

  ^ aLoseBlock value: aPaper value: self
```

Ça y est maintenant on a délégué via du double dispatch l'exécution de comportement en fonction de l'élément du jeu qui est victorieux (ou pas).  
Plus besoin de créer un long code avec plein de conditions difficiles à lire.  
On demande juste à nos objets de jouer en leur disant quoi faire dans les cas de victoire, défaite ou égalité.  

## 3 - Ajouter une action en fonction du résultat

Mais spécifier le comportement à exécuter dans des blocks n'est toujours pas l'idéal.  
Pourquoi ? Parce qu'à chaque fois que je veux faire jouer mes objets je vais devoir définir ces blocks.  
Admettons que l'on souhaite utiliser le jeu à différents endroits d'une plus grande application.  
Comment réutiliser les blocks pour éviter la répétition de code ?  

On va résoudre ce problème en créant des objets qui seront chargés de récupérer le résultat du jeu et d'exécuter des comportements en fonction.  
On créé une classe `ResultHandler` dans laquelle on va implémenter les méthodes suivantes:  
- `drawBetween: aLeftElement and: aRightElement`: à appeller si le résultat est une égalité.
- `winner: aWinner loser: aLoser : à appeller si le résultat est différent d'une égalité.
- `isDraw`: renvoit true si il y a égalité, false sinon.
- `winner`: accesseur qui renvoit le gagnant ou déclenche une erreur si on tente de récupérer le gagnant mais qu'il y a égalité.
- `loser`: accesseur qui renvoit le perdant ou déclenche une erreur si on tente de récupérer le gagnant mais qu'il y a égalité.

On va modifier notre hiérarchie de jeu comme précédemment.  
À la place de la méthode `play: aGameElement`, on aura `play: aGameElement result: aResultHandler`.  
À la place des méthodes `playAgainst< un élément >: aGameElement`, on aura `playAgainst< un élément >: aGameElement result: aResultHandler`.  

Pour la classe `Paper` on aurait donc
```st
play: aGameElement result: aResultHandler

   ^ aGameElement playAgainstPaper: self result: aResultHandler
```

Dans les autres classes la méthode `playAgainstPaper: aPaper result: aResultHandler` prendra la forme suivante:

```st
Stone >> #playAgainstPaper: aPaper result: aResultHandler 

	^ aResultHandler winner: aPaper against: self

Paper >> #playAgainstPaper: aPaper result: aResultHandler 

	^ aResultHandler drawBetween: aPaper and: self 

Scissors >> #playAgainstPaper: aPaper result: aResultHandler 

	^ aResultHandler winner: self against: aPaper
```

Comme pour les sections précédentes on implémente les messages manquant pour toutes autres classes et on ajoute les signatures de méthodes dans la classe abstraite.   
Quand l'implémentation est terminée, on peut jouer en seulement quelques lignes de code.

```st
| result leftElement rightElement |

leftElement := (GameElement subclasses atRandom) new.
rightElement := (GameElement subclasses atRandom) new.

result := leftElement play: rightElement result: ResultHandler new.

"Pour savoir ce que contient le résultat on appelle les fonctions suivantes:"

result isDraw.
result winner. "Attention, il y aura une exception si on exécute winner ou loser alors que le résultat est draw."
result loser.
```

Pour ajouter du comportement on sous-classe `ResultHandler` et on surcharge (redéfinit) les méthodes suivante:
- `drawBetween: aLeftElement and: aRightElement`: à appeller si le résultat est une égalité.
- `winner: aWinner loser: aLoser : à appeller si le résultat est différent d'une égalité.

Exemple, je veux créer un handler qui log dans la console les différentes parties.   
Pour ça je créé une classe `ResultLogger` avec les méthodes:  

```st
ResultLogger >> #drawBetween: aLeftElement and: aRightElement

	super winner: aLeftElement against: aRightElement. "On appelle le comportement par défaut de la superclasse"

	('Draw between ', aLeftElement asString, ' and ', aRightElement asString) crTrace

ResultLogger >> #winner: aWinnerElement against: aLoserElement

	super winner: aWinnerElement against: aLoserElement.
	 
	(aWinnerElement asString , ' win against ' , aLoserElement asString) crTrace
```

`ResultLogger` hérite de `ResultHandler` et donc des méthodes `winner, isDraw, loser`.  
Désormais on peut facilement logger et renvoyer les résultats juste en créant une instance de `ResultLogger`.  

```st
| result leftElement rightElement |

Transcript open; clear. "Ouvre la console."

leftElement := (GameElement subclasses atRandom) new.
rightElement := (GameElement subclasses atRandom) new.

result := leftElement play: rightElement result: ResultLogger new.

"Pour savoir ce que contient le résultat on appelle les fonctions suivantes:"

result isDraw.
result winner. "Attention, il y aura une exception si on exécute winner ou loser alors que le résultat est draw."
result loser.
```

Le code définissant le comportement est maintenant réutilisable et factorisé puisqu'il est porté par une classe.  
De plus si on souhaite définir de nouveaux comportements, par exemple "compter le nombre d'égalités", il suffit de créer une nouvelle sous-classe de `ResultHandler`.




