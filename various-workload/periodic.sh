#!/bin/sh
animals=("ant" "badger" "bat" "bear" "bee" "beetle" "bird" "bison" "buffalo" "bulldog" "butterfly" "camel" "cat" "catfish" "cheetah" "chicken" "chipmunk" "cobra" "coyote" "cricket" "crow" "deer" "dinosaur" "dolphin" "dove" "dragonfly" "duck" "eagle" "elephant" "elk" "falcon" "flamingo" "fox" "frog" "goldfish" "gopher" "gorilla" "grasshopper" "greyhound" "halibut" "hamster" "hawk" "hedgehog" "heron" "herring" "hornet" "horse" "hummingbird" "jaguar" "jellyfish" "kangaroo" "koala" "ladybug" "leopard" "lion" "lizard" "llama" "lobster" "lynx" "mackerel" "marlin" "mockingbird" "moose" "mosquito" "mussel" "octopus" "orca" "ostrich" "otter" "owl" "ox" "oyster" "panda" "panther" "parrot" "peacock" "pelican" "penguin" "pigeon" "pony" "poodle" "porcupine" "prawn" "puffin" "puma" "python" "rabbit" "raccoon" "raven" "rooster" "salamander" "salmon" "scallop" "scorpion" "seahorse" "shark" "sheep" "snail" "snake" "sparrow" "spider" "squid" "squirrel" "starfish" "stingray" "stork" "swan" "swordfish" "tern" "terrier" "tiger" "toucan" "trout" "tuna" "turkey" "turtle" "viper" "vulture" "wallaby" "walrus" "whale" "wildcat" "wolf" "wombat" "yak" "zebra" )
num=$(echo ${#animals[@]})
echo $num
random_num=`awk -v min=0 -v max=${num} 'BEGIN{srand(); print int(min+rand()*(max-min+1))}'`

echo $random_num

curl 127.0.0.1:8888/animal/${animals[${random_num}]}