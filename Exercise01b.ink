/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Basic Choices
 - Knot structure
 - Recurring choices
 - Conditionals in descriptions
 - Conditionals in choices
 
 In the assignment:
 - Add four more knots (and feel free to change any of the example text, this is YOUR story)
 - Add at least one more conditional
*/

-> cave_mouth

== cave_mouth ==
You are an archaeologist. You are at the enterance to a recently discovored cave. {not torch_pickup:There is a torch on the floor.} The cave extends to the east and west.
+ [{not east_tunnel_lit and not lit_cavern:Take the East Tunnel}] -> east_tunnel
+ [{east_tunnel_lit or lit_cavern:Take the East Tunnel}] -> east_tunnel_lit
+ [Take the West Tunnel] -> west_tunnel
* [Pick Up The torch] -> torch_pickup
-> END

== east_tunnel ==
You are in the east tunnel. It is very dark, you can't see anything.
* {torch_pickup} [{not no_ladder:Light Torch}] -> east_tunnel_lit
+ [Go back] -> cave_mouth
-> END

== west_tunnel ==
You are in the west tunnel.{lit_cavern: After relighting your torch, you see once again} A few steps into the tunnel there is a hole{not no_ladder: with a ladder leading down. It's too dark to see what's at the bottom.}{no_ladder:, the burning remains of a ladder iluminate that there is a larger room at the bottom, however the drop is too far jump to saftly jump.}
+ [{not no_ladder and not east_tunnel_lit:Take The Ladder Down}] -> west_cavern
+ {east_tunnel_lit and not no_ladder} [Extinguish Torch and Take The Ladder Down] -> west_cavern
* [{no_ladder:Jump Down Anyways}] -> death
* [{torch_pickup and not east_tunnel_lit:Light the Tourch and Drop It Down The Hole}] -> no_ladder
* {east_tunnel_lit} [Drop The Torch Down The Hole] -> no_ladder
+ [Go Back To Entrance] -> cave_mouth
-> END

== torch_pickup ==
You now have a torch. May it light the way.
* [Go Back] -> cave_mouth
-> END

== east_tunnel_lit ==
While in the east tunnel, you watch as the light of your torch glints off the thousands of coins in the room.
* [Grab One of The Coins] -> coin_pickup
+ [Go Back] -> cave_mouth
-> END

== coin_pickup ==
You examin the coin in your hand. It is seemingly made of solid gold, with the figure of a skull imprinted on it. 
* [Go back] -> east_tunnel_lit
-> END

== no_ladder ==
As the torch falls down the shaft it nicks the ladder, causing it to catch fire. 
* [Go Back] -> west_tunnel
-> END

== west_cavern ==
You reach to bottom of the ladder, placing your feet on solid ground. But it is far too dark to see anything.
+ {torch_pickup} [{east_tunnel_lit:Re-}Light Torch] -> lit_cavern
+ [Go Back] -> west_tunnel
-> END

== death ==
You slam onto the cavern's floor breaking both of your legs instantly. As you bleed out, the burning ladder falls onto your head, scorching you as the world fades to black.
-> END

== lit_cavern ==
With a lit torch you can now see a sprawling covern before you with a figure sitting in the middle of the chamber.
+ {coin_pickup} [Investigate The Figure] -> cavern_center_death
+ {not coin_pickup} [Investigate The Figure] -> cavern_center
+ [Extinguish Torch and Go Back Up The Ladder] -> west_tunnel
-> END

== cavern_center_death ==
As you aproch the figure, you realize that it is a skeleton sitting on a throne. Faster than you can react, the skeleton animates, pulling a sword that it promptly uses to skewer you. As you bleed out, in immense pain, you watch as the skeleton procedes to take the gold coin from your pocket; then sit back on its throne.
-> END
== cavern_center
As you aproch the figure, you realize that it is a skeleton sitting on a throne.
* [Leave The Cave To Share This Find With Your Colleagues!]
-> END