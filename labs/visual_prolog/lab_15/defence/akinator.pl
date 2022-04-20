:- [languages].

:- use_module(library(random), [random_permutation/2]).

% entry point
game :-
    writeln('Do you want to play?'),
    read(Response),
    ( user_input(play, Response) ->
        languages(Langs),
        ask_questions(Langs, Candidats, Has),
        check_candidates(Candidats, Has),
        game
    ; user_input(stop, Response) -> true  %user_input(stop, q).
    ; game ).

questions([
    question(exist, exist, 'Does this language exists?'),
    question(created(in60s), created(_), 'Was it created in 1960s?'),
    question(created(in70s), created(_), 'Was it created in 1970s?'),
    question(created(in80s), created(_), 'Was it created in 1980s?'),
    question(wellpaid, wellpaid, 'Is it a wellpaid language?'),
    question(structural, structural, 'Is it a structural language?'),
    question(procedural, procedural, 'Is it a procedural language?'),
    question(oop, oop, 'Is it a oop language?')
]).

%languages :- listing(language).
languages(Langs) :- findall(language(N, Ds), language(N, Ds), Langs).

ask_questions(Candidats, Candidats1, Has1) :-
    questions(Ps),
    random_permutation(Ps, Ps1),
    ask_questions(Ps1, Candidats, [], Candidats1, Has1).

ask_questions([], Candidats, Has, Candidats, Has).
ask_questions([Question|Questions], Candidats, Has, Candidats1, Has1) :-
    ask_one_question(Question, Candidats, Has, Cs, Ts),
    ask_questions(Questions, Cs, Ts, Candidats1, Has1).

ask_one_question(Question, Candidats, Has, Candidats1, Has1) :-
    question(Data, AlreadyHas, Msg) = Question,
    ( memberchk(AlreadyHas, Has) ->
        Candidats1 = Candidats, Has1 = Has
    ;
        writeln(Msg),
        read(Response),
        ( user_input(yes, Response) -> filter_has(Data, Candidats, Candidats1), Has1 = [Data|Has]
        ; user_input(no, Response) -> filter_has_not(Data, Candidats, Candidats1), Has1 = Has
        ; ask_one_question(Question, Candidats, Has, Candidats1, Has1)
        )
    ).

% Get suitable langs
filter_has(_, [], []).
filter_has(Data, [C|Cs], Candidats1) :-
    C = language(_, D),
    ( memberchk(Data, D) -> Candidats1 = [C|Cs1]
    ; Candidats1 = Cs1
    ),
    filter_has(Data, Cs, Cs1).

filter_has_not(_, [], []).
filter_has_not(Data, [C|Cs], Candidats1) :-
    C = language(_, D),
    ( memberchk(Data, D) -> Candidats1 = Cs1
    ; Candidats1 = [C|Cs1]
    ),
    filter_has_not(Data, Cs, Cs1).

check_candidates([], Has) :- new_lang(Has).
check_candidates(Candidats, Has) :-
    Candidats = [language(Name, _)|Cs],
    format('Is it a ~s?~n', [Name]),
    read(Response),
    ( user_input(yes, Response) -> writeln('Gotcha!')
    ; user_input(no, Response) -> check_candidates(Cs, Has)
    ; check_candidates(Candidats, Has)
    ).

new_lang(Has) :-
    writeln('Can\'t recognize any of languages. Want to add a new one?'),
    read(Response),
    ( user_input(yes, Response) ->
        writeln('What is new lang name?'),
        read(Name),
        ( atom(Name), \+ language(Name, _) ->
            assertz(language(Name, Has)),
            tell('languages.pl'),
            listing(language/2),
            told
        ; new_lang(Has)
        )
    ; user_input(no, Response) -> true
    ; new_lang(Has)
    ).

% user input
user_input(play, y).
user_input(play, yes).
user_input(stop, n).
user_input(stop, no).
user_input(stop, s).
user_input(stop, stop).
user_input(stop, e).
user_input(stop, exit).
user_input(stop, q).
user_input(stop, quit).
user_input(yes, s).
user_input(yes, yes).
user_input(yes, y).
user_input(yes, yes).
user_input(no, n).
user_input(no, no).
