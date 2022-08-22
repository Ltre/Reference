if [ ! -d "/home/wwwsrc/Reference" ]; then
	cd /home/wwwsrc
	git clone https://github.com/Ltre/Reference.git
else
	cd /home/wwwsrc/Reference
	git pull
fi

cp /home/wwwsrc/Reference -r /home/wwwroot/Reference
mv /home/wwwroot/doc.larele.com /home/wwwroot/doc.larele.com.trash
mv /home/wwwroot/Reference /home/wwwroot/doc.larele.com
chmod -R 767 /home/wwwroot/doc.larele.com/core/data
chmod 777 /home/wwwroot/doc.larele.com/gitpull.sh
rm -f -r /home/wwwroot/doc.larele.com.trash
rm -f -r /home/wwwroot/doc.larele.com/.git
cd /home/wwwroot/doc.larele.com
