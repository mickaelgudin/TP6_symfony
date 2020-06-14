## Authors

* **Mickael GUDIN** 
* **Julien DOUJET**

# Pokedex in symfony

Project of a pokedex in symfony. In this project
people can registrer to be a trainer, then they
can connect to their account. Trainers can hunt
pokemons with one of their pokemons, they can train them which leads pokemons to gain XP and eventually evolve. Trainers can also buy pokemons
from others trainers that are for sale, and they can sale the pokemons that belongs to them.

## Built With

* [Symfony](https://symfony.com/) - The web framework used
* [Composer](https://getcomposer.org/) - Dependency Management

### Prerequisites

Symfony must be installed in order to run
the commands

### Installing

You need to :

* install the database with the script pokegame.sql located at the root of this project
* change the database configuration in the file
var\cache\dev\App_KernelDevDebugContainer.php at
the line 909

## Running the project

With your command prompt or terminal you
need to get to the root of the project
then you have to enter this command :

```
symfony server:start
```

Then in your browser you search for the following url :

```
http://localhost:8000/
```

If you want to test the connexion here's two trainers and their credentials :

The first one :

```
username : Julien
password : ABCD
```

The other one :

```
username : Micky
password : 12345
```