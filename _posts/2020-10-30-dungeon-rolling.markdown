---
layout: post
title:  "Dungeon Rolling: A DnD Dice Roller built using C"
date:   2020-10-30 00:00:00 +0700
tags:  project for-fun c-language terminal
---

Dungeon rollin’, the dice rolling simulators based on dungeon and dragon game.

But what exactly is DND? DND is a fantasy tabletop role-playing game. DND departs from traditional wargaming by allowing each player to create their own character, by the maximum player of 6, Together they solve dilemmas, engage in battle, explore,  gather treasure and knowledge. In the process, the character will earn experience points in order to rise in levels and become increasingly powerful. But in order for you to decide whether if you can engage in battle or gather treasure and some source of that progress, you need to roll dices.

For the dice, this game has 7 different types of dices include 4 sided dice, 6 sided dice the most commonly well known from many different games. Next, up, 8 sided dice, 10 sided dice, 12 sided dice, and the last, the beginning, the end, the paragon of tabletop role-playing game the one and the only Icosahedron dice.

Check out the project in GitHub [here][link]!

[link]: https://github.com/jarondlk/dungeon-rolling

```c
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

/*==============================================================================

    _/_/_/.    __/     _/   _/_/      _/_/_/      _/_/_/_/   _/_/_/     _/_/
   _/     _/  __/     _/  _/   _/   _/          _/         _/     _/  _/    _/
  _/     _/  __/     _/  _/    _/  _/   _/_/_/ _/_/_/_/   _/     _/  _/     _/
 _/     _/  __/     _/  _/    _/   _/     _/  _/         _/     _/  _/     _/
  _/_/_/    __/_/_/_/  _/    _/    _/ _/_/    _/_/_/_/    _/_/     _/     _/

           _/_/_/   _/_/_/.     _/       _/       _/_/_/   _/_/    _/_/_/
         _/    _/ _/     _/   _/       _/         _/    _/     _/  _/_/
        _/_/_/   _/      _/  _/       _/         _/    _/      _/  _/
        _/_/     _/     _/  _/       _/         _/    _/      _/
      _/   _/    _/_/_/   _/_/_/_/ _/_/_/_/ _/_/_/   _/      _/  

================================================================================

    || Dungeon Rollin’ ||
    Roll the Dice, Slay the Dragon

    What is Dungeon & Dragons ?
        The core of D&D is storytelling. You and your friends tell a story 
        together, guiding your heroes through quests for treasure, battles 
        with deadly foes, daring rescues, courtly intrigue, and much more. 

    Main Idea:
        -   Dice roller for the tabletop RPG “Dungeon & Dragons”
        -   Compose of several sets of die with several faces.
        -   User can input the desired amount of die and add multipliers
        -   Calculate dice rolling results and display in different forms: 
                >   Individual results
                >   Total result
                >   Results without multipliers


================================================================================

    [[[[  OUTLINE MAP  ]]]]
    
        --> Structural datatype declaration 
            -> Storing cantrip spells (quick spell)
    
        --> Sub-Function
            -> Calculating quickspell damage

        --> Functions of available features
            -> Add dice
            -> Roll dice
            -> Casting quick spell
            -> View credit

        --> Main Menu function, which display:
            -> Current dice
            -> Feature selection

        --> Main function for initializing

================================================================================

    Copyright 2020, Jaronchai   Dilokkalayakul

==============================================================================*/

//  Main Menu Declaration
void mainmenu();

//  Cantrip Spell Structures
struct cantrip
{
    char name[30];
    char description[200];
    int range;
    int dicetype;
};

//  Quick Spell Calculation
int quickspellroll(int spelltier, int spelldicetype)
{
    int num = 0, temp = 0;

    srand(time(NULL));

    for (int i = 0; i < spelltier; ++i)
    {
        temp = (rand() % spelldicetype) + 1;
        num += temp;
    }

    return num;
}

//  Feature Functions
void adddice(
    int *numtimed4, int *numtimed6, int *numtimed8, int *numtimed10,
    int *numtimed100, int *numtimed12, int *numtimed20, int *modifier)
{
    char diceselect;
    int temp = 0;

    fflush(stdin);

    while (diceselect != 'I')
    {
        printf(
            "\nSelect dice to add:\n"
            "\tA) d4\n"
            "\tB) d6\n"
            "\tC) d8\n"
            "\tD) d10\n"
            "\tE) d100\n"
            "\tF) d12\n"
            "\tG) d20\n"
            "\tH) Modifier\n"
            "\tI) Return to main menu\n"
            "Please enter your selection: ");
        scanf("%c", &diceselect);

        if (diceselect == 'A')
        {
            printf(
                "Enter the number of dice you want to add (Maximum of 500): ");
            scanf("%d", &temp);
            *numtimed4 += temp;
            temp = 0;
            fflush(stdin);
        }
        else if (diceselect == 'B')
        {
            printf(
                "Enter the number of dice you want to add (Maximum of 500): ");
            scanf("%d", &temp);
            *numtimed6 += temp;
            temp = 0;
            fflush(stdin);
        }
        else if (diceselect == 'C')
        {
            printf(
                "Enter the number of dice you want to add (Maximum of 500): ");
            scanf("%d", &temp);
            *numtimed8 += temp;
            temp = 0;
            fflush(stdin);
        }
        else if (diceselect == 'D')
        {
            printf(
                "Enter the number of dice you want to add (Maximum of 500): ");
            scanf("%d", &temp);
            *numtimed10 += temp;
            temp = 0;
            fflush(stdin);
        }
        else if (diceselect == 'E')
        {
            printf(
                "Enter the number of dice you want to add (Maximum of 500): ");
            scanf("%d", &temp);
            *numtimed100 += temp;
            temp = 0;
            fflush(stdin);
        }
        else if (diceselect == 'F')
        {
            printf(
                "Enter the number of dice you want to add (Maximum of 500): ");
            scanf("%d", &temp);
            *numtimed12 += temp;
            temp = 0;
            fflush(stdin);
        }
        else if (diceselect == 'G')
        {
            printf(
                "Enter the number of dice you want to add (Maximum of 500): ");
            scanf("%d", &temp);
            *numtimed20 += temp;
            temp = 0;
            fflush(stdin);
        }
        else if (diceselect == 'H')
        {
            printf(
                "Enter the number of modifier you want to add: ");
            scanf("%d", &temp);
            *modifier += temp;
            temp = 0;
            fflush(stdin);
        }
    }

    mainmenu(numtimed4, numtimed6, numtimed8, numtimed10,
             numtimed100, numtimed12, numtimed20, modifier);
}
void rolldice(
    int *numtimed4, int *numtimed6, int *numtimed8, int *numtimed10,
    int *numtimed100, int *numtimed12, int *numtimed20, int *modifier)
{
    // Declare array of roll results for each dice
    int d4roll[500] = {0};
    int d6roll[500] = {0};
    int d8roll[500] = {0};
    int d10roll[500] = {0};
    int d100roll[500] = {0};
    int d12roll[500] = {0};
    int d20roll[500] = {0};

    int i, num = 0, total = 0;
    char option;
    //display individual results
    int d4ind = 0, d6ind = 0, d8ind = 0, d10ind = 0;
    int d100ind = 0, d12ind = 0, d20ind = 0;

    // Seeding rand()
    srand(time(NULL));

    // Roll and store results
    for (i = 0; i < *numtimed4; ++i)
    {
        num = (rand() % 4) + 1;
        d4roll[i] = num;
        num = 0;
    }
    for (i = 0; i < *numtimed6; ++i)
    {
        num = (rand() % 6) + 1;
        d6roll[i] = num;
        num = 0;
    }
    for (i = 0; i < *numtimed8; ++i)
    {
        num = (rand() % 8) + 1;
        d8roll[i] = num;
        num = 0;
    }
    for (i = 0; i < *numtimed10; ++i)
    {
        num = (rand() % 10) + 1;
        d10roll[i] = num;
        num = 0;
    }
    for (i = 0; i < *numtimed100; ++i)
    {
        num = ((rand() % 10) + 1) * 10;
        d100roll[i] = num;
        num = 0;
    }
    for (i = 0; i < *numtimed12; ++i)
    {
        num = (rand() % 12) + 1;
        d12roll[i] = num;
        num = 0;
    }
    for (i = 0; i < *numtimed20; ++i)
    {
        num = (rand() % 20) + 1;
        d20roll[i] = num;
        num = 0;
    }

    // Calculate for individual results
    for (i = 0; i < 500; ++i)
    {
        d4ind += d4roll[i];
    }
    for (i = 0; i < 500; ++i)
    {
        d6ind += d6roll[i];
    }
    for (i = 0; i < 500; ++i)
    {
        d8ind += d8roll[i];
    }
    for (i = 0; i < 500; ++i)
    {
        d10ind += d10roll[i];
    }
    for (i = 0; i < 500; ++i)
    {
        d100ind += d100roll[i];
    }
    for (i = 0; i < 500; ++i)
    {
        d12ind += d12roll[i];
    }
    for (i = 0; i < 500; ++i)
    {
        d20ind += d20roll[i];
    }

    // Calculate for total results
    total = d4ind + d6ind + d8ind + d10ind +
            d100ind + d12ind + d20ind + *modifier;

    // Display the results
    printf(
        "\n_______________________________\n"
        "\nResults of individual dice are:\n"
        "%dd4 : %d\n%dd6 : %d\n%dd8 : %d\n%dd10 : %d\n"
        "%dd100 : %d\n%dd12 : %d\n%dd20 : %d\n",
        *numtimed4, d4ind, *numtimed6, d6ind, *numtimed8, d8ind,
        *numtimed10, d10ind, *numtimed100, d100ind, *numtimed12, d12ind,
        *numtimed20, d20ind);

    printf("\nThe total result is : %d\n", total);

    printf(
        "( Without modifier : %d )\n",
        total - *modifier);

    fflush(stdin);
    printf("\nR)eturn to Main Menu  OR  E)xit program : ");
    scanf("%c", &option);

    if (option == 'R')
    {
        mainmenu(numtimed4, numtimed6, numtimed8, numtimed10,
                 numtimed100, numtimed12, numtimed20, modifier);
    }
    else
    {
        exit(0);
    }
}
void quickspell(
    int *numtimed4, int *numtimed6, int *numtimed8, int *numtimed10,
    int *numtimed100, int *numtimed12, int *numtimed20, int *modifier)
{
    int level = 0, spelltier = 0;
    char spellselect;
    char contyesno;

    struct cantrip EldritchBlast = {
        "Eldritch Blast",
        "A beam of crackling energy streaks toward a creature within range.",
        120,
        10};
    struct cantrip HandOfRadiance = {
        "Hand of Radiance",
        "You raise your hand, and burning radiance erupts from it.",
        5,
        6};
    struct cantrip FireBolt = {
        "Fire Bolt",
        "You hurl a mote of fire at a creature or object within range. ",
        120,
        10};
    struct cantrip Frostbite = {
        "Frostbite",
        "You cause numbing frost to form on a creature within range. ",
        60,
        6};
    struct cantrip LightningLure = {
        "Lightning Lure",
        "You create a lash of lightning energy that strikes at one creature.",
        15,
        8};
    struct cantrip RayOfFrost = {
        "Ray of Frost",
        "A frigid beam of blue-white light streaks toward a creature.",
        60,
        8};
    struct cantrip SacredFlame = {
        "Sacred Flame",
        "Flame-like radiance descends on a creature within range.",
        60,
        8};
    struct cantrip Thunderclap = {
        "Thunderclap",
        "You create a burst of thunderous sound, which can be heard far away.",
        5,
        6};
    struct cantrip WordOfRadiance = {
        "Word of Radiance",
        "You utter a divine word, and burning radiance erupts from you.",
        5,
        6};

    fflush(stdin);

    // Player level will affect spell damage
    printf("\nPlease enter your character level: ");
    scanf("%d", &level);

    if (level > 0 && level <= 4)
    {
        spelltier = 1;
    }
    else if (level > 4 && level <= 10)
    {
        spelltier = 2;
    }
    else if (level > 10 && level <= 16)
    {
        spelltier = 3;
    }
    else
    {
        spelltier = 4;
    }

    printf(
        "\n_______________________________\n"
        "\nPlayer's level: %d || Damage multiplier: %d",
        level, spelltier);

    fflush(stdin);

    printf(
        "\nAvailable Evocation Cantrips:\n"
        "\tA) Eldritch Blast\n"
        "\tB) Hand of Radiance\n"
        "\tC) Fire Bolt\n"
        "\tD) Frostbite\n"
        "\tE) Lightning Lure\n"
        "\tF) Ray of Frost\n"
        "\tG) Sacred Flame\n"
        "\tH) Thunderclap\n"
        "\tI) Word of Radiance\n"
        "\tJ) Return to Main Menu\n"
        "Please enter your selection: ");
    scanf("%c", &spellselect);

    // Roll and display result for each spell
    if (spellselect == 'A')
    {
        fflush(stdin);
        printf(
            "\n_______________________________\n"
            "\nYou are casting %s with range of %d feet\n%s\n"
            "You will roll %dd%d Continue? (Y/N) :",
            EldritchBlast.name, EldritchBlast.range,
            EldritchBlast.description, spelltier, EldritchBlast.dicetype);
        scanf("%c", &contyesno);

        if (contyesno == 'Y')
        {
            printf(
                "You deal %d damage.",
                quickspellroll(spelltier, EldritchBlast.dicetype));

            char option;

            fflush(stdin);
            printf("\n\nR)eturn to Main Menu  OR  E)xit program : ");
            scanf("%c", &option);

            if (option == 'R')
            {
                mainmenu(numtimed4, numtimed6, numtimed8, numtimed10,
                         numtimed100, numtimed12, numtimed20, modifier);
            }
            else
            {
                exit(0);
            }
        }
        else
        {
            mainmenu(numtimed4, numtimed6, numtimed8, numtimed10,
                     numtimed100, numtimed12, numtimed20, modifier);
        }
    }
    else if (spellselect == 'B')
    {
        fflush(stdin);
        printf(
            "\n_______________________________\n"
            "\nYou are casting %s with range of %d feet\n%s\n"
            "You will roll %dd%d Continue? (Y/N) :",
            HandOfRadiance.name, HandOfRadiance.range,
            HandOfRadiance.description, spelltier, HandOfRadiance.dicetype);
        scanf("%c", &contyesno);

        if (contyesno == 'Y')
        {
            printf(
                "You deal %d damage.",
                quickspellroll(spelltier, HandOfRadiance.dicetype));

            char option;

            fflush(stdin);
            printf("\n\nR)eturn to Main Menu  OR  E)xit program : ");
            scanf("%c", &option);

            if (option == 'R')
            {
                mainmenu(numtimed4, numtimed6, numtimed8, numtimed10,
                         numtimed100, numtimed12, numtimed20, modifier);
            }
            else
            {
                exit(0);
            }
        }
        else
        {
            mainmenu(numtimed4, numtimed6, numtimed8, numtimed10,
                     numtimed100, numtimed12, numtimed20, modifier);
        }
    }
    else if (spellselect == 'C')
    {
        fflush(stdin);
        printf(
            "\n_______________________________\n"
            "\nYou are casting %s with range of %d feet\n%s\n"
            "You will roll %dd%d Continue? (Y/N) :",
            FireBolt.name, FireBolt.range,
            FireBolt.description, spelltier, FireBolt.dicetype);
        scanf("%c", &contyesno);

        if (contyesno == 'Y')
        {
            printf(
                "You deal %d damage.",
                quickspellroll(spelltier, FireBolt.dicetype));

            char option;

            fflush(stdin);
            printf("\n\nR)eturn to Main Menu  OR  E)xit program : ");
            scanf("%c", &option);

            if (option == 'R')
            {
                mainmenu(numtimed4, numtimed6, numtimed8, numtimed10,
                         numtimed100, numtimed12, numtimed20, modifier);
            }
            else
            {
                exit(0);
            }
        }
        else
        {
            mainmenu(numtimed4, numtimed6, numtimed8, numtimed10,
                     numtimed100, numtimed12, numtimed20, modifier);
        }
    }
    else if (spellselect == 'D')
    {
        fflush(stdin);
        printf(
            "\n_______________________________\n"
            "\nYou are casting %s with range of %d feet\n%s\n"
            "You will roll %dd%d Continue? (Y/N) :",
            Frostbite.name, Frostbite.range,
            Frostbite.description, spelltier, Frostbite.dicetype);
        scanf("%c", &contyesno);

        if (contyesno == 'Y')
        {
            printf(
                "You deal %d damage.",
                quickspellroll(spelltier, Frostbite.dicetype));

            char option;

            fflush(stdin);
            printf("\n\nR)eturn to Main Menu  OR  E)xit program : ");
            scanf("%c", &option);

            if (option == 'R')
            {
                mainmenu(numtimed4, numtimed6, numtimed8, numtimed10,
                         numtimed100, numtimed12, numtimed20, modifier);
            }
            else
            {
                exit(0);
            }
        }
        else
        {
            mainmenu(numtimed4, numtimed6, numtimed8, numtimed10,
                     numtimed100, numtimed12, numtimed20, modifier);
        }
    }
    else if (spellselect == 'E')
    {
        fflush(stdin);
        printf(
            "\n_______________________________\n"
            "\nYou are casting %s with range of %d feet\n%s\n"
            "You will roll %dd%d Continue? (Y/N) :",
            LightningLure.name, LightningLure.range,
            LightningLure.description, spelltier, LightningLure.dicetype);
        scanf("%c", &contyesno);

        if (contyesno == 'Y')
        {
            printf(
                "You deal %d damage.",
                quickspellroll(spelltier, LightningLure.dicetype));

            char option;

            fflush(stdin);
            printf("\n\nR)eturn to Main Menu  OR  E)xit program : ");
            scanf("%c", &option);

            if (option == 'R')
            {
                mainmenu(numtimed4, numtimed6, numtimed8, numtimed10,
                         numtimed100, numtimed12, numtimed20, modifier);
            }
            else
            {
                exit(0);
            }
        }
        else
        {
            mainmenu(numtimed4, numtimed6, numtimed8, numtimed10,
                     numtimed100, numtimed12, numtimed20, modifier);
        }
    }
    else if (spellselect == 'F')
    {
        fflush(stdin);
        printf(
            "\n_______________________________\n"
            "\nYou are casting %s with range of %d feet\n%s\n"
            "You will roll %dd%d Continue? (Y/N) :",
            RayOfFrost.name, RayOfFrost.range,
            RayOfFrost.description, spelltier, RayOfFrost.dicetype);
        scanf("%c", &contyesno);

        if (contyesno == 'Y')
        {
            printf(
                "You deal %d damage.",
                quickspellroll(spelltier, RayOfFrost.dicetype));

            char option;

            fflush(stdin);
            printf("\n\nR)eturn to Main Menu  OR  E)xit program : ");
            scanf("%c", &option);

            if (option == 'R')
            {
                mainmenu(numtimed4, numtimed6, numtimed8, numtimed10,
                         numtimed100, numtimed12, numtimed20, modifier);
            }
            else
            {
                exit(0);
            }
        }
        else
        {
            mainmenu(numtimed4, numtimed6, numtimed8, numtimed10,
                     numtimed100, numtimed12, numtimed20, modifier);
        }
    }
    else if (spellselect == 'G')
    {
        fflush(stdin);
        printf(
            "\n_______________________________\n"
            "\nYou are casting %s with range of %d feet\n%s\n"
            "You will roll %dd%d Continue? (Y/N) :",
            SacredFlame.name, SacredFlame.range,
            SacredFlame.description, spelltier, SacredFlame.dicetype);
        scanf("%c", &contyesno);

        if (contyesno == 'Y')
        {
            printf(
                "You deal %d damage.",
                quickspellroll(spelltier, SacredFlame.dicetype));

            char option;

            fflush(stdin);
            printf("\n\nR)eturn to Main Menu  OR  E)xit program : ");
            scanf("%c", &option);

            if (option == 'R')
            {
                mainmenu(numtimed4, numtimed6, numtimed8, numtimed10,
                         numtimed100, numtimed12, numtimed20, modifier);
            }
            else
            {
                exit(0);
            }
        }
        else
        {
            mainmenu(numtimed4, numtimed6, numtimed8, numtimed10,
                     numtimed100, numtimed12, numtimed20, modifier);
        }
    }
    else if (spellselect == 'H')
    {
        fflush(stdin);
        printf(
            "\n_______________________________\n"
            "\nYou are casting %s with range of %d feet\n%s\n"
            "You will roll %dd%d Continue? (Y/N) :",
            Thunderclap.name, Thunderclap.range,
            Thunderclap.description, spelltier, Thunderclap.dicetype);
        scanf("%c", &contyesno);

        if (contyesno == 'Y')
        {
            printf(
                "You deal %d damage.",
                quickspellroll(spelltier, Thunderclap.dicetype));

            char option;

            fflush(stdin);
            printf("\n\nR)eturn to Main Menu  OR  E)xit program : ");
            scanf("%c", &option);

            if (option == 'R')
            {
                mainmenu(numtimed4, numtimed6, numtimed8, numtimed10,
                         numtimed100, numtimed12, numtimed20, modifier);
            }
            else
            {
                exit(0);
            }
        }
        else
        {
            mainmenu(numtimed4, numtimed6, numtimed8, numtimed10,
                     numtimed100, numtimed12, numtimed20, modifier);
        }
    }
    else if (spellselect == 'I')
    {
        fflush(stdin);
        printf(
            "\n_______________________________\n"
            "\nYou are casting %s with range of %d feet\n%s\n"
            "You will roll %dd%d Continue? (Y/N) :",
            WordOfRadiance.name, WordOfRadiance.range,
            WordOfRadiance.description, spelltier, WordOfRadiance.dicetype);
        scanf("%c", &contyesno);

        if (contyesno == 'Y')
        {
            printf(
                "You deal %d damage.",
                quickspellroll(spelltier, WordOfRadiance.dicetype));

            char option;

            fflush(stdin);
            printf("\n\nR)eturn to Main Menu  OR  E)xit program : ");
            scanf("%c", &option);

            if (option == 'R')
            {
                mainmenu(numtimed4, numtimed6, numtimed8, numtimed10,
                         numtimed100, numtimed12, numtimed20, modifier);
            }
            else
            {
                exit(0);
            }
        }
        else
        {
            mainmenu(numtimed4, numtimed6, numtimed8, numtimed10,
                     numtimed100, numtimed12, numtimed20, modifier);
        }
    }
    else if (spellselect == 'J')
    {
        mainmenu(numtimed4, numtimed6, numtimed8, numtimed10,
                 numtimed100, numtimed12, numtimed20, modifier);
    }
    else
    {
        printf("Please enter an appropriate selection");
        mainmenu(numtimed4, numtimed6, numtimed8, numtimed10,
                 numtimed100, numtimed12, numtimed20, modifier);
    }
}
void credits(
    int *numtimed4, int *numtimed6, int *numtimed8, int *numtimed10,
    int *numtimed100, int *numtimed12, int *numtimed20, int *modifier)
{
    char option;

    printf(
        "\n===============================\n"
        "\nCopyright 2020, Jaronchai Dilokkalayakul\n"
        "\n===============================\n");

    fflush(stdin);
    printf("\nR)eturn to Main Menu  OR  E)xit program : ");
    scanf("%c", &option);

    if (option == 'R')
    {
        mainmenu(numtimed4, numtimed6, numtimed8, numtimed10,
                 numtimed100, numtimed12, numtimed20, modifier);
    }
    else
    {
        exit(0);
    }
}

//  Main Menu Function
void mainmenu(
    int *numtimed4, int *numtimed6, int *numtimed8, int *numtimed10,
    int *numtimed100, int *numtimed12, int *numtimed20, int *modifier)
{

    // Display
    printf(
        "\n_______________________________\n"
        "\nYou are currently holding: "
        "\n[%d]d4  [%d]d6  [%d]d8  [%d]d10  [%d]d100  [%d]d12  [%d]d20"
        "\nWith a modifier of: %d\n",
        *numtimed4, *numtimed6, *numtimed8, *numtimed10,
        *numtimed100, *numtimed12, *numtimed20, *modifier);

    // Declare Main menu selection
    char selection;

    fflush(stdin);

    // Main Menu
    printf(
        "\nMain Menu:\n"
        "\tA)dd dice or modifier\n"
        "\tR)oll current dice\n"
        "\tC)ast quick spell\n"
        "\tV)iew credits\n"
        "\tE)xit program\n"
        "Please enter your selection: ");
    scanf("%c", &selection);

    // Applying switch statement
    switch (selection)
    {
    case 'A':
        adddice(numtimed4, numtimed6, numtimed8, numtimed10,
                numtimed100, numtimed12, numtimed20, modifier);
        break;
    case 'R':
        rolldice(numtimed4, numtimed6, numtimed8, numtimed10,
                 numtimed100, numtimed12, numtimed20, modifier);
        break;
    case 'C':
        quickspell(numtimed4, numtimed6, numtimed8, numtimed10,
                   numtimed100, numtimed12, numtimed20, modifier);
        break;
    case 'V':
        credits(numtimed4, numtimed6, numtimed8, numtimed10,
                numtimed100, numtimed12, numtimed20, modifier);
        break;
    case 'E':
        break;

    default:
        printf("\nPlease enter the appropriate selection\n");
        break;
    }
}

//  Main Function
int main()
{
    // Declare number of rolls for each dice and Modifier
    int numtimed4 = 0, numtimed6 = 0, numtimed8 = 0, numtimed10 = 0;
    int numtimed100 = 0, numtimed12 = 0, numtimed20 = 0, modifier = 0;

    // Header
    printf("\n*******************************");
    printf("\n         DUNGEON");
    printf("\n           ROLLING'");
    printf("\n*******************************");

    // Main Menu function with pass by reference
    mainmenu(&numtimed4, &numtimed6, &numtimed8, &numtimed10,
             &numtimed100, &numtimed12, &numtimed20, &modifier);

    return 0;
}
```
