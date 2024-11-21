#!/bin/bash
# Set up the user inu with necessary permissions

# login as sysdba and create user inu
sqlplus / as sysdba <<EOF
   ALTER SESSION SET CONTAINER = FREEPDB1;
   CREATE USER inuqa IDENTIFIED BY inuqa;
   GRANT CREATE SESSION TO inuqa;
   -- GRANT CONNECT, RESOURCE TO inuqa;
   GRANT DBA TO inuqa;
   exit;
EOF

sleep 10

# update premissions on FREEPDB1
sqlplus inuqa/inuqa@localhost:1521/FREEPDB1 <<EOF
    CONN inuqa/inuqa@FREEPDB1
    EXEC ords.enable_schema;
    CONN sys/inu888@FREEPDB1 as sysdba
    GRANT EXECUTE ON DBMS_SODA_ADMIN TO inuqa;
    exit;
EOF
