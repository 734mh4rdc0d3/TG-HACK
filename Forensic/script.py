f = open("passwd.txt","r")
i = 5
ans = f.readlines()
for i in ans:
	if(i!='*'):
		try:
			print(i,end="")
		except UnicodeDecodeError:
			continue
print("done")
f.close()
