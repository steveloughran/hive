#!/usr/bin/env bash

# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

if [ -z "$GPG_PASSPHRASE" ]; then
    echo "Need to set GPG_PASSPHRASE"
    exit 1
fi

PUBLISH_PROFILES="-Phadoop-2 -DskipTests -Psources -Pjavadoc"

echo "Replacing groupID with org.spark-project.hive"
# find . -name pom.xml | \
#  xargs -I {} sed -i -e "s/org.apache.hive/org.spark-project.hive/g" {}

echo "Publishing Spark to OSS Sonatype"
mvn clean deploy -Dgpg.passphrase=$GPG_PASSPHRASE $PUBLISH_PROFILES
