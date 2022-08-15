#!/bin/sh

set -euf

BUCKET=bsd-launchbox-learner-dev
PREFIX=resources/js

# Move the old files out of the way
aws s3 mv "s3://$BUCKET/$PREFIX/brython_stdlib.3.8.0.js" "s3://$BUCKET/$PREFIX/brython_stdlib.3.8.0-nopatch.js"
aws s3 mv "s3://$BUCKET/$PREFIX/brython_stdlib.js" "s3://$BUCKET/$PREFIX/brython_stdlib-nopatch.js"
aws s3 mv "s3://$BUCKET/$PREFIX/brython.3.8.0.js" "s3://$BUCKET/$PREFIX/brython.3.8.0-nopatch.js"
aws s3 mv "s3://$BUCKET/$PREFIX/brython.js" "s3://$BUCKET/$PREFIX/brython-nopatch.js"

# Upload new files
aws s3 cp www/src/brython_stdlib.js "s3://$BUCKET/$PREFIX/brython_stdlib.js"
aws s3 cp www/src/brython_stdlib.js "s3://$BUCKET/$PREFIX/brython_stdlib.3.8.0.js"
aws s3 cp www/src/brython.js "s3://$BUCKET/$PREFIX/brython.js"
aws s3 cp www/src/brython.js "s3://$BUCKET/$PREFIX/brython.3.8.0.js"