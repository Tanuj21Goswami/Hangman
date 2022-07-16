# Hangman
The game of hangman is excellent because it teaches you that using the wrong words could result in someone's death.

Hello everyone This time, I worked on the renowned game Hangman. As directed by the course instructor, it is written in Perl.
Below are additional instructions and crucial information. Be sure to read everything thoroughly before using it.

## How to Run:

    ->     Open folder in Terminal
 
    ->     Type perl Hangman.pl
 
 ## Instructions to be followed while playing the Hangman game:
    1 .Enter the perl Hangman.pl command in the terminal .

    2.The program will display the welcome message and instructions and the guessed word will display the size of the word you have to guess by displaying “_” as many 
      times as the size of the word.

    3. The user then has to enter a single alpha-numeric character. 

    4. Now if your guessed letter is present in the word then the guessed words will display that letter at its given position.

    5. If you guess it wrong then, it will show a message and display the number of chances left to you.

    6. If your guessed character is already guessed whether correctly or incorrectly it asks you to enter another character as this character is already guessed.

    7. Keep entering your guess until you win or lose the game.

    8. Once the game is over it will ask you whether you want to play it again or not.

    9. Press 1 if you want to play again else press any other number to exit from the game.
## Points to be noted:
1. The program will convert your input into lowercase characters if you have entered an Uppercase character as all the letters in the word to be guessed are lowercase and numbers from 0 to 9.

2. Also if you enter more than one character in single input i.e, if you input a string like (a12d) then the program will take only “a” as input.

3. If a letter is present at multiple positions in the word, then it will update it at all the positions.
