use Test::More tests => 28;
BEGIN { use_ok('Games::Messages',':all') };

ok(! player_wins            (                    ) );
ok(  player_wins            ('Player1'           ) );
ok(  player_wins            ('Player1', 'Player2') );

ok(! player_loses           (                    ) );
ok(  player_loses           ('Player1'           ) );
ok(  player_loses           ('Player1', 'Player2') );

ok(  computer_beats_computer(                    ) );
ok(  computer_beats_computer('Player1'           ) );
ok(  computer_beats_computer('Player1', 'Player2') );


ok(! player_beats_player    (                    ) );
ok(! player_beats_player    ('Player1'           ) );
ok(  player_beats_player    ('Player1', 'Player2') );

ok(! computer_beats_player  (                    ) );
ok(  computer_beats_player  ('Player1'           ) );
ok(  computer_beats_player  ('Player1', 'Player2') );

ok(! player_beats_computer  (                    ) );
ok(  player_beats_computer  ('Player1'           ) );
ok(  player_beats_computer  ('Player1', 'Player2') );

ok(! player_beats_player    (                    ) );
ok(! player_beats_player    ('Player1'           ) );
ok(  player_beats_player    ('Player1', 'Player2') );

ok(! player_is_idle         (                    ) );
ok(  player_is_idle         ('Player1'           ) );
ok(  player_is_idle         ('Player1', 'Player2') );

ok(! player_exagerates      (                    ) );
ok(  player_exagerates      ('Player1'           ) );
ok(  player_exagerates      ('Player1', 'Player2') );
