-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2020 at 04:58 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.2.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `blogshell`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `SRNO` int(100) NOT NULL,
  `NAME` text NOT NULL,
  `EMAIL` varchar(50) NOT NULL,
  `PHONE` varchar(50) NOT NULL,
  `MESSAGE` text NOT NULL,
  `DATE` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`SRNO`, `NAME`, `EMAIL`, `PHONE`, `MESSAGE`, `DATE`) VALUES
(1, 'jjj', 'jjj', '777', 'jjj', '2020-05-10 15:33:47'),
(2, 'rishiss', 'rishi', '111555', 'rishi\r\n', '2020-05-11 13:24:06'),
(3, 'rishiss', 'rishi', '111', 'rrrr', '2020-05-11 13:25:02');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `Sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `subheading` text NOT NULL,
  `slug` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(20) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`Sno`, `title`, `subheading`, `slug`, `content`, `img_file`, `date`) VALUES
(1, 'COOKIES IN SPACE!!', 'HOW NASA WILL BAKE IN SPACE FOR THE FIRST TIME AND WHY THAT’S A BIG DEAL!', 'first-post', 'On November 2nd, 2019, Northrop Grumman performed a spaceflight first, and launched an oven aboard their Cygnus Cargo Ship on a resupply mission to the International Space Station for NASA.\r\n\r\nThe spacecraft contained just over 3,700 kg of scientific experiments, vehicle hardware, and crew supplies, along with a variety of other important space stuff.But included on this flight was a space first. An oven. And not just any oven, but a custom zero g oven developed by Nanoracks, a leading provider of commercial access to space, that will be used to bake the first food in space – the DoubleTree chocolate chip cookie. \r\n\r\nSpace food has been around since the dawn of human spaceflight which began with the first human in space, Yuri Gagarin. Throughout most of the early ’60s, the Mercury, Vostok, Voskhod, and early Soyuz programs stuck with ‘baby food,’ which was unanimously considered to be awful. The initial U.S. crewed missions didn’t bother with in-flight snacks due to their short, suborbital flights lasting approximately 15 minutes. However, space food became more of a necessity once orbital flights began.\r\n\r\nTo summarize, food is essential – after all, we can’t live without it – Food in space is perhaps even more necessary than food down here on Earth. As we prepare to send humans further and further away from our natural sources of food, it will become increasingly important to have ways to serve food that is both nutritious and delicious.', 'spacecookie.jpg', '2020-05-06 19:36:34'),
(2, 'FAILURE IS NOT AN OPTION!!', 'Many say exploration is part of our destiny, but it’s actually our duty to future generations.', 'second-post', 'I’ve been thinking a lot about failure recently. I seem to know a few people going through tough and uncertain times on various fronts who consider themselves failures. As I understand it, the only way to fail is to try something that doesn’t work out. If you’re trying new things and taking risks, how can you be a failure? Even if you take a leap and fall flat on your face, you’re further forward than someone that never moved.\r\nFor writers, a career can be littered with failures. If you’re going to be strict about it, it’s not just the rejections that pile up, smirking at you from your in box; it’s also all the ideas you couldn’t bring to fruition, the poetic form you couldn’t master, the story you never finished. However, if you let go of the idea that these are failures, you can learn a lot from these situations (I refuse to call them mistakes.) Maybe your writing improved, or you learned to manage your ideas better. I’ve written a number of failed villanelles; I’m fascinated by the form and each time I get a little closer to understanding how it moves and breathes. I don’t know if I’ll ever get there, but I enjoy the process of learning and improving all the same. They may not be perfect but so what? If I do ever write in that form successfully, it will only be because I travelled a path paved with my failures, so I must love every step of the way.\r\n\r\nA writer’s life includes a lot of rejection and in some ways, it’s hard to take a direct lesson from that. When you pour your heart and soul into the work and get a polite - and only sometimes encouraging - “no thank you” back, it’s hard to learn anything. However, what these rejections can teach you is resilience. If something gets rejected, then take a look at it. If you still believe in the work just the way it is, send it out again. And again. And again. I have an advantage here in that I was born with a stubborn streak a mile wide and I think that’s as valuable to my writing life as my lifetime spent reading. I’ve made a virtue of rejection; it’s the only metric I track within my writing and it’s not to beat myself up, it’s for that moment when the underdog finally triumphs. I recently had a poem accepted for publication that had been rejected nine times. Nine times it took a leap and fell on its face but that tenth time, it took flight. It feels sweeter than those rare times I managed to find the right home for a piece on the first try.\r\n\r\nUltimately, in writing and in life, what matters is not whether you fell down, messed up or got rejected. What matters is what you do next. And sure, it’s frustrating when all you seem to get is knock after knock but as the saying goes, if you’re going through hell – keep going. ', 'failure.jpg', '2020-05-11 14:08:54'),
(3, 'SCIENCE HAS NOT YET MASTERED PROPHECY!!', 'Many say exploration is part of our destiny, but it’s actually our duty to future generations.', 'third-post', 'Never in all their history have men been able truly to conceive of the world as one: a single sphere, a globe, having the qualities of a globe, a round earth in which all the directions eventually meet, in which there is no center because every point, or none, is center — an equal earth which all men occupy as equals. The airman\'s earth, if free men make it, will be truly round: a globe in practice, not in theory.\r\n\r\nScience cuts two ways, of course; its products can be used for both good and evil. But there\'s no turning back from science. The early warnings about technological dangers also come from science.\r\n\r\nWhat was most significant about the lunar voyage was not that man set foot on the Moon but that they set eye on the earth.\r\n\r\nA Chinese tale tells of some men sent to harm a young girl who, upon seeing her beauty, become her protectors rather than her violators. That\'s how I felt seeing the Earth for the first time. I could not help but love and cherish her.\r\n\r\nFor those who have seen the Earth from space, and for the hundreds and perhaps thousands more who will, the experience most certainly changes your perspective. The things that we share in our world are far more valuable than those which divide us.', 'scientific.jpg', '2020-05-11 14:26:38'),
(4, 'THE MOST IN-DEMAND PRODUCTIVITY TOOL YOU NEED!!', 'Most of the other productivity tools you don’t need, especially when finances are tough and subscriptions hurt your wallet.', 'fourth-post', 'Using death to sell productivity — now that’s a new low for marketers.\r\nI got an email today from a startup founder asking me if I was interested in his productivity tool. The email started with: “What if something was to happen to you?” It was an app to supposedly help me manage my productivity should the unexpected happen.\r\nIt was going to automate my blogging after my death.\r\nThat’s right — you could still hear from me after my exit from Planet Earth. Not weird at all.\r\nIt got me thinking: do we need all these productivity tools? My view is no we don’t. The most in-demand productivity tool that we do need is going to sound stupidly simple: a digital calendar. Yes, it’s simple but hear me out.\r\nJust like milkshakes, there are many different flavors of calendar. (Yes I’m a milkshake guy and like a pink strawberry variety. The shirtless dudes with buff bods on the beach doing pushups are going to hate me for this “anything but masculine” milkshake flavor selection — what the hell! [you do you])\r\nThe varieties of calendar are Gmail, Outlook, and Apple’s iCal.\r\nHaving a calendar that you actually use keeps you productive. It helps you know what you need to prioritize and it reminds you at your leisure. It’s an already utilized productivity tool that we have access to and overlook when it comes to being productive. Instead, software companies like the one who emailed me recently, play with our fears and desires and sell us the dream we need more apps to live life. We don’t.\r\nYou can automate your online presence all you like; it won’t make up for never being around for people who might need you or want to chat. You can’t fool humans with auto-responders and productivity tools pretending to be you. Only you can do you.\r\nI know software companies want us to buy their apps and shackle us down with subscription plans, but do we really need more productivity?\r\nI find that when my productivity falls off a cliff and the basics become non-existent, it’s not an app that can save me. I’ve got to save myself.\r\nIt’s a situation or my psychology about uncertain times that has ruined my productivity — not a missing productivity app from the suite of overcrowded apps on my not so smartphone.', 'productivity.jpeg', '2020-05-11 14:42:18'),
(5, 'WHY PEOPLE LOVE MUSIC??', 'Music is powerful. As people listen to it, they can be affected. They respond.', 'fifth-post', 'Everyone experiences certain moments where you want to express yourself in a different way and sometimes music is the best companion during those moments. Sometimes you just want to lie down, listen to your favorite music and just forget the world. We all just want to relax and take our minds away from our problems even for just a little while. Music is anyone\'s way. Anyone\'s way to express, to relax, to enjoy, to communicate and many more.\r\nIt is hard to define music but it is easy to give meaning to it. There are some who tried to define music. This is an example of a simple explanation: According to Webster\'s II: New Riverside University Dictionary , music is \"the art of arranging tones in an orderly sequence so as to produce a unified and continuous composition\". The first definition of music is literal because it talks about tones and composition which is truly about music. The best definition for me is this: “An art of sound in time that expresses ideas and emotions in significant forms through the elements of rhythm, melody, harmony, and color.” I don\'t know who said that but this definition has all the important words coming all together and constructing a simple yet concise definition of music.\r\n“Common rhythm notation began around the year 1200” As time passes by, other elements add to that common rhythm, maybe like more tones, more notes, words, and other more. Today, you cannot even count music and songs there were. These music and songs come in different variations, types, kinds and genres. Examples of types of music are national, religious, secular and others. Secular type of music has sub-types, which are called genres. Some examples of genres are Rock, Rock \'n\' Roll, Country, Jazz, Pop, Ballad, Country, RnB, Alternative, Rap, Hip-hop, and many more. Different people love different types and genres of music. Music, like people, has individuality. It can be anything it wants to be. Music has already become a big part of society. It is widely used in almost anything today. Music already has so many uses nowadays. Of course media and culture is on top of its uses. In example, music is always in the company of media like in advertising, movies, music industry and many more. For personal reasons there is relaxing, social activities, dancing, background noise and any other you may think that will be for your personal pleasure. These personal reasons are the main reason why people love music.\r\nMusic is typical especially for teens nowadays. Teens see music or songs as an outlet for their emotions, ideas, feelings, problems and many more. I too, as a teen relies on music as a source of relaxation and a past-time activity especially when traveling, spending hours on the road or just when I feel like I need music to change my mood or think about things and stuff. Music is not only for teens but for adults and adults alike. They just love to reminisce while listening to songs in their time. Everybody relates when it comes to music. We just love listening to music when stressed and we need to relax, when we need to think, when we need to clear our minds even for just a bit, when we need to let go of that emotion or feeling and we use music as an outlet. When words aren\'t enough to say what we need to say, sometimes a song is the perfect thing to say. Songs bring back memories and we just love to reminisce as we make new memories with new songs and music. Sometimes we feel like making music of our own, thus there are musical instruments to help us convert those feelings into music and be an outlet of emotions, ideas, feelings and inhibitions. Music has already evolved so much. It is hard to imagine how music started during the old times and how it became what it is now. Music can be a great help to anyone if we just let it. Music has already evolved so much. It is hard to imagine how music started during the old times and how it became what it is now. Music can be a great help to anyone if we just let it. Music has already evolved so much. It is hard to imagine how music started during the old times and how it became what it is now. Music can be a great help to anyone if we just let it.  ', 'music.jpg', '2020-05-11 14:53:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`SRNO`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`Sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `SRNO` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `Sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
