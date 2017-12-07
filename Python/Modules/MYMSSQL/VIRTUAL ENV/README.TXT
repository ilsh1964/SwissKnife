# Be sure to install python26, python26-virtualenv, and freetds-devel
#
# If you do not remove the freetds directory from the pymssql package prior to installing it
# then you will get an ImportError exception when trying to import it in Python
# e.g. . . . 
#
# >>> import pymssql
# Traceback (most recent call last):
#  File "<stdin>", line 1, in <module>
#  File "_mssql.pxd", line 10, in init pymssql (pymssql.c:9308)
# ImportError: /home/username/mssqltest/lib/python2.6/site-packages/_mssql.so: undefined symbol: __vasprintf_chk

virtualenv-2.6 --no-site-packages example_env
cd example_env
source bin/activate
pip install Cython pyrex
pip install --no-install pymssql

# Delete library only.
rm -rf /tmp/pip-build/pymssql/freetds/lib
 
pip install pymssql

cp /usr/lib64/libsybdb.so /to/python/site-packages/

# libsybdb.so or libsybdb.so.5.x.x