python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt

while ! curl -s http://localhost:8080; do
  sleep 1
done


mkdir ./test/output/
robot --variable park_id:PRE -d test/output test/_.robot
