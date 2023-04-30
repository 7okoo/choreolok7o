import subprocess
cmd = "chmod +x ./start.sh && ./start.sh"
res = subprocess.call(cmd, shell=True)
print(res)
