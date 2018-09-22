-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 22, 2018 at 12:23 AM
-- Server version: 5.7.21
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dexdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `dex`
--

DROP TABLE IF EXISTS `dex`;
CREATE TABLE IF NOT EXISTS `dex` (
  `Id` int(11) NOT NULL,
  `Name` varchar(15) NOT NULL,
  `PrimaryType` varchar(15) NOT NULL,
  `SecondaryType` varchar(15) NOT NULL,
  `Entry` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dex`
--

INSERT INTO `dex` (`Id`, `Name`, `PrimaryType`, `SecondaryType`, `Entry`) VALUES
(1, 'Bulbasaur', 'Grass', 'Poison', 'Bulbasaur can be seen napping in bright sunlight. There is a seed on its back. By soaking up the sun\'s rays, the seed grows progressively larger.'),
(5, 'Charmeleon', 'Fire', '', 'Charmeleon mercilessly destroys its foes using its sharp claws. If it encounters a strong foe, it turns aggressive. In this excited state, the flame at the tip of its tail flares with a bluish white color.'),
(2, 'Ivysaur', 'Grass', 'Poison', 'There is a bud on this Pokémon\'s back. To support its weight, Ivysaur\'s legs and trunk grow thick and strong. If it starts spending more time lying in the sunlight, it\'s a sign that the bud will bloom into a large flower soon.'),
(3, 'Venusaur', 'Grass', 'Poison', 'There is a large flower on Venusaur\'s back. The flower is said to take on vivid colors if it gets plenty of nutrition and sunlight. The flower\'s aroma soothes the emotions of people.'),
(4, 'Charmander', 'Fire', '', 'The flame that burns at the tip of its tail is an indication of its emotions. The flame wavers when Charmander is enjoying itself. If the Pokémon becomes enraged, the flame burns fiercely.'),
(6, 'Charizard', 'Fire', 'Flying', 'Charizard flies around the sky in search of powerful opponents. It breathes fire of such great heat that it melts anything. However, it never turns its fiery breath on any opponent weaker than itself.'),
(7, 'Squirtle', 'Water', '', 'Squirtle\'s shell is not merely used for protection. The shell\'s rounded shape and the grooves on its surface help minimize resistance in water, enabling this Pokémon to swim at high speeds.'),
(8, 'Wartortle', 'Water', '', 'Its tail is large and covered with a rich, thick fur. The tail becomes increasingly deeper in color as Wartortle ages. The scratches on its shell are evidence of this Pokémon\'s toughness as a battler.'),
(9, 'Blastoise', 'Water', '', 'Blastoise has water spouts that protrude from its shell. The water spouts are very accurate. They can shoot bullets of water with enough accuracy to strike empty cans from a distance of over 160 feet.'),
(10, 'Caterpie', 'Bug', '', 'Caterpie has a voracious appetite. It can devour leaves bigger than its body right before your eyes. From its antenna, this Pokémon releases a terrifically strong odor.'),
(11, 'Metapod', 'Bug', '', 'The shell covering this Pokémon\'s body is as hard as an iron slab. Metapod does not move very much. It stays still because it is preparing its soft innards for evolution inside the hard shell.'),
(12, 'Butterfree', 'Bug', 'Flying', 'Butterfree has a superior ability to search for delicious honey from flowers. It can even search out, extract, and carry honey from flowers that are blooming over six miles from its nest.'),
(13, 'Weedle', 'Bug', 'Poison', 'Weedle has an extremely acute sense of smell. It is capable of distinguishing its favorite kinds of leaves from those it dislikes just by sniffing with its big red proboscis (nose).'),
(14, 'Kakuna', 'Bug', 'Poison', 'Kakuna remains virtually immobile as it clings to a tree. However, on the inside, it is extremely busy as it prepares for its coming evolution. This is evident from how hot the shell becomes to the touch.'),
(15, 'Beedrill', 'Bug', 'Poison', 'Beedrill is extremely territorial. No one should ever approach its nest—this is for their own safety. If angered, they will attack in a furious swarm.'),
(16, 'Pidgey', 'Normal', 'Flying', 'Pidgey has an extremely sharp sense of direction. It is capable of unerringly returning home to its nest, however far it may be removed from its familiar surroundings.'),
(17, 'Pidgeotto', 'Normal', 'Flying', 'Pidgeotto claims a large area as its own territory. This Pokémon flies around, patrolling its living space. If its territory is violated, it shows no mercy in thoroughly punishing the foe with its sharp claws.'),
(18, 'Pidgeot', 'Normal', 'Flying', 'This Pokémon has a dazzling plumage of beautifully glossy feathers. Many Trainers are captivated by the striking beauty of the feathers on its head, compelling them to choose Pidgeot as their Pokémon.'),
(19, 'Rattata', 'Normal', '', 'Rattata is cautious in the extreme. Even while it is asleep, it constantly listens by moving its ears around. It is not picky about where it lives—it will make its nest anywhere.'),
(20, 'Raticate', 'Normal', '', 'Raticate\'s sturdy fangs grow steadily. To keep them ground down, it gnaws on rocks and logs. It may even chew on the walls of houses.'),
(21, 'Spearow', 'Normal', 'Flying', 'Spearow has a very loud cry that can be heard over half a mile away. If its high, keening cry is heard echoing all around, it is a sign that they are warning each other of danger.'),
(22, 'Fearow', 'Normal', 'Flying', 'Fearow is recognized by its long neck and elongated beak. They are conveniently shaped for catching prey in soil or water. It deftly moves its long and skinny beak to pluck prey.'),
(23, 'Ekans', 'Poison', '', 'Ekans curls itself up in a spiral while it rests. Assuming this position allows it to quickly respond to a threat from any direction with a glare from its upraised head.'),
(29, 'Nidoran Female', 'Poison', '', 'Nidoran (Female) has barbs that secrete a powerful poison. They are thought to have developed as protection for this small-bodied Pokémon. When enraged, it releases a horrible toxin from its horn.'),
(25, 'Pikachu', 'Eletric', '', 'Whenever Pikachu comes across something new, it blasts it with a jolt of electricity. If you come across a blackened berry, it\'s evidence that this Pokémon mistook the intensity of its charge.'),
(26, 'Raichu', 'Eletric', '', 'If the electrical sacs become excessively charged, Raichu plants its tail in the ground and discharges. Scorched patches of ground will be found near this Pokémon\'s nest.'),
(27, 'Sandshrew', 'Ground', '', 'Sandshrew\'s body is configured to absorb water without waste, enabling it to survive in an arid desert. This Pokémon curls up to protect itself from its enemies.'),
(28, 'Sandslash', 'Ground', '', 'Sandslash\'s body is covered by tough spikes, which are hardened sections of its hide. Once a year, the old spikes fall out, to be replaced with new spikes that grow out from beneath the old ones.'),
(24, 'Arbok', 'Poison', '', 'This Pokémon is terrifically strong in order to constrict things with its body. It can even flatten steel oil drums. Once Arbok wraps its body around its foe, escaping its crunching embrace is impossible.'),
(30, 'Nidorina', 'Poison', '', 'When Nidorina are with their friends or family, they keep their barbs tucked away to prevent hurting each other. This Pokémon appears to become nervous if separated from the others.'),
(31, 'Nidoqueen', 'Poison', 'Ground', 'Nidoqueen\'s body is encased in extremely hard scales. It is adept at sending foes flying with harsh tackles. This Pokémon is at its strongest when it is defending its young.'),
(32, 'Nidoran Male', 'Poison', '', 'Nidoran (Male) has developed muscles for moving its ears. Thanks to them, the ears can be freely moved in any direction. Even the slightest sound does not escape this Pokémon\'s notice.'),
(33, 'Nidorino', 'Poison', '', 'Nidorino has a horn that is harder than a diamond. If it senses a hostile presence, all the barbs on its back bristle up at once, and it challenges the foe with all its might.'),
(34, 'Nidoking', 'Poison', 'Ground', 'Nidoking\'s thick tail packs enormously destructive power. With one swing, it can topple a metal transmission tower. Once this Pokémon goes on a rampage, there is no stopping it.'),
(35, 'Clefairy', 'Fairy', '', 'On every night of a full moon, groups of this Pokémon come out to play. When dawn arrives, the tired Clefairy return to their quiet mountain retreats and go to sleep nestled up against each other.'),
(36, 'Clefable', 'Fairy', '', 'Clefable moves by skipping lightly as if it were flying using its wings. Its bouncy step lets it even walk on water. It is known to take strolls on lakes on quiet, moonlit nights.'),
(37, 'Vulpix', 'Fire', '', 'At the time of its birth, Vulpix has one white tail. The tail separates into six if this Pokémon receives plenty of love from its Trainer. The six tails become magnificently curled.'),
(38, 'Ninetales', 'Fire', '', 'Ninetales casts a sinister light from its bright red eyes to gain total control over its foe\'s mind. This Pokémon is said to live for a thousand years.'),
(39, 'Jigglypuff', 'Normal', 'Fairy', 'Jigglypuff\'s vocal cords can freely adjust the wavelength of its voice. This Pokémon uses this ability to sing at precisely the right wavelength to make its foes most drowsy.'),
(40, 'Wigglytuff', 'Normal', 'Fairy', 'Wigglytuff has large, saucerlike eyes. The surfaces of its eyes are always covered with a thin layer of tears. If any dust gets in this Pokémon\'s eyes, it is quickly washed away.'),
(41, 'Zubat', 'Poison', 'Flying', 'Zubat remains quietly unmoving in a dark spot during the bright daylight hours. It does so because prolonged exposure to the sun causes its body to become slightly burned.'),
(42, 'Golbat', 'Poison', 'Flying', 'Golbat loves to drink the blood of living things. It is particularly active in the pitch black of night. This Pokémon flits around in the night skies, seeking fresh blood.'),
(43, 'Oddish', 'Grass', 'Poison', 'During the daytime, Oddish buries itself in soil to absorb nutrients from the ground using its entire body. The more fertile the soil, the glossier its leaves become.'),
(44, 'Gloom', 'Grass', 'Poison', 'Gloom releases a foul fragrance from the pistil of its flower. When faced with danger, the stench worsens. If this Pokémon is feeling calm and secure, it does not release its usual stinky aroma.'),
(45, 'Vileplume', 'Grass', 'Poison', 'Vileplume\'s toxic pollen triggers atrocious allergy attacks. That\'s why it is advisable never to approach any attractive flowers in a jungle, however pretty they may be.'),
(46, 'Paras', 'Bug', 'Grass', 'Paras has parasitic mushrooms growing on its back called tochukaso. They grow large by drawing nutrients from this Bug Pokémon host. They are highly valued as a medicine for extending life.'),
(47, 'Parasect', 'Bug', 'Grass', 'Parasect is known to infest large trees en masse and drain nutrients from the lower trunk and roots. When an infested tree dies, they move onto another tree all at once.'),
(48, 'Venonat', 'Bug', 'Poison', 'Venonat is said to have evolved with a coat of thin, stiff hair that covers its entire body for protection. It possesses large eyes that never fail to spot even minuscule prey.'),
(49, 'Venomoth', 'Bug', 'Poison', 'Venomoth is nocturnal—it is a Pokémon that only becomes active at night. Its favorite prey are small insects that gather around streetlights, attracted by the light in the darkness.'),
(50, 'Diglett', 'Ground', '', 'Diglett are raised in most farms. The reason is simple— wherever this Pokémon burrows, the soil is left perfectly tilled for planting crops. This soil is made ideal for growing delicious vegetables.');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
