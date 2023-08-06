#!/bin/ash
set -e
psql -v ON_ERROR_STOP --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    INSERT INTO "Cards"."CardData" ("FrontAsset", "Name", "Cost", "Inkwell", "Classifications", "Ink", "Text", "CardType") VALUES        
    ('Cards/001', 'Belle', 3, true, '{ Dreamborn, Hero, Princess, Inventor }', 'Sapphire', 'Tinker: Whenever this character quests, you pay 1 {ink} less for the next item you play this turn.', 'Character'),
    ('Cards/002', 'Captain Hook', 1, true, '{ Dreamborn, Villain, Pirate, Captain }', 'Steel', '{Challenger} +2', 'Character'),
    ('Cards/003', 'Cruella De Vil', 2, true, '{ Storyborn, Villain }', 'Emerald', 'You''ll be sorry: When this character is challenged and banished, you may return chosen character to their player''s hand.', 'Character'),
    ('Cards/004', 'Elsa', 3, true, '{ Dreamborn, Hero, Queen, Sorcerer }', 'Amethyst', 'Freeze: [{Exert}] - Exert chosen opposing character.', 'Character'),
    ('Cards/005', 'Hercules', 3, true, '{ Dreamborn, Hero, Prince }', 'Steel', '{Bodyguard}', 'Character'),
    ('Cards/006', 'Lefou', 2, true, '{ Storyborn, Ally }', 'Amber', 'Loyal: If you have a character named Gaston in play, you pay 1 {ink} less to play this character.', 'Character'),
    ('Cards/007', 'Maleficent', 9, true, '{ Storyborn, Villain, Dragon }', 'Ruby', 'Dragon Fire: When you play this character, you may banish chosen opposing character.', 'Character'),
    ('Cards/008', 'Mickey Mouse', 8, true, '{ Dreamborn, Hero }', 'Ruby', '{Evasive}', 'Character'),
    ('Cards/009', 'Robin Hood', 6, true, '{ Storyborn, Hero }', 'Sapphire', 'Feed the poor: When you play this character, if an opponent has more cards in their hand than you, draw a card. / Good shot: During your turn, this character has Evasive.', 'Character'),
    ('Cards/010', 'Stitch', 6, true, '{ Floodborn, Hero, Alien }', 'Amber', ' Adoring fans: Whenever you play a character with a cost of 2 or less, you may exert it to draw a card.', 'Character'),
    ('Cards/011', 'Dragon Fire', 5, false, '{ Action }', 'Ruby', 'Banish chosen character', 'Action'),
    ('Cards/012', 'Fire The Cannons!', 1, false, '{ Action }', 'Steel', 'Deal 2 damage to chosen character', 'Action'),
    ('Cards/013', 'One Jump Ahead', 2, false, '{ Action, Song }', 'Sapphire', 'Put the top card of your deck into your ell facedown and exerted.', 'Action'),
    ('Cards/014', 'Frying Pan', 2, true, '{ Item }', 'Steel', 'Clang!: [Banish this item] - Chosen character can''t challenge during their next turn.', 'Item'),
    ('Cards/015', 'Stitch', 1, true, '{ Storyborn, Hero, Alien }', 'Amber', '', 'Character'),
    ('Cards/016', 'Aurora', 2, true, '{ Storyborn, Hero, Princess }', 'Sapphire', '', 'Character'),
    ('Cards/017', 'Aurora', 5, true, '{ Floodborn, Hero, Princess }', 'Sapphire', 'Protective Embrace: Your other characters gain {Ward}.', 'Character'),
    ('Cards/018', 'Magic Mirror', 2, false, '{ Item }', 'Amethyst', 'Speak!: [{Exert}, 4 {ink}] - Draw a card.', 'Item'),
    ('Cards/019', 'White Rabbit''s Pocket Watch', 3, true, '{ Item }', 'Amethyst', 'I''m Late!: [{Exert}, 1 {ink}] - Chosen character gains {Rush}.', 'Item'),
    ('Cards/020', 'Magic Broom', 2, true, '{ Dreamborn, Broom }', 'Amethyst', 'Sweep: When you play this character, you may shuffle a card from any discard into its player''s deck.', 'Character'),
    ('Cards/021', 'Mickey Mouse', 4, true, '{ Dreamborn, Sorcerer }', 'Amethyst', 'Animate Broom: You play 1 {ink} less to play Broom characters. / Ceaseless Worker: Whenever one of your Broom characters is banished in a challenge, you may return that card to your hand.', 'Character'),
    ('Cards/022', 'Hades', 4, false, '{ Storyborn, Villain, Deity }', 'Amber', 'Well of Souls: When you play this character, return a character from your discard pile to your hand.', 'Character'),
    ('Cards/023', 'Let It Go', 5, true, '{ Action, Song }', 'Sapphire', 'Put chosen character into their player''s inkwell facedown and exerted.', 'Action'),
    ('Cards/024', 'Moana', 5, true, '{ Storyborn, Hero, Princess }', 'Amber', 'We Can Fix It: Whenever this character quests, you may ready your other Princess characters. They can''t quest for the rest of the turn.', 'Character'),
    ('Cards/025', 'Lantern', 2, false, '{ Item }', 'Amber', 'Birthday Lights: [{Exert}] - You play 1 {ink} less for the next character you play this turn.', 'Item'),
    ('Cards/026', 'Beast', 5, true, '{ Storyborn, Hero, Prince }', 'Steel', 'Break: When you play this character, you may banish chosen item.', 'Character'),
    ('Cards/027', 'Captain Hook', 4, false, '{ Storyborn, Villain, Pirate, Captain }', 'Steel', 'Double the Powder!: When you play this character, you may return an action named Fire the Cannons! from your discard pile to your hand.', 'Character'),
    ('Cards/028', 'Friends On The Other Side', 3, true, '{ Action, Song }', 'Amethyst', 'Draw 2 cards', 'Action'),
    ('Cards/029', 'Maleficent', 3, true, '{ Storyborn, Villain, Sorcerer }', 'Amethyst', 'Cast my Spell!: When you play this character, you may draw a card.', 'Character'),
    ('Cards/030', 'Be Our Guest', 2, true, '{ Action, Song }', 'Amber', 'Look at the top 4 cards of your deck. You may reveal a character card and put it in your hand. Put the rest on the bottom of your deck in any order.', 'Action'),
    ('Cards/031', 'Maurice', 6, true, '{ Dreamborn, Mentor, Inventor }', 'Sapphire', 'Give it a try: Whenever this character quests, you pay 2 {ink} less for the next item you play this turn. / It Works: Whenever you play an item, you may draw a card.', 'Character'),
    ('Cards/032', 'Scar', 4, true, '{ Dreamborn, Villain }', 'Ruby', '', 'Character'),
    ('Cards/033', 'Aurora', 4, true, '{ Storyborn, Hero, Princess }', 'Sapphire', 'Disarming Beauty: When you play this character, chosen opposing character gets -2 {strength} this turn.', 'Character'),
    ('Cards/034', 'Donald Duck', 2, true, '{ Storyborn }', 'Ruby', '', 'Character'),
    ('Cards/035', 'Minnie Mouse', 2, true, '{ Dreamborn, Princess }', 'Amber', '', 'Character'),
    ('Cards/036', 'Scar', 6, true, '{ Storyborn, Villain }', 'Sapphire', 'Insidious Plot: When you play this character, chosen opposing character gets -5 {strength} this turn.', 'Character'),
    ('Cards/037', 'Aladdin', 7, true, '{ Floodborn, Hero }', 'Ruby', 'Daring Exploit: During your turn, whenever this character banishes another character in a challenge, you gain 2 lore and each opponent loses 2 lore.', 'Character'),
    ('Cards/038', 'Mulan', 5, true, '{ Storyborn, Hero, Princess }', 'Ruby', 'Lead by Example: During your turn whenever this character banishes another characters in a challenge, your other characters get +1 {lore} this turn.', 'Character'),
    ('Cards/039', 'Mickey Mouse', 3, false, '{ Dreamborn, Hero, Detective }', 'Sapphire', 'Get a Clue: When you play this character, you may put the top card of your deck into your inkwell facedown and exerted.', 'Character'),
    ('Cards/040', 'Mickey Mouse', 6, true, '{ Dreamborn, Hero, Musketeer }', 'Steel', '{Bodyguard} / All for One: Your other Musketeer characters get +1 {strength}.', 'Character'),
    ('Cards/041', 'Smash', 3, true, '{ Action }', 'Steel', 'Deal 3 damage to the chosen character', 'Action'),
    ('Cards/042', 'Heihei', 1, true, '{ Storyborn, Ally }', 'Amber', '{Support}', 'Character'),
    ('Cards/043', 'Beast''s Mirror', 2, true, '{ Item }', 'Steel', 'Show Me: [{Exert}, 3 {ink}] - If you have no cards in your hand, draw a card.', 'Item'),
    ('Cards/044', 'Pascal', 1, true, '{ Storyborn, Ally }', 'Amethyst', 'Camouflage: While you have another character in play, this character gains {Evasive}.', 'Character'),
    ('Cards/045', 'Cheshire Cat', 3, true, '{ Storyborn }', 'Emerald', 'Lose Something?: When this character is challenged and banished, banish the challenging character', 'Character'),
    ('Cards/046', 'The Beast Is Mine!', 3, true, '{ Action }', 'Emerald', 'Chosen character gains {Reckless} during their next turn.', 'Action'),
    ('Cards/047', 'Simba', 7, true, '{ Storyborn, Hero, King }', 'Steel', '{Challenger} +4 / Pounce: During your turn, this character gains {Evasive}.', 'Character'),
    ('Cards/048', 'Jasmine', 3, true, '{ Storyborn, Princess }', 'Sapphire', '', 'Character'),
    ('Cards/049', 'Prince Eric', 2, true, '{ Storyborn, Prince, Hero }', 'Steel', '{Challenger} +2', 'Character'),
    ('Cards/050', 'Goons', 1, true, '{ Storyborn, Ally }', 'Steel', '', 'Character'),
    ('Cards/051', 'Jafar', 4, true, '{ Dreamborn, Villain, Sorcerer }', 'Amethyst', '{Challenger} +3', 'Character'),
    ('Cards/052', 'Dr. Facilier', 2, true, '{ Storyborn, Villain, Sorcerer }', 'Amethyst', '{Challenger} +2', 'Character'),
    ('Cards/053', 'Maximus', 3, true, '{ Dreamborn, Ally }', 'Amber', 'Horsekick: When you play this character, chosen character gets -2 {strength} this turn.', 'Character'),
    ('Cards/054', 'Ariel', 4, true, '{ Storyborn, Hero, Princess }', 'Amber', 'Voiceless: This character can''t {Exert} to sing songs.', 'Character'),
    ('Cards/055', 'The Wardrobe', 3, true, '{ Dreamborn, Ally }', 'Amethyst', '', 'Character'),
    ('Cards/056', 'Maleficent', 4, true, '{ Storyborn, Villain, Sorcerer }', 'Sapphire', '', 'Character'),
    ('Cards/057', 'Jumba Jookiba', 5, true, '{ Dreamborn, Alien, Inventor }', 'Emerald', '', 'Character'),
    ('Cards/058', 'Mickey Mouse', 3, true, '{ Storyborn, Hero, Captain }', 'Emerald', '', 'Character'),
    ('Cards/059', 'Mickey Mouse', 3, true, '{ Storyborn, Hero }', 'Amber', '', 'Character'),
    ('Cards/060', 'Maleficent', 1, false, '{ Dreamborn, Villain, Sorcerer }', 'Amethyst', '', 'Character'),
    ('Cards/061', 'Yzma', 2, true, '{ Dreamborn, Villain, Sorcerer }', 'Amethyst', 'You''re Excused: Whenever this character quests, looks at the top card of your deck. Put it either on the top or bottom of your deck.', 'Character'),
    ('Cards/062', 'Control Your Temper', 1, true, '{ Action }', 'Amber', 'Chosen character gets -2 {strength} this turn.', 'Action'),
    ('Cards/063', 'Just In Time', 3, false, '{ Action }', 'Amber', 'You may play a character with cost 5 or less for free.', 'Action'),
    ('Cards/064', 'Develop Your Brain', 1, true, '{ Action }', 'Sapphire', 'Look at the top 2 cards of your deck. Put one into your hand and the other on the bottom of the deck.', 'Action'),
    ('Cards/065', 'Coconut Basket', 2, true, '{ Item }', 'Sapphire', 'Consider The Coconut: Whenever you play a character, you may remove up to 2 damage from chosen character.', 'Item'),
    ('Cards/066', 'Part Of Your World', 3, false, '{ Action, Song }', 'Amber', 'Return a character card from your discard to your hand.', 'Action'),
    ('Cards/067', 'Flounder', 1, true, '{ Storyborn, Ally }', 'Sapphire', '', 'Character'),
    ('Cards/068', 'Dinglehopper', 1, true, '{ Item }', 'Amber', 'Straighten Hair: [{Exert}] - Remove up to 1 damage from chosen character.', 'Item'),
    ('Cards/069', 'Healing Glow', 1, true, '{ Action }', 'Amber', 'Remove up to 2 damage from chosen character.', 'Action'),
    ('Cards/070', 'Tinker Bell', 3, true, '{ Dreamborn, Ally, Fairy }', 'Steel', 'Battle Plans: [{Exert}] - Draw a card, then choose and discard a card.', 'Character'),
    ('Cards/071', 'Gantu', 8, true, '{ Storyborn, Alien, Captain }', 'Steel', 'Under Arrest: Characters with cost 2 or less can''t challenge your character.', 'Character'),
    ('Cards/072', 'Hades', 8, false, '{ Floodborn, Villain, King, Deity }', 'Amber', 'Sinister Plot: This character gets +1 {lore} for each other Villain character you have in play.', 'Character'),
    ('Cards/073', 'Olaf', 1, true, '{ Storyborn, Ally }', 'Amethyst', '', 'Character'),
    ('Cards/074', 'Genie', 6, false, '{ Storyborn, Ally }', 'Emerald', '{Evasive} / Disappear: When you play this character, you may return chosen character to the player''s hand.', 'Character'),
    ('Cards/075', 'Iago', 3, true, '{ Storyborn, Ally }', 'Emerald', 'You got a problem?: [{Exert}] - Chosen character gains {Reckless} during their next turn.', 'Character'),
    ('Cards/076', 'Timon', 1, true, '{ Storyborn, Ally }', 'Amber', 'Tastes Lke Chicken: When you play this character, you may remove up to 1 damage from chosen character.', 'Character'),
    ('Cards/077', 'Archimedes', 1, true, '{ Dreamborn, Ally }', 'Amethyst', '', 'Character'),
    ('Cards/078', 'Rafiki', 3, false, '{ Dreamborn, Mentor, Sorcerer }', 'Amethyst', '{Rush}', 'Character'),
    ('Cards/079', 'Beast', 5, false, '{ Dreamborn, Hero, Prince }', 'Emerald', '{Rush} / Roar: When you play this character, exert all opposing damage characters.', 'Character'),
    ('Cards/080', 'Aladdin', 2, true, '{ Storyborn, Hero, Prince }', 'Emerald', '{Ward}', 'Character'),
    ('Cards/081', 'Goofy', 5, true, '{ Dreamborn, Hero }', 'Ruby', '{Evasive}', 'Character'),
    ('Cards/082', 'Lady Tremaine', 6, false, '{ Dreamborn, Villain }', 'Emerald', 'Do it again!: When you play this character, you may return an action card from your discard to your hand.', 'Character'),
    ('Cards/083', 'Tigger', 6, true, '{ Storyborn, Tigger }', 'Ruby', '{Evasive}', 'Character'),
    ('Cards/084', 'Goofy', 5, true, '{ Dreamborn, Hero, Musketeer }', 'Amber', '{Bodyguard}', 'Character'),
    ('Cards/085', 'Rapunzel', 6, false, '{ Dreamborn, Hero, Princess }', 'Ruby', 'Tangle: When you play this character, each opponent loses 1 lore.', 'Character'),
    ('Cards/086', 'Stitch', 7, true, '{ Dreamborn, Hero, Alien }', 'Amber', 'Ohana: When you play this character, if you have 2 or more other characters in play, you may draw 2 cards.', 'Character'),
    ('Cards/087', 'Sven', 6, true, '{ Storyborn, Ally }', 'Amethyst', '', 'Character'),
    ('Cards/088', 'Maui', 8, true, '{ Storyborn, Hero, Deity }', 'Steel', '', 'Character'),
    ('Cards/089', 'Peter Pan', 3, true, '{ Dreamborn, Hero }', 'Emerald', '{Evasive}', 'Character'),
    ('Cards/090', 'Ariel', 4, false, '{ Storyborn, Hero, Princess }', 'Sapphire', 'Look at this stuff: Whenever you play an item, you may ready this character.', 'Character'),
    ('Cards/091', 'Zeus', 4, false, '{ Storyborn, Deity }', 'Amethyst', '{Rush} / {Challenger} +4', 'Character'),
    ('Cards/092', 'Simba', 1, true, '{ Storyborn, Hero, Prince }', 'Steel', 'Guess what?: When you play this character, you may draw a card, then choose and discard a card.', 'Character'),
    ('Cards/093', 'Donald Duck', 5, true, '{ Dreamborn, Hero, Inventor }', 'Sapphire', '{Ward}', 'Character'),
    ('Cards/094', 'Kristoff', 3, true, '{ Storyborn, Ally }', 'Steel', '', 'Character'),
    ('Cards/095', 'Merlin', 4, true, '{ Dreamborn, Mentor, Sorcerer }', 'Sapphire', '{Support}', 'Character'),
    ('Cards/096', 'Simba', 2, true, '{ Storyborn, Hero, Prince }', 'Amber', '{Bodyguard}', 'Character'),
    ('Cards/097', 'Tinker Bell', 6, true, '{ Floodborn, Ally, Fairy }', 'Steel', 'Rock the Boat: When you play this character, deal 1 damage to each opposing character. / Puny Pirate: During your turn, whenever this character banishes another character in a challenge, you may deal 2 damage to chosen opposing character.', 'Character'),
    ('Cards/098', 'Befuddle', 1, true, '{ Action }', 'Amethyst', 'Return a character or item with cost 2 or less to their player''s hand.', 'Action'),
    ('Cards/099', 'Kronk', 6, true, '{ Storyborn, Ally }', 'Steel', '', 'Character'),
    ('Cards/100', 'Pongo', 4, true, '{ Storyborn, Hero }', 'Ruby', '{Evasive}', 'Character'),
    ('Cards/101', 'Cerberus', 5, true, '{ Storyborn }', 'Steel', '', 'Character'),
    ('Cards/102', 'Lilo', 1, false, '{ Storyborn, Hero }', 'Amber', '', 'Character'),
    ('Cards/103', 'Flotsam', 5, false, '{ Storyborn, Ally }', 'Amethyst', '{Rush} / Dexterous Lunge: Your characters named Jetsam gain {Rush}.', 'Character'),
    ('Cards/104', 'Jetsam', 4, true, '{ Storyborn, Ally }', 'Amethyst', '{Evasive} / Sinister Slither: Your characters named Flotsam gain {Evasive}.', 'Character'),
    ('Cards/105', 'Triton', 7, true, '{ Storyborn, King }', 'Sapphire', '', 'Character'),
    ('Cards/106', 'Grab Your Sword', 5, false, '{ Action, Song }', 'Steel', 'Deal 2 damage to each opposing character.', 'Action'),
    ('Cards/107', 'Anna', 4, true, '{ Storyborn, Hero, Queen }', 'Amethyst', 'Loving Heart: When you play this this character, if you have a characater named Elsa in play, choose an opposing character. The chosen character doesn''t ready at the start of their next turn.', 'Character'),
    ('Cards/108', 'Ariel', 3, true, '{ Storyborn, Hero, Princess }', 'Amber', '{Singer} 5 / Musical Debut: When you play this character, look at the top 4 cards of your deck. You may reveal a song card and put it into your hand. Put the rest on the bottom of your deck in any order.', 'Character'),
    ('Cards/109', 'Sergeant Tibbs', 1, true, '{ Storyborn, Ally }', 'Ruby', '', 'Character'),
    ('Cards/110', 'Gaston', 2, true, '{ Storyborn, Villain }', 'Ruby', '{Reckless}', 'Character'),
    ('Cards/111', 'Sebastian', 2, true, '{ Storyborn, Ally }', 'Amber', '{Singer} 4', 'Character'),
    ('Cards/112', 'Ursula''s Shell Necklace', 3, false, '{ Item }', 'Amber', 'Now, Sing!: Whenever you play a song, you may pay 1 {ink} to draw a card.', 'Item'),
    ('Cards/113', 'Fan The Flames', 1, true, '{ Action }', 'Ruby', 'Ready chosen character. They can''t quest for the rest of this turn.', 'Action'),
    ('Cards/114', 'If It''s Not Baroque', 3, false, '{ Action }', 'Sapphire', 'Return an item card from your discard to your hand.', 'Action'),
    ('Cards/115', 'Break', 2, true, '{ Action }', 'Steel', 'Banish chosen item.', 'Action'),
    ('Cards/116', 'Prince Phillip', 4, false, '{ Storyborn, Hero, Prince }', 'Amber', 'Heroism: When this character challenges and is banished, you may banish the challenged character.', 'Character'),
    ('Cards/117', 'Aladdin', 3, true, '{ Storyborn, Hero }', 'Ruby', 'Improvise: When you play this character, each opponent loses 1 lore.', 'Character'),
    ('Cards/118', 'Maleficent', 5, true, '{ Dreamborn, Villain, Sorcerer }', 'Sapphire', '', 'Character'),
    ('Cards/119', 'Musketeer Tabard', 4, false, '{ Item }', 'Steel', 'All for one and one for all: Whenever one of your characters with {Bodyguard} is banished, you may draw a card.', 'Item'),
    ('Cards/120', 'Duke Of Weselton', 1, true, '{ Storyborn, Villain }', 'Emerald', '', 'Character'),
    ('Cards/121', 'Minnie Mouse', 1, true, '{ Storyborn, Hero }', 'Ruby', '', 'Character'),
    ('Cards/122', 'Scepter of Arendelle', 1, true, '{ Item }', 'Sapphire', 'Command: [{Exert}] - Chosen character gains {Support} this turn.', 'Item'),
    ('Cards/123', 'Hans', 4, true, '{ Storyborn, Villain, Prince }', 'Emerald', '', 'Character'),
    ('Cards/124', 'Stampede', 1, false, '{ Action }', 'Emerald', 'Deal 2 damage to chosen damaged character.', 'Action'),
    ('Cards/125', 'Marshmallow', 6, false, '{ Storyborn, Ally }', 'Amethyst', 'Durable: When this character is banished in a challenge, you may return this card to your hand.', 'Character'),
    ('Cards/126', 'Vicious Betrayal', 1, true, '{ Action }', 'Emerald', 'Chosen character gets +2 {strength} this turn. If a Villain character is chosen, they get +3 {strength} instead.', 'Action'),
    ('Cards/127', 'Be Prepared', 7, false, '{ Action, Song }', 'Ruby', 'Banish all characters.', 'Action'),
    ('Cards/128', 'A Whole New World', 5, false, '{ Action, Song }', 'Steel', 'Each player discards their hand and draws 7 cards.', 'Action'),
    ('Cards/129', 'Mother Knows Best', 3, false, '{ Action, Song }', 'Emerald', 'Return chosen character to their player''s hand.', 'Action'),
    ('Cards/130', 'Reflection', 1, true, '{ Action, Song }', 'Amethyst', 'Look at the top 3 cards of your deck. Put them back on the top of your deck in any order.', 'Action'),
    ('Cards/131', 'Hakuna Matata', 4, true, '{ Action, Song }', 'Amber', 'Remove up to 3 damage from each of your characters.', 'Action'),
    ('Cards/132', 'Mickey Mouse', 7, false, '{ Floodborn, Hero }', 'Emerald', 'Misdirection: Whenever you play an action, chosen opposing character can''t quest during their next turn.', 'Character'),
    ('Cards/133', 'Do It Again', 3, false, '{ Action }', 'Emerald', 'Return an action card from your discard to your hand.', 'Action'),
    ('Cards/134', 'Stolen Scimitar', 3, true, '{ Item }', 'Emerald', 'Slash: [{Exert}] - Chosen characters gets +1 {strength} this turn. If a character named Aladdin is chosen, he gets +2 {strength} instead.', 'Item'),
    ('Cards/135', 'Hans', 4, true, '{ Storyborn, Villain, Prince }', 'Steel', 'Stage a Little Accident: Whenever this character quests, you may deal 1 damage to chosen character.', 'Character'),
    ('Cards/136', 'Rapunzel', 4, true, '{ Storyborn, Hero, Princess }', 'Amber', 'Gleam and Glow: When you play this character, remove up to 3 damage from one of your characters. Draw a card for each 1 damage removed this way.', 'Character'),
    ('Cards/137', 'Flynn Rider', 2, true, '{ Storyborn, Hero, Prince }', 'Emerald', 'Here comes the Smolder: Whenever this character is challenged, the challenging player chooses and discards a card.', 'Character'),
    ('Cards/138', 'Maximus', 5, true, '{ Storyborn, Ally }', 'Amber', '{Bodyguard} / {Support}', 'Character'),
    ('Cards/139', 'Megara', 2, true, '{ Dreamborn, Ally }', 'Emerald', 'Wonder Boy: When you play this character, chosen character gets +2 {strength} this turn.', 'Character'),
    ('Cards/140', 'Elsa', 4, true, '{ Storyborn, Hero, Queen, Sorcerer }', 'Amethyst', '', 'Character'),
    ('Cards/141', 'Kuzco', 5, false, '{ Storyborn, King }', 'Emerald', '{Ward} / No Touchy!: When this character is challenged and banished, you may banish the challenging character.', 'Character'),
    ('Cards/142', 'Geni', 2, true, '{ Dreamborn, Ally }', 'Emerald', '', 'Character'),
    ('Cards/143', 'Abu', 3, true, '{ Storyborn, Ally }', 'Ruby', '', 'Character'),
    ('Cards/144', 'Scar', 8, false, '{ Floodborn, Villain, King }', 'Ruby', 'Rousing Speech: When you play this character, ready your characters with cost 3 or less. They can''t quest for the rest of this turn.', 'Character'),
    ('Cards/145', 'John Silver', 6, true, '{ Storyborn, Villain, Alien, Pirate, Captain }', 'Emerald', 'Pick your Fights: When you play this character and whenever he quests, chosen opposing character gains {Reckless} during their next turn.', 'Character'),
    ('Cards/146', 'Captain Hook', 5, false, '{ Floodborn, Villain, Pirate, Captain }', 'Steel', '{Challenger} +3 / Stolen Dust: Characters with cost 3 or less can''t challenge this character.', 'Character'),
    ('Cards/147', 'Jasper', 3, true, '{ Storyborn, Ally }', 'Emerald', 'Puppynapping: Whenever this character quests, chosen opposing character can''t quest during thier next turn.', 'Character'),
    ('Cards/148', 'Horace', 4, true, '{ Storyborn, Ally }', 'Emerald', '', 'Character'),
    ('Cards/149', 'Elsa', 8, false, '{ Floodborn, Hero, Queen, Sorcerer }', 'Amethyst', 'Deep Freeze: When you play this character, exert up to 2 chosen characters. They can''t ready at the start of their next turn.', 'Character'),
    ('Cards/150', 'Elsa', 4, true, '{ Dreamborn, Hero, Queen, Sorcerer }', 'Ruby', 'That''s no  Blizzard: Whenever you play a character named Anna, ready this character. This character can''t quest for the rest of this turn.', 'Character'),
    ('Cards/151', 'Tinker Bell', 5, false, '{ Storyborn, Ally, Fairy }', 'Amethyst', '{Evasive} / Loyal and Devoted: Your characters named Peter Pan gain {Challenger} +1.', 'Character'),
    ('Cards/152', 'Jafar', 4, true, '{ Dreamborn, Villain, Sorcerer }', 'Amethyst', 'Hidden Wonders: This character gets +1 {strength} for each card in your hand.', 'Character'),
    ('Cards/153', 'Poisoned Apple', 3, false, '{ Item }', 'Ruby', 'Take a Bite: [1 {ink}, Banish this item] - Exert chosen character. If a Princess character is chosen, banish her instead.', 'Item'),
    ('Cards/154', 'Ursula''s Cauldron', 2, false, '{ Item }', 'Amethyst', 'Peer Into The Depths: [{Exert}] - Look at the top 2 cards of your deck. Put one on the top of your deck and the other on the bottom.', 'Item'),
    ('Cards/155', 'Sudden Chill', 2, true, '{ Action, Song }', 'Emerald', 'Each opponent chooses and discards a card.', 'Action'),
    ('Cards/156', 'Lefou', 2, true, '{ Dreamborn, Ally }', 'Ruby', 'Fan the Flames: When you play this character, ready chosen character. They can''t quest for the rest of this turn.', 'Character'),
    ('Cards/157', 'Captain Hook', 7, false, '{ Storyborn, Villain, Pirate, Captain }', 'Ruby', '{Rush} / You Coward!: While this character is exerted, opposing characters with {Evasive} gain {Reckless}.', 'Character'),
    ('Cards/158', 'Cut To The Chase', 2, true, '{ Action }', 'Ruby', 'Chosen character gains {Rush}.', 'Action'),
    ('Cards/159', 'Tangle', 2, true, '{ Action }', 'Ruby', 'Each opponent loses 1 lore.', 'Action'),
    ('Cards/160', 'He''s Got A Sword', 1, true, '{ Action }', 'Ruby', 'Chosen character gets +2 {strength} this turn.', 'Action'),
    ('Cards/161', 'Sword Of Truth', 4, false, '{ Item }', 'Ruby', 'Final Enchantment: [Banish this item] - Banish chosen Villain character.', 'Item'),
    ('Cards/162', 'Belle', 4, true, '{ Storyborn, Hero, Princess }', 'Sapphire', 'Read a Book: During your turn, you may put an additional card from your hand into your inkwell facedown. / My Favorite Part!: While you have 10 or more cards in your inkwell, this character gets +4 {lore}.', 'Character'),
    ('Cards/163', 'Mother Gothel', 6, true, '{ Storyborn, Villain }', 'Emerald', 'Skip the Drama, Stay with Mama: While this character is exerted, opposing characters can''t quest.', 'Character'),
    ('Cards/164', 'Work Together', 1, true, '{ Action }', 'Sapphire', 'Chosen character gains {Support} this turn.', 'Action'),
    ('Cards/165', 'Jasmine', 5, true, '{ Floodborn, Hero, Princess, Queen }', 'Sapphire', 'Caretaker: When you play this character and whenever she quests, you may remove up to 2 damage from each of your characters.', 'Character'),
    ('Cards/166', 'Dr. Facilier', 7, false, '{ Floodborn, Villain, Sorcerer }', 'Amethyst', 'Into the Shadows: Whenever one of your otehr characters is banashed in a challenge, you may return that card to your hand.', 'Character'),
    ('Cards/167', 'Cinderella', 4, true, '{ Storyborn, Hero, Princess }', 'Amber', '{Singer} 5 / A Wonderful Dream: [{Exert}] - Remove up to 3 damage from chosen Princess character.', 'Character'),
    ('Cards/168', 'Mad Hatter', 5, true, '{ Storyborn }', 'Emerald', 'Tea Party: Whenever this character is challenged, you may draw a card.', 'Character'),
    ('Cards/169', 'Steal From The Rich', 5, false, '{ Action }', 'Emerald', 'Whenever one of your characters quests this turn, each opponent loses 1 lore.', 'Character'),
    ('Cards/170', 'Captain', 5, true, '{ Storyborn, Ally, Captain }', 'Ruby', '', 'Character'),
    ('Cards/171', 'Stitch', 6, true, '{ Storyborn, Hero, Alien }', 'Ruby', '', 'Character'),
    ('Cards/172', 'Shield Of Virtue', 1, true, '{ Item }', 'Ruby', 'Fireproof: [{Exert}, 3 {ink}] - Ready chosen character. They can''t quest for the rest of the turn.', 'Item'),
    ('Cards/173', 'Gramma Tala', 2, true, '{ Storyborn, Mentor }', 'Sapphire', 'I Will Be With You: When this character is banished, you may put this card into your inkwell facedown and exerted.', 'Character'),
    ('Cards/174', 'Mufasa', 6, true, '{ Storyborn, Mentor, King }', 'Sapphire', '', 'Character'),
    ('Cards/175', 'Magic Golden Flower', 1, true, '{ Item }', 'Sapphire', 'Healing Pollen: [Banish this item] - Remove up to 3 damage from a chosen character.', 'Character'),
    ('Cards/176', 'Simba', 5, false, '{ Storyborn, Hero, Prince }', 'Steel', 'I know what I have to do: During your turn, whenever this character banishes another character in a challenge, you gain 1 lore.', 'Character'),
    ('Cards/177', 'Ransack', 2, true, '{ Action }', 'Steel', 'Draw 2 cards, then choose and discard 2 cards.', 'Character'),
    ('Cards/178', 'Mr. Smee', 3, true, '{ Dreamborn, Ally, Pirate }', 'Amber', '', 'Character'),
    ('Cards/179', 'Pumba', 4, true, '{ Storyborn, Ally }', 'Amber', '', 'Character'),
    ('Cards/180', 'You Have Forgotten Me', 4, true, '{ Action }', 'Amber', 'Each opponent chooses and discards 2 cards.', 'Action'),
    ('Cards/181', 'Dr. Facilier', 3, true, '{ Storyborn, Villain, Sorcerer }', 'Amethyst', 'Dreams Made Real: Whenever you play a song, you may look at the top 2 cards of your deck. Put one on the top of oyur deck and the other on the bottom.', 'Character'),
    ('Cards/182', 'The Queen', 5, true, '{ Storyborn, Villain, Queen }', 'Amethyst', 'I summon thee: [{Exert}] - Draw a card.', 'Character'),
    ('Cards/183', 'Ursula', 7, false, '{ Storyborn, Villain, Sorcerer }', 'Amethyst', 'It''s Too Easy: When you play this character, each opponent loses 1 lore. You may draw a card for each lore lost this way.', 'Character'),
    ('Cards/184', 'Freeze', 2, false, '{ Action }', 'Amethyst', 'Exert chosen character', 'Action'),
    ('Cards/185', 'Genie', 8, false, '{ Floodborn, Hero }', 'Emerald', '{Evasive} / Phenomenal Cosmic Power!: Whenever this character quests, you may play an action with cost 5 or less for free.', 'Character'),
    ('Cards/186', 'Tamatoa', 2, true, '{ Dreamborn }', 'Emerald', '', 'Character'),
    ('Cards/187', 'Tinker Bell', 4, true, '{ Storyborn, Ally, Fairy }', 'Emerald', '{Evasive} / Pixie Dust: When you play this character, chosen character gains {Evasive} this turn.', 'Character'),
    ('Cards/188', 'Dr. Facilier''s Cards', 2, false, '{ Item }', 'Emerald', 'The Cards Will Tell: [{Exert}] - You pay 1 {ink} less for the next action you play this turn', 'Item'),
    ('Cards/189', 'Maui', 5, true, '{ Storyborn, Hero, Deity }', 'Ruby', '{Rush} / {Reckless}', 'Character'),
    ('Cards/190', 'Moana', 5, true, '{ Storyborn, Hero, Princess }', 'Ruby', 'This is not who you are: When you play this character, you may banish chosen character named Te Ka.', 'Character'),
    ('Cards/191', 'Peter Pan', 3, false, '{ Storyborn, Hero }', 'Ruby', '{Rush}', 'Character'),
    ('Cards/192', 'Te Ka', 6, false, '{ Storyborn, Villain, Deity }', 'Ruby', 'Reckless', 'Character'),
    ('Cards/193', 'Chief Tui', 7, true, '{ Storyborn, Mentor, King }', 'Sapphire', '{Support}', 'Character'),
    ('Cards/194', 'Hades', 7, false, '{ Dreamborn, Villain, Deity }', 'Sapphire', 'Is there a Downside?: When you play this character, you may put chosen opposing character into their player''s inkwell facedown.', 'Character'),
    ('Cards/195', 'Philoctetes', 2, true, '{ Storyborn, Mentor }', 'Sapphire', '{Support}', 'Character'),
    ('Cards/196', 'Tamatoa', 8, true, '{ Storyborn, Villain }', 'Sapphire', 'What do we have here?: When you play this character and whenever he quests, you may return an item card from your discard to your hand. / Glam: This character gets +1 {lore} for each item you have in play.', 'Character'),
    ('Cards/197', 'Eye Of The Fates', 4, true, '{ Item }', 'Sapphire', 'See the Future: [{Exert}] - Chosen character gets +1 {lore} this turn.', 'Item'),
    ('Cards/198', 'Fishbone Quill', 3, true, '{ Item }', 'Sapphire', 'Go ahead and sign: [{Exert}] - Put any card from your hand into your inkwell facedown.', 'Item'),
    ('Cards/199', 'Donald Duck', 4, true, '{ Dreamborn, Hero, Musketeer }', 'Steel', '{Bodyguard} / Stay Alert!: During your turn, your Musketeer characters gain {Evasive}.', 'Character'),
    ('Cards/200', 'Aladdin', 2, true, '{ Storyborn, Hero }', 'Steel', '', 'Character'),
    ('Cards/201', 'Lilo', 3, true, '{ Storyborn, Hero }', 'Steel', '', 'Character'),
    ('Cards/202', 'Plasma Blaster', 3, false, '{ Item }', 'Steel', 'Quick Shot: [{Exert}, 2 {ink}] - Deal 1 damageto chosen character.', 'Item'),
    ('Cards/203', 'Starkey', 5, true, '{ Storyborn, Ally, Pirate }', 'Steel', 'Aye Aye, Captain: While you have a Captain character in play, this character gets +1 {lore}.', 'Character'),
    ('Cards/204', 'Te Ka', 6, true, '{ Dreamborn, Villain, Deity }', 'Steel', 'Seek the Heart: During your turn, whenever this character banishes another character in a challenge, you gain 2 lore.', 'Character');
EOSQL