require 'mastermind/play_game'
require 'colorize'

module Mastermind
  class Interact
    def print_title
      %q(
___       ___                                                                               ___ 
`MMb     dMM'                                                            68b                `MM 
 MMM.   ,PMM                      /                                      Y89                 MM 
 M`Mb   d'MM    ___      ____    /M       ____   ___  __ ___  __    __   ___ ___  __     ____MM 
 M YM. ,P MM  6MMMMb    6MMMMb\ /MMMMM   6MMMMb  `MM 6MM `MM 6MMb  6MMb  `MM `MM 6MMb   6MMMMMM 
 M `Mb d' MM 8M'  `Mb  MM'    `  MM     6M'  `Mb  MM69 "  MM69 `MM69 `Mb  MM  MMM9 `Mb 6M'  `MM 
 M  YM.P  MM     ,oMM  YM.       MM     MM    MM  MM'     MM'   MM'   MM  MM  MM'   MM MM    MM 
 M  `Mb'  MM ,6MM9'MM   YMMMMb   MM     MMMMMMMM  MM      MM    MM    MM  MM  MM    MM MM    MM 
 M   YP   MM MM'   MM       `Mb  MM     MM        MM      MM    MM    MM  MM  MM    MM MM    MM 
 M   `'   MM MM.  ,MM  L    ,MM  YM.  , YM    d9  MM      MM    MM    MM  MM  MM    MM YM.  ,MM 
_M_      _MM_`YMMM9'Yb.MYMMMM9    YMMM9  YMMMM9  _MM_    _MM_  _MM_  _MM__MM__MM_  _MM_ YMMMMMM_
      ).colorize(:green)
    end

    def line_break
      "
&%&%&%&%&%&%&%&%&%&%&%&%&%&&%%&%%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%&%
      ".colorize(:green)
    end

    def blank_line
      "\n"
    end

    def print_intro
      line_break +
      blank_line +
      "
                          #====================================#
                          #        MASTERMIND MAIN MENU        #
                          #------------------------------------#
                          #                                    #
                          #          (i)nstructions            #
                          #          (p)lay the game           #
                          #          (q)uit                    #
                          #                                    #
                          #====================================#
      " +
      blank_line
    end


    def print_game_options
      line_break +
      blank_line +
      "
                          #====================================#
                          #        MASTERMIND GAME OPTS        #
                          #------------------------------------#
                          #                                    #
                          #          (s)ingle player           #
                          #          (m)ulti player            #
                          #          (q)uit                    #
                          #                                    #
                          #====================================#
      " +
      blank_line
    end

    def command_prompt
      "Enter command: "
    end

    def screen_clear
      "\e[H\e[2J"
    end

    def multi_player_div
      "Player 1                                                                   Player 2\n"+
      "==================================================================================="
    end

    def guess_prompt(player)
      if player.turn_pos == 0
      "\n"+
      "#{player.name} - Enter your guess: "
      else
      "\n"+
      "                                            #{player.name} - Enter your guess:"
      end
    end

    def print_invalid(input)
      "
'#{input}' is not a valid command, please enter a valid command.
      "
    end

    def print_out_of_guesses(secret)
      "

                  *****************************************************
                          Nope, sorry, you are out of guesses.
                                      Nice try.
                                The secret code was:
                                         #{color_guess(secret)}
                  *****************************************************
      "
    end

    def print_farewell
      "
Thanks for playing
      "
    end

    def print_instructions
      "
These are the instructions.
      "
    end

    def print_game_info
      ""
    end

    def print_player_intro
      "Player(s) need to enter their name."
    end

    def name_prompt(player_no)
      "Player #{player_no} Name: "
    end

    def print_player_secret_intro(player_name)
      "
#{player_name} - Pick the secret code for your opponent"
    end

    def secret_guess_prompt
      "Enter secret code: "
    end

    def print_get_secret
      "Time to create some secrets. Each player will create the secret
That their opponent will be guessing."
    end

    def print_round_intro(colors)
      "
A random code consisting of 4 colors has been generated for you.

The valid color options are:
#{colors}

Enter your guess in the form of '#{color_guess("RGBY")}':
------------------------------
      "
    end

    def print_round_over
      "
                          **************************************
                          *             Round over             *
                          **************************************
      "
    end

    def print_are_you_sure
      "
Are you sure you want to quit? (y)es/(n)o".colorize(:red)
    end

    def print_invalid_guess(invalid_command)
"'#{invalid_command}' is not a valid guess, please guess again."
    end

    def print_guess_stats(number_guesses, correct_pos, correct_color, guess, max_guesses, player)
      if player.turn_pos == 0
      "\n"+
      "Guess ##{number_guesses} (#{color_guess(guess)}): #{max_guesses - number_guesses} guesses remaining\n"+
      "Correct position: #{correct_pos}   Correct colors: #{correct_color}\n"+
      "\n"+
      "Nope... sorry #{player.name} let's try that again\n"+
      "------------------------------\n"
      else
      "\n"+
      "                                            Guess ##{number_guesses} (#{color_guess(guess)}): #{max_guesses - number_guesses} guesses remaining\n"+
      "                                            Correct position: #{correct_pos}   Correct colors: #{correct_color}\n"+
      "\n"+
      "                                            Nope... sorry #{player.name} let's try that again\n"+
      "                                            ------------------------------\n"
      end
    end

    def print_win(number_guesses, time)
      "
                  *******************************************************
                     Congraulations! YOU WIN! Code broken in #{number_guesses} guesses
                            You guessed the code in #{time} seconds!
                  *******************************************************".colorize(:green)
    end

    def color_guess(code)
      input = code.kind_of?(Array) ? code : code.chars
      colored = []
      input.map { |char| colored << char.colorize(color_code(char)) }
      colored.join("")
    end

    def color_code(letter)
      Mastermind::COLOR_CODES[letter]
    end
  end
end
