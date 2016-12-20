if [ ! -d "/home/wwwsrc/Reference" ]; then
	cd /home/wwwsrc
	git clone https://github.com/Ltre/Reference.git
else
	cd /home/wwwsrc/Reference
	git pull
fi

cp /home/wwwsrc/Reference -r /home/wwwroot/Reference
mv /home/wwwroot/doc.yooo.moe /home/wwwroot/doc.yooo.moe.trash
mv /home/wwwroot/Reference /home/wwwroot/doc.yooo.moe
chmod -R 767 /home/wwwroot/doc.yooo.moe/core/data
chmod 777 /home/wwwroot/doc.yooo.moe/gitpull.sh
rm -f -r /home/wwwroot/doc.yooo.moe.trash
