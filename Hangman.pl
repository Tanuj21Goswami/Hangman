#NAME: TANUJ KUMAR
#ENTRY NO: 2020CSB1134
my @words = ("computer","radio","calculator","teacher","bureau","police","geometry","president","subject","country","enviroment","classroom","animals","province","month","politics","puzzle","instrument","kitchen","language","vampire","ghost","solution","service","software","virus","security","phonenumber","expert","website","agreement","support","compatibility","advanced","search","triathlon","immediately","encyclopedia","endurance","distance","nature","history","organization","international","championship","government","popularity","thousand","feature","wetsuit","fitness","legendary","variation","equal","approximately","segment","priority","physics","branche","science","mathematics","lightning","dispersion","accelerator","detector","terminology","design","operation","foundation","application","prediction","reference","measurement","concept","perspective","overview","position","airplane","symmetry","dimension","toxic","algebra","illustration","classic","verification","citation","unusual","resource","analysis","license","comedy","screenplay","production","release","emphasis","director","trademark","vehicle","aircraft","experiment");
my @corr_guessed = ();
my $has_solved = 0;
my $lives = 0;
my @incorr_guessed=();

my $choice = 0;
my $word;
my $size;
while($choice!=1)
{
    print"****************************************************************************************************************************\n";
    print"                                         WELCOME TO THE HANGMAN GAME....                                                    \n";
    print"****************************************************************************************************************************\n";
    print"****CAUTION*****: This game is not for faint-hearted people,but u cannot step back from here......\n";
    print"****************************************************************************************************************************\n";
    print"Here are the instructions :\n";
    print"1.Your friend has been captured by a group and thrown into a room.\n";
    print"2.To open the room you have to guess a word correctly,you will be asked to enter a character each time ,you will be given 8 lives.\n";
    print"3.But if you guessed the word wrong, he will be hanged to death.\n";
    print" Your friend's life is in your hands.....\n";
    print"Let's start the game .....\n";
    print"*****************************************************************************************************************************\n\n";
    @corr_guessed = ();
    @incorr_guessed=();
    $has_solved = 0;
    $lives = 0;

            Display($lives);
            $word = @words [int(rand(100))];
            $size = length($word);
            #print"The word is: " . $word . "\n";
            for (my $i=0; $i < $size; $i++) {
                    $corr_guessed [$i] = '_';
            }
            while ($has_solved!=1) {
                    

                    print join(" ", @corr_guessed);
                    print "\n\nEnter a letter: ";
                    my $guess = <>;
                    chomp($guess); # To Remove newline
                    $guess=lc substr($guess,0,1); # To remove the case sensitivity

                    &Char_check($word, $guess);#Checking that char is present in desired word or not
                    Display($lives);#Displaying the present state of hangman machine
                    print "\nNumeber of wrong attempts $lives \n"; 
                    print"\nWrong Attempts:";
                    print"@incorr_guessed ";
                    print"\n\n";
                    if($lives>=8){
                        print"Sorry to say,But you lost your friend\n";
                        print"The actual word is: " . $word . "\n";
                        last;
                    } 
                    $has_solved = &Win_or_not($word);#It will check the user has won the game or not 
                    
                
            }
        if($lives<8)
        {
            print join(" ", @corr_guessed);
            print "\n\nYay you win!!\nCongrats You have rescued your friend safely\n";
        }
    
    print "If you want to play again press 1 else enter any other number\n";

    my $choice1 = <STDIN>;
    chomp $choice1;
    if($choice1==1){
        $choice = 0;
    }
    else{
    $choice = 1;
    }
}

#Checking that char is present in desired word or not
sub Char_check {
    my ($word, $guess) = @_;
    my $letterIndex = index($word, $guess);
    my $flag=0;
    if ($letterIndex == -1) {
        for (my $i=0; $i < $#incorr_guessed+1; $i++)
        {
            if ($guess eq $incorr_guessed[$i]) {
                # print "You already guessed $guess!\n";
                $flag=1;#bool flag will check if wrong attempt is repeated or not 
            }
        }
        if($flag==1) #bool flag will check if wrong attempt is repeated or not 
        {
            print "You already guessed $guess!\n";
        }
        else #bool flag will check if wrong attempt is repeated or not 
        {
            push(@incorr_guessed,$guess);
            print "Wrong!\n";
            $lives++;
        }
    } else {
        for (my $i=0; $i < length($word); $i++) {
            my $c_letter = substr($word, $i, 1);
            if ($guess eq $corr_guessed[$i]) {
                print "You already guessed $guess!\n";
            }
            if ($guess eq $c_letter) {
                $corr_guessed [$i] = $c_letter;
            }
        }
    }
    
}

#It will check the user has won the game or not 
sub Win_or_not {
    my ($word) = @_;
    my $letter;
    for (my $i=0; $i< length($word); $i++) {
        $letter = substr($word, $i, 1);
        if ($letter ne $corr_guessed [$i]) {
            return 0;
        }
    }
    return 1;
}

#Displaying the present state of hangman machine
sub Display
{
    my($lives)=@_;
    if($lives==0)
    {
        print "  -------\n";
        print "  |     |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
    }
    elsif($lives==1)
    {
        print "  -------\n";
        print "  |     |\n";
        print "  |     |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
    }
    elsif($lives==2)
    {
        print "  -------\n";
        print "  |     |\n";
        print "  |     |\n";
        print "  |     O\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
    }
    elsif($lives==3)
    {
        print "  -------\n";
        print "  |     |\n";
        print "  |     |\n";
        print "  |     O\n";
        print "  |     |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
    }
    elsif($lives==4)
    {
        print "  -------\n";
        print "  |     |\n";
        print "  |     |\n";
        print "  |     O\n";
        print "  |    \\|\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
    }
    elsif($lives==5)
    {
        print "  -------\n";
        print "  |     |\n";
        print "  |     |\n";
        print "  |     O\n";
        print "  |    \\|/\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
    }
    elsif($lives==6)
    {
        print "  -------\n";
        print "  |     |\n";
        print "  |     |\n";
        print "  |     O\n";
        print "  |    \\|/\n";
        print "  |     |\n";
        print "  |\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
    }
    elsif($lives==7)
    {
        print "  -------\n";
        print "  |     |\n";
        print "  |     |\n";
        print "  |     O\n";
        print "  |    \\|/\n";
        print "  |     |\n";
        print "  |     /\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
    }
    elsif($lives==8)
    {
         print "  -------\n";
        print "  |     |\n";
        print "  |     |\n";
        print "  |     X\n";
        print "  |    \\|/\n";
        print "  |     |\n";
        print "  |     /\\\n";
        print "  |\n";
        print "  |\n";
        print "--|----\n";
    }
}