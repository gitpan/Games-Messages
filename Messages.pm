package Games::Messages;

use 5.008;
use strict;
use warnings;

require Exporter;

our @ISA = qw(Exporter);

our %EXPORT_TAGS = ( 'all' => [ qw(
	player_wins player_loses
	computer_beats_computer computer_beats_player
	player_beats_computer player_beats_player
	player_is_idle player_exagerates
) ] );

our @EXPORT_OK = ( @{ $EXPORT_TAGS{'all'} } );

our @EXPORT = qw(
	player_wins player_loses
	computer_beats_computer computer_beats_player
	player_beats_computer player_beats_player
	player_is_idle player_exagerates
);

our $VERSION = '0.01';

my %messages;

BEGIN {
  %messages = (
    p_wins => [ ['PLAYER'],
      '<PLAYER> wins',
      '<PLAYER> really knows how to handle the game',
    ],
    p_lose => [ ['PLAYER'],
      '<PLAYER> loses.',
      '<PLAYER> is gone with the wind.',
      'no more <PLAYER>.',
    ],

    c_b_c =>  [ [],
      'Oh yeah... I just love playing against myself...',
      'Computers playing against each other... talk about wars...',
      'The winner: Computer!! The loser: Computer!! Hurray...',
    ],
    c_b_p =>  [ ['PLAYER'],
      'Sucka...',
      'I tell you... artificial intelligence rulez!',
      'Maybe you should leave the game to me and go do something else.',
      'Muahahahahahah!!',
    ],
    p_b_c =>  [ ['PLAYER'],
      '<PLAYER> rulez',
    ],
    p_b_p =>  [ ['WINNER', 'LOSER'],
      '<WINNER> beats the hell out of <LOSER>',
      '<WINNER> kicks <LOSER>\'s ass.',
      '<WINNER> wins again.',
      '<LOSER> loses again.',
      '<LOSER> really sucks...',
      '<WINNER> beats the hell out of <LOSER>',
      '<LOSER> should know better...',
      '<WINNER> rulez...',
      '<WINNER> takes control.',
      '<WINNER> wipes the floor with <LOSER>.',
    ],

    p_idle => [ ['PLAYER'],
      'Gone to the bathroom, uh?',
      'Don\'t you like anymore?',
    ],
    p_exag => [ ['PLAYER'],
      'Shouldn\'t you, like... go away?',
      'Why don\'t you go (read a book|fishing) instead?',
      'You know there are other stuff you can do, right?',
      'Don\'t you think it\'s about time you turn me off?',
      'You know, I\'m getting sick of your face...',
      'Enough is enough, you know?',
    ],
  );
}

sub random_message {
  my $type = shift || return undef;
  my $message = ${$messages{$type}}[ 1 + int(rand(@{$messages{$type}} - 1)) ];
  for (@{${$messages{$type}}[0]}) {
    my $temp = shift || return undef;
    $message =~ s/<$_>/$temp/g;
  }
  $message;
}

sub player_wins             { random_message('p_wins',@_); }
sub player_loses            { random_message('p_lose',@_); }

sub computer_beats_computer { random_message('c_b_c' ,@_); }
sub computer_beats_player   { random_message('c_b_p' ,@_); }
sub player_beats_computer   { random_message('p_b_c' ,@_); }
sub player_beats_player     { random_message('p_b_p' ,@_); }

sub player_is_idle          { random_message('p_idle',@_); }
sub player_exagerates       { random_message('p_exag',@_); }

1;
__END__

=head1 NAME

Games::Messages - Random messages for common situations in games

=head1 SYNOPSIS

  use Games::Messages;

  print player_wins($player);
  print player_loses($player);

  print computer_beats_computer();
  print computer_beats_player($player);
  print player_beats_computer($player);
  print player_beats_player($winner, $loser);

  print player_is_idle($player);
  print player_exagerates($player);

=head1 DESCRIPTION

Random messages for common situations in games.

=head1 MESSAGE FROM THE AUTHOR

If you're using this module, please drop me a line to my e-mail. Tell me what
you're doing with it. Also, feel free to suggest new bugs^H^H^H^H^H features
O:-)

=head1 AUTHOR

Jose Alves de Castro, E<lt>cog [at] cpan [dot] org<gt>

=head1 COPYRIGHT AND LICENSE

Copyright 2004 by Jose Alves de Castro

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself. 

=cut
