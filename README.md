# Eventchecker
World of Warcraft AddOn which monitors the firing of the API events introduced in patch 10.0.0, namely the PLAYER_INTERACTION_MANAGER_FRAME_SHOW and PLAYER_INTERACTION_MANAGER_FRAME_HIDE events. When these two event fire their Payload of Type "Enum.PlayerInteractionType" is evaluated against a list collated from the information given on https://wowpedia.fandom.com/wiki/PLAYER_INTERACTION_MANAGER_FRAME_SHOW, then the result displays in the game chat. Eventchecker also monitors the firing of the old API events then prints the result in the game chat as well. The intention is to show that Blizzard currently has redundant API event code firing for many events; mostly, as the name of the new API events imply, player interaction events, which are the events that trigger most of both the Blizzard UI and third party AddOns to execute code. I believe this negatively affects the game client. My theory is that this overlap may have something to do with the current taint problems AddOn authors are having with previously reliable functions.

To use: The directory containing the .lua and . toc files should be named !Eventchecker, then placed in the
..\World of Warcraft\_retail_\Interface\AddOns directory of your computer.
