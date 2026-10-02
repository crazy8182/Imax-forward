echo "Cloning Repo...."
if [ -z $BRANCH ]
then
  echo "Cloning main branch...."
  git clone https://github.com/Jisshubot/Jisshu-forward-bot Jisshubot/Jisshu-forward-bot 
else
  echo "Cloning $BRANCH branch...."
  git clone https://github.com/Jisshubot/Jisshu-forward-bot -b $BRANCH /Jisshu-forward-bot
fi
cd Jisshubot/Jisshu-forward-bot 
pip3 install -U -r requirements.txt
echo "Starting Bot...."
gunicorn --bind 0.0.0.0:${PORT:-8080} app:app & python3 main.py
