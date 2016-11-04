-- Licensed to the Apache Software Foundation (ASF) under one or more
-- contributor license agreements.  See the NOTICE file distributed with
-- this work for additional information regarding copyright ownership.
-- The ASF licenses this file to You under the Apache License, Version 2.0
-- (the "License"); you may not use this file except in compliance with
-- the License.  You may obtain a copy of the License at
--
--     http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

DROP TABLE IF EXISTS x_plugin_service_version_info;
DROP SEQUENCE IF EXISTS x_plugin_service_version_info_seq;

CREATE SEQUENCE x_plugin_service_version_info_seq;

CREATE TABLE x_plugin_service_version_info (
id BIGINT DEFAULT nextval('x_plugin_service_version_info_seq'::regclass),
create_time TIMESTAMP NOT NULL,
service_name varchar(256) NOT NULL,
host_name varchar(64) NOT NULL,
app_type varchar(128) NOT NULL,
entity_type smallint NOT NULL DEFAULT '0',
ip_address varchar(64) NOT NULL,
downloaded_version bigint NOT NULL DEFAULT '0',
download_time TIMESTAMP NOT NULL,
active_version bigint NOT NULL DEFAULT '0',
activation_time TIMESTAMP DEFAULT NULL,
primary key (id)
);
CREATE UNIQUE INDEX x_plugin_service_version_info_IDX_unique ON x_plugin_service_version_info(service_name, host_name, app_type, entity_type);
CREATE INDEX x_plugin_service_version_info_IDX_service_name ON x_plugin_service_version_info(service_name);
CREATE INDEX x_plugin_service_version_info_IDX_host_name ON x_plugin_service_version_info(host_name);
