#!/bin/ash
set -e
psql -v ON_ERROR_STOP --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    INSERT INTO "Cards"."CardData" ("FrontAsset", "Name", "Cost", "Inkwell", "Classifications", "Ink", "Text", "CardType") VALUES        
    ('Cards/001', 'Belle', 3, true, '{ Dreamborn, Hero, Princess, Inventor }', 'Sapphire', 'Tinker: Whenever this character quests, you pay 1 {ink} less for the next item you play this turn.', 'Character'),
    ('Cards/002', 'Captain Hook', 1, true, '{ Dreamborn, Villain, Pirate, Captain }', 'Steel', 'Challenger +2', 'Character'),
    ('Cards/003', 'Cruella De Vil', 2, true, '{ Storyborn, Villain }', 'Emerald', 'You''ll be sorry: When this character is challenged and banished, you may return chosen character to their player''s hand.', 'Character'),
    ('Cards/004', 'Elsa', 3, true, '{ Dreamborn, Hero, Queen, Sorcerer }', 'Amethyst', 'Freeze: [{Exert}] - Exert chosen opposing character.', 'Character'),
    ('Cards/005', 'Hercules', 3, true, '{ Dreamborn, Hero, Prince }', 'Steel', 'Bodyguard', 'Character'),
    ('Cards/006', 'Lefou', 2, true, '{ Storyborn, Ally }', 'Amber', 'Loyal: If you have a character named Gaston in play, you pay 1 {ink} less to play this character.', 'Character'),
    ('Cards/007', 'Maleficent', 9, true, '{ Storyborn, Villain, Dragon }', 'Ruby', 'Dragon Fire: When you play this character, you may banish chosen opposing character.', 'Character'),
    ('Cards/008', 'Mickey Mouse', 8, true, '{ Dreamborn, Hero }', 'Ruby', 'Evasive', 'Character'),
    ('Cards/009', 'Robin Hood', 6, true, '{ Storyborn, Hero }', 'Sapphire', 'Feed the poor: When you play this character, if an opponent has more cards in their hand than you, draw a card. / Good shot: During your turn, this character has Evasive.', 'Character'),
    ('Cards/010', 'Stitch', 6, true, '{ Floodborn, Hero, Alien }', 'Amber', 'Shift 4 / Adoring fans: Whenever you play a character with a cost of 2 or less, you may exert it to draw a card.', 'Character'),
    ('Cards/011', 'Dragon Fire', 5, false, '{ Action }', 'Ruby', 'Banish chosen character', 'Action'),
    ('Cards/012', 'Fire The Cannons!', 1, false, '{ Action }', 'Steel', 'Deal 2 damage to chosen character', 'Action'),
    ('Cards/013', 'One Jump Ahead', 2, false, '{ Action, Song }', 'Sapphire', 'Put the top card of your deck into your ell facedown and exerted.', 'Action'),
    ('Cards/014', 'Frying Pan', 2, true, '{ Item }', 'Steel', 'Clang!: [Banish this item] - Chosen character can''t challenge during their next turn.', 'Item'),
    ('Cards/015', 'Stitch', 1, true, '{ Storyborn, Hero, Alien }', 'Amber', '', 'Character'),
    ('Cards/016', 'Aurora', 2, true, '{ Storyborn, Hero, Princess }', 'Sapphire', '', 'Character'),
    ('Cards/017', 'Aurora', 5, true, '{ Floodborn, Hero, Princess }', 'Sapphire', 'Protective Embrace: Your other characters gain Ward.', 'Character'),
    ('Cards/018', 'Magic Mirror', 2, false, '{ Item }', 'Amethyst', 'Speak!: [{Exert}, 4 {ink}] - Draw a card.', 'Item'),
    ('Cards/019', 'White Rabbit''s Pocket Watch', 3, true, '{ Item }', 'Amethyst', 'I''m Late!: [{Exert}, 1 {ink}] - Chosen character gains Rush.', 'Item'),
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
    ('Cards/040', 'Mickey Mouse', 6, true, '{ Dreamborn, Hero, Musketeer }', 'Steel', 'Bodyguard / All for One: Your other musketeer characters get +1 {strength}.', 'Character'),
    ('Cards/041', 'Smash', 3, true, '{ Action }', 'Steel', 'Deal 3 damage to the chosen character', 'Action'),
    ('Cards/042', 'Heihei', 1, true, '{ Storyborn, Ally }', 'Amber', 'Support', 'Character'),
    ('Cards/043', 'Beast''s Mirror', 2, true, '{ Item }', 'Steel', 'Show Me: [{Exert}, 3 {ink}] - If you have no cards in your hand, draw a card.', 'Item'),
    ('Cards/044', 'Pascal', 1, true, '{ Storyborn, Ally }', 'Amethyst', 'Camouflage: While you have another character in play, this character gains Evasive.', 'Character'),
    ('Cards/045', 'Cheshire Cat', 3, true, '{ Storyborn }', 'Emerald', 'Lose Something?: When this character is challenged and banished, banish the challenging character', 'Character'),
    ('Cards/046', 'The Beast Is Mine!', 3, true, '{ Action }', 'Emerald', 'Chosen character gains Reckless during their next turn.', 'Action'),
    ('Cards/047', 'Simba', 7, true, '{ Storyborn, Hero, King }', 'Steel', 'Challenger +4 / Pounce: During your turn, this character gains Evasive.', 'Character'),
    ('Cards/048', 'Jasmine', 3, true, '{ Storyborn, Princess }', 'Sapphire', '', 'Character'),
    ('Cards/049', 'Prince Eric', 2, true, '{ Storyborn, Prince, Hero }', 'Steel', 'Challenger +2', 'Character'),
    ('Cards/050', 'Goons', 1, true, '{ Storyborn, Ally }', 'Steel', '', 'Character'),
    ('Cards/051', 'Jafar', 4, true, '{ Dreamborn, Villain, Sorcerer }', 'Amethyst', 'Challenger +3', 'Character'),
    ('Cards/052', 'Dr. Facilier', 2, true, '{ Storyborn, Villain, Sorcerer }', 'Amethyst', 'Challenger +2', 'Character'),
    ('Cards/053', 'Maximus', 3, true, '{ Dreamborn, Ally }', 'Amber', 'Horsekick: When you play this character, chosen character gets -2 {strength} this turn.', 'Character'),
    ('Cards/054', 'Ariel', 4, true, '{ Storyborn, Hero, Princess }', 'Amber', 'Voiceless: This character can''t {exert} to sing songs.', 'Character'),
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
    ('Cards/068', 'Dinglehopper', 1, true, '{ Item }', 'Amber', 'Straighten Hair: [{exert}] - Remove up to 1 damage from chosen character.', 'Item'),
    ('Cards/069', 'Healing Glow', 1, true, '{ Action }', 'Amber', 'Remove up to 2 damage from chosen character.', 'Action'),
    ('Cards/070', 'Tinker Bell', 3, true, '{ Dreamborn, Ally, Fairy }', 'Steel', 'Battle Plans: [{exert}] - Draw a card, then choose and discard a card.', 'Character'),
    ('Cards/071', 'Gantu', 8, true, '{ Storyborn, Alien, Captain }', 'Steel', 'Under Arrest: Characters with cost 2 or less can''t challenge your character.', 'Character'),
    ('Cards/072', 'Hades', 8, false, '{ Floodborn, Villain, King, Deity }', 'Amber', 'Sinister Plot: This character gets +1 {lore} for each other Villain character you have in play.', 'Character'),
    ('Cards/073', 'Olaf', 1, true, '{ Storyborn, Ally }', 'Amethyst', '', 'Character'),
    ('Cards/074', 'Genie', 6, false, '{ Storyborn, Ally }', 'Emerald', 'Evasive / Disappear: When you play this character, you may return chosen character to the player''s hand.', 'Character'),
    ('Cards/075', 'Iago', 3, true, '{ Storyborn, Ally }', 'Emerald', 'You got a problem?: [{Exert}] - Chosen character gains Reckless during their next turn.', 'Character'),
    ('Cards/076', 'Timon', 1, true, '{ Storyborn, Ally }', 'Amber', 'Tastes Lke Chicken: When you play this character, you may remove up to 1 damage from chosen character.', 'Character'),
    ('Cards/077', 'Archimedes', 1, true, '{ Dreamborn, Ally }', 'Amethyst', '', 'Character'),
    ('Cards/078', 'Rafiki', 3, false, '{ Dreamborn, Mentor, Sorcerer }', 'Amethyst', 'Rush', 'Character'),
    ('Cards/079', 'Beast', 5, false, '{ Dreamborn, Hero, Prince }', 'Amethyst', 'Rush / Roar: When you play this character, exert all opposing damage characters.', 'Character'),
    ('Cards/080', 'Aladdin', 2, true, '{ Storyborn, Hero, Prince }', 'Emerald', 'Ward', 'Character'),
    ('Cards/081', 'Goofy', 5, true, '{ Dreamborn, Hero }', 'Ruby', 'Evasive', 'Character'),
    ('Cards/082', 'Lady Tremaine', 6, false, '{ Dreamborn, Villain }', 'Emerald', 'Do it again!: When you play this character, you may return an action card from your discard to your hand.', 'Character'),
    ('Cards/083', 'Tigger', 6, true, '{ Storyborn, Tigger }', 'Ruby', 'Evasive', 'Character');
EOSQL