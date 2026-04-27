echo "Installing demo software ..."
mkdir src
touch run.sh
echo "echo Hello" > run.sh
mv run.sh src
sh src/run.sh