#!/bin/sh

MIGRATE_OPTIONS=
echo "Starting migrations"
echo "MIGRATE_FORCE_INIT_VERSION=$MIGRATE_FORCE_INIT_VERSION"
if [ ! -z $MIGRATE_FORCE_INIT_VERSION ]; then
	echo "Doing base version initialization forcing"
  	current=`migrate $MIGRATE_OPTIONS version`
	echo "Current version applied to databse is $current"

	if [ $MIGRATE_FORCE_INIT_VERSION ]; then
		echo "Evalluated current version, and found that initialization not applied, or new force versions are provided"
		echo "Forcing version $MIGRATE_FORCE_INIT_VERSION"
		migrate $MIGRATE_OPTIONS force $MIGRATE_FORCE_INIT_VERSION
	fi
fi


echo "Running migrations"
migrate $MIGRATE_OPTIONS up






