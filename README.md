Zombies that were smokers now carry matches or lighters along with their pack of cigarettes.  The drop rate configuration for cigarettes and ignition sources can be found under sandbox options.

### Compatibility Note
This mod performs the following actions:
* When loading a game:  Removes Cigarettes from Distributions for male and female zombies
* OnZombieDead event:
  * If the zombie was a smoker, add cigarettes to zombie's inventory [0-20]
  * If the zombie was a smoker and was carrying an ignition source, add a lighter or matches with variable amount of fuel remaining [0-100%]
