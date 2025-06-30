    1  mkdir number_guessing_game
    2  cd number_guessing_game/touch number_guess.sh
    3  cd number_guessing_game/
    4  touch number_guess.sh
    5  git init
    6  touch README.md
    7  name README.md 
    8  nano README.md 
    9  git status
   10  git add .
   11  git commit -m "Initial commit"
   12  chmod +x number_guess.sh 
   13  ./number_guess.sh 
   14  ./number_guess.sh 
   15  ./number_guess.sh 
   16  ./number_guess.sh 
   17  ./number_guess.sh 
   18  git status
   19  git add .
   20  git commit -m "feat: generate a ramdon number between 1 and 1000"
   21  git branch
   22  git status
   23  git diff
   24  git stash
   25  git checkout -b feat/create_user
   26  git branch
   27  git stash pop
   28  git stash list
   29  ./number_guess.sh 
   30  git status
   31  git add .
   32  git commit -m "feat: new user added into the db"
   33  git checkout master
   34  git merge feat/create_user 
   35  git branch -d feat/create_user 
   36  git checkout -b feat/guessing_number_logic
   37  git checkout master
   38  git branch
   39  git status
   40  git checkout feat/guessing_number_logic 
   41  git status
   42  git checkout master
   43  git checkout -b feat/take_user_guess
   44  ./number_guess.sh 
   45  ./number_guess.sh 
   46  ./number_guess.sh 
   47  ./number_guess.sh 
   48  ./number_guess.sh 
   49  ./number_guess.sh 
   50  ./number_guess.sh 
   51  ./number_guess.sh 
   52  ./number_guess.sh 
   53  ./number_guess.sh 
   54  ./number_guess.sh 
   55  git status
   56  git branch
   57  git add .
   58  git commit -m "feat: get the user guess number"
   59  git checkout main
   60  git checkout master
   61  git merge feat/take_user_guess 
   62  git branch -d feat/take_user_guess 
   63  git branch
   64  git checkout feat/guessing_number_logic 
   65  git rebase main
   66  git rebase master
   67  git branch
   68  ./number_guess.sh 
   69  ./number_guess.sh 
   70  git log --oneline
   71  ./number_guess.sh 
   72  git status
   73  git add .
   74  git commit -m "feat: add the logic for the function guess_number_logic"
   75  git checkout master
   76  git merge feat/guessing_number_logic 
   77  git branch
   78  git checkout feat/guessing_number_logic 
   79  ./number_guess.sh 
   80  ./number_guess.sh 
   81  ./number_guess.sh 
   82  ./number_guess.sh 
   83  ./number_guess.sh 
   84  ./number_guess.sh 
   85  ./number_guess.sh 
   86  ./number_guess.sh 
   87  ./number_guess.sh 
   88  ./number_guess.sh 
   89  ./number_guess.sh 
   90  ./number_guess.sh 
   91  ./number_guess.sh 
   92  ./number_guess.sh 
   93  ./number_guess.sh 
   94  ./number_guess.sh 
   95  ./number_guess.sh 
   96  ./number_guess.sh 
   97  ./number_guess.sh 
   98  ./number_guess.sh 
   99  ./number_guess.sh 
  100  ./number_guess.sh 
  101  ./number_guess.sh 
  102  ./number_guess.sh 
  103  ./number_guess.sh 
  104  ./number_guess.sh 
  105  ./number_guess.sh 
  106  ./number_guess.sh 
  107  ./number_guess.sh 
  108  ./number_guess.sh 
  109  ./number_guess.sh 
  110  ./number_guess.sh 
  111  ./number_guess.sh 
  112  ./number_guess.sh 
  113  ./number_guess.sh 
  114  ./number_guess.sh 
  115  ./number_guess.sh 
  116  ./number_guess.sh 
  117  ./number_guess.sh 
  118  ./number_guess.sh 
  119  ./number_guess.sh 
  120  git status
  121  git add .
  122  git branch
  123  git commit -m "feat: finish the implementation of the guessing logic"
  124  git checkout master
  125  git merge feat/guessing_number_logic 
  126  git checkout -b main
  127  git rebase master
  128  git status
  129  git restore
  130  git restore number_guess.sh 
  131  git restore number_guess.sh 
  132  ./number_guess.sh 
  133  ./number_guess.sh 
  134  ./number_guess.sh 
  135  git remote add origin https://github.com/dperial/number_guessing_game
  136  git pull
  137  git pull origin main --rebase
  138  git rebase --continue
  139  git rebase --continue
  140  git add .
  141  git commit -m "merge conflict in README.md file"
  142  git rebase --continue
  143  git push
  144      git push --set-upstream origin main
  145  history > number_guess_commands.sh
  146  git add .
  147  git commit -m "feat: create a command history for the project"
  148  git push
  149  pg_dump -cC --inserts -U freecodecamp number_guess > number_guess.sql
  150  pg_dump --username=freecodecamp postgres > postgres_dump.sql
  151  psql --username=freecodecamp number_guess < postgres_dump.sql
  152  history > number_guess_commands_2.sh
  153  pg_dump --username=freecodecamp number_guess > number_guess.sql
  154  history > number_guess_commands_2.sh
  155  history > number_guess_commands.sh
