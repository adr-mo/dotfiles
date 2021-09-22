---
id: centreon-core
title: Centreon Core
---

## Introduction

You can find in this chapter all changelogs concerning **Centreon Core**.

> It is very important when you update your system to refer to this
> section in order to learn about behavior changes or major changes that
> have been made on this version. This will let you know the impact of
> the installation of these versions on the features you use or the
> specific developments that you have built on your platform (modules,
> widgets, plugins).

If you have feature requests or want to report a bug, please go to our
[Github](https://github.com/centreon/centreon/issues/new/choose)

## Centreon Web

### 21.04.2

Release date: `2021-06-07`

#### Features

- [FRONT|FT-DES] [FE][Graph] Increase font size of Timestamp
- [FT-CORE] [WEB][PFS] unable to replace 127.0.0.1 by real IP in poller form when already saved in platform_topology
- [FT-CORE] [Core] Bulk insert in index_data during config generation
- [FT-CORE] [Core] Purge of index_data is taking too long because of suboptimal SQL query
- [FT-DES] [Back] Block command from output if ACL doesn't allow

#### Bug fixes

- [FT-CORE] Can not authenticate using API when database name and database username are different from default
- [FT-CORE] Cannot update to 21.04.02 when you have no metaservices
- [FT-CORE] [Anomaly] host_id is null is stream connector flow
- [FT-CONF] [VALIDATION@FEEDBACK] New Logger conf is not correctly exported to distant pollers
- [FT-CORE] [Core][ACL][BAM] ACL are computed every time for BV
- [FT-CORE] [Purge] Script can't drop several partitions
- [BACK|FT-DES] [APIv1] Cannot send external commands anymore
- [FT-CONF] [API] unable to use v2 api (internal server error)
- [FT-DES] [Reporting] Dashboard can't display reporting for service (query too long)
- [FT-DES] [Back][Graphs] : "Filter by Host" filter is not emptied between searches
- [FT-CONF] [Core/Configuration] Change default values in "Engine Configuration"
- [FT-CORE] [WEB] Avoid 404 redirection
- [FT-CORE] [Core/Statistics] Broker statistics for pollers are not shown

#### Security fixes

- [FT-CORE] [SECU][WEB] Packaging, remove . gitignore files
- [SYNACKTIV] Insecure file upload
- [SYNACKTIV] XSS reflected on internal API broker configuration
- [SYNACKTIV] XSS reflected on SNMP trap
- [SYNACKTIV] XSS reflected on performance Curves
- [SYNACKTIV] SQL Injection on component templates
- [SYNACKTIV] SQL Injection on nagios
- [BACK|FT-DES] [SYNACKTIV] SQL Injection on graph split
- [BACK|FT-DES] [SYNACKTIV] SQL Injection on graph periods
- [SYNACKTIV] SQL Injection on ACL resources
- [SYNACKTIV] SQL Injection on reload ACL
- [SYNACKTIV] SQL Injection on ACL actions
- [SYNACKTIV] SQL Injection on trap manufacturer
- [SYNACKTIV] SQL Injection on reporting export
- [SYNACKTIV] SQL Injection on generate image
- [SYNACKTIV] SQL Injection on mediaWiki
- [Administration / Images] Import of JS in image files
- [Wizard Remote] Input sent to unserialize() are not sanitized
- [Wizard Broker] Input sent to unserialize() are not sanitized
- [FT-CORE] X-Forwarded-For spoofing (study)

#### Others

- [FT-DES] [APIv2] DELETE downtime on host not functionnal
- [Core/Configuration/Broker] InfluxDB configuration columns are deleted
- [FT-DES] [Resource Status] Action ACL not working
- [FT-CORE] [LDAP] Adding new user from LDAP results in Request Entity Too Large error

### 21.04.2

Release date: `2021-06-07`

#### Features

- [FRONT|FT-DES] [FE][Graph] Increase font size of Timestamp
- [FT-CORE] [WEB][PFS] unable to replace 127.0.0.1 by real IP in poller form when already saved in platform_topology
- [FT-CORE] [Core] Bulk insert in index_data during config generation
- [FT-CORE] [Core] Purge of index_data is taking too long because of suboptimal SQL query
- [FT-DES] [Back] Block command from output if ACL doesn't allow

#### Bug fixes

- [FT-CORE] Can not authenticate using API when database name and database username are different from default
- [FT-CORE] Cannot update to 21.04.02 when you have no metaservices
- [FT-CORE] [Anomaly] host_id is null is stream connector flow
- [FT-CONF] [VALIDATION@FEEDBACK] New Logger conf is not correctly exported to distant pollers
- [FT-CORE] [Core][ACL][BAM] ACL are computed every time for BV
- [FT-CORE] [Purge] Script can't drop several partitions
- [BACK|FT-DES] [APIv1] Cannot send external commands anymore
- [FT-CONF] [API] unable to use v2 api (internal server error)
- [FT-DES] [Reporting] Dashboard can't display reporting for service (query too long)
- [FT-DES] [Back][Graphs] : "Filter by Host" filter is not emptied between searches
- [FT-CONF] [Core/Configuration] Change default values in "Engine Configuration"
- [FT-CORE] [WEB] Avoid 404 redirection
- [FT-CORE] [Core/Statistics] Broker statistics for pollers are not shown

#### Security fixes

- [FT-CORE] [SECU][WEB] Packaging, remove . gitignore files
- [SYNACKTIV] Insecure file upload
- [SYNACKTIV] XSS reflected on internal API broker configuration
- [SYNACKTIV] XSS reflected on SNMP trap
- [SYNACKTIV] XSS reflected on performance Curves
- [SYNACKTIV] SQL Injection on component templates
- [SYNACKTIV] SQL Injection on nagios
- [BACK|FT-DES] [SYNACKTIV] SQL Injection on graph split
- [BACK|FT-DES] [SYNACKTIV] SQL Injection on graph periods
- [SYNACKTIV] SQL Injection on ACL resources
- [SYNACKTIV] SQL Injection on reload ACL
- [SYNACKTIV] SQL Injection on ACL actions
- [SYNACKTIV] SQL Injection on trap manufacturer
- [SYNACKTIV] SQL Injection on reporting export
- [SYNACKTIV] SQL Injection on generate image
- [SYNACKTIV] SQL Injection on mediaWiki
- [Administration / Images] Import of JS in image files
- [Wizard Remote] Input sent to unserialize() are not sanitized
- [Wizard Broker] Input sent to unserialize() are not sanitized
- [FT-CORE] X-Forwarded-For spoofing (study)

#### Others

- [FT-DES] [APIv2] DELETE downtime on host not functionnal
- [Core/Configuration/Broker] InfluxDB configuration columns are deleted
- [FT-DES] [Resource Status] Action ACL not working
- [FT-CORE] [LDAP] Adding new user from LDAP results in Request Entity Too Large error

### 21.04.2

Release date: `2021-06-07`

#### Features

- [FRONT|FT-DES] [FE][Graph] Increase font size of Timestamp
- [FT-CORE] [WEB][PFS] unable to replace 127.0.0.1 by real IP in poller form when already saved in platform_topology
- [FT-CORE] [Core] Bulk insert in index_data during config generation
- [FT-CORE] [Core] Purge of index_data is taking too long because of suboptimal SQL query
- [FT-DES] [Back] Block command from output if ACL doesn't allow

#### Bug fixes

- [FT-CORE] Can not authenticate using API when database name and database username are different from default
- [FT-CORE] Cannot update to 21.04.02 when you have no metaservices
- [FT-CORE] [Anomaly] host_id is null is stream connector flow
- [FT-CONF] [VALIDATION@FEEDBACK] New Logger conf is not correctly exported to distant pollers
- [FT-CORE] [Core][ACL][BAM] ACL are computed every time for BV
- [FT-CORE] [Purge] Script can't drop several partitions
- [BACK|FT-DES] [APIv1] Cannot send external commands anymore
- [FT-CONF] [API] unable to use v2 api (internal server error)
- [FT-DES] [Reporting] Dashboard can't display reporting for service (query too long)
- [FT-DES] [Back][Graphs] : "Filter by Host" filter is not emptied between searches
- [FT-CONF] [Core/Configuration] Change default values in "Engine Configuration"
- [FT-CORE] [WEB] Avoid 404 redirection
- [FT-CORE] [Core/Statistics] Broker statistics for pollers are not shown

#### Security fixes

- [FT-CORE] [SECU][WEB] Packaging, remove . gitignore files
- [SYNACKTIV] Insecure file upload
- [SYNACKTIV] XSS reflected on internal API broker configuration
- [SYNACKTIV] XSS reflected on SNMP trap
- [SYNACKTIV] XSS reflected on performance Curves
- [SYNACKTIV] SQL Injection on component templates
- [SYNACKTIV] SQL Injection on nagios
- [BACK|FT-DES] [SYNACKTIV] SQL Injection on graph split
- [BACK|FT-DES] [SYNACKTIV] SQL Injection on graph periods
- [SYNACKTIV] SQL Injection on ACL resources
- [SYNACKTIV] SQL Injection on reload ACL
- [SYNACKTIV] SQL Injection on ACL actions
- [SYNACKTIV] SQL Injection on trap manufacturer
- [SYNACKTIV] SQL Injection on reporting export
- [SYNACKTIV] SQL Injection on generate image
- [SYNACKTIV] SQL Injection on mediaWiki
- [Administration / Images] Import of JS in image files
- [Wizard Remote] Input sent to unserialize() are not sanitized
- [Wizard Broker] Input sent to unserialize() are not sanitized
- [FT-CORE] X-Forwarded-For spoofing (study)

#### Others

- [FT-DES] [APIv2] DELETE downtime on host not functionnal
- [Core/Configuration/Broker] InfluxDB configuration columns are deleted
- [FT-DES] [Resource Status] Action ACL not working
- [FT-CORE] [LDAP] Adding new user from LDAP results in Request Entity Too Large error

### 21.04.0

#### Enhancements

- [Configuration] Define new logging options for Centreon Broker
- [Resources Status] Optimized overall listing to display ~50% more alerts
- [Resources Status] Added new columns (active/passive, notifications on/off and others) and possibility to select and re-order displayed columns
- [Resources Status] Added many filtering options (including Monitoring Server)
- [Resources Status] Added Meta-Services to types of resources included
- [Resources Status] All page parameters are now saved within local storage and URL
- [Resources Status] The detail panel is now resizable
- [Resources Status] Revamped the Graph panel overall, mainly:
    - Added Datetime pickers for start and end of period
    - Added zoom feature via in-graph selection
    - Added time translation to move forward and backward (by half the displayed period)
    - Added option to display events (downtimes, acknowledgements, etc.) within graph
    - Removed metrics values within tootips
    - Added metrics values display in legend on graph hover
    - Added metrics mean, max and average display in legend otherwise




#### Documentation

- Added a chapter to enable firewalld and rules example to improve security
- Added a chapter to enable Fail2ban to improve security
- Added a chapter to move a collector from one server to another

#### Security

- Add SELinux packages

#### Performances

- Move to PHP 7.3
- Move to MariaDB 10.5

## Centreon Engine

### 21.04.0

- When used with centreon-connectors, Engine could crash when we stop it. This should be fixed now.
- Ability to submit external commands via gRPC.

> **Warning:** External commands via gRPC are proposed in beta version. The API may change in a near
future.

## Centreon Broker

### 21.04.0

> **Known issues**
> * Broker streams: the same parameter, if used in several outputs of the same broker stream, can only have one value (the last prevails).
> * BAM: the impacts of KPIs of type Meta-service are not evaluated correctly. A fix will be release very soon.
> * BAM: the impacts of KPIs of type BA in are not evaluated correctly. A fix will be release very soon.

#### New broker logs

- New logs, with new format, epoch timestamps are replaced by real dates.

> **Warning:** you may still see timestamps in your logs until you disable the
old logs system.

```log
[2021-04-16 13:49:06.781] [core] [info] Clearing old connections
[2021-04-16 13:56:10.985] [core] [info] main: configuration update requested
```

- New log config options, with a different log level for `core`, `config`, `sql`, `processing`, `perfdata`, `bbdo`, `tcp`, `tls`, `lua`, `bam`.
- Old logs are still supported, but you are encouraged to abandon them.

#### Other enhancements

- Support of UInt64 for `id` column of `index_data` table: fixes issues on platforms having a large amount of metrics.

> **Warning:** this change needs cbd service(s) to be stopped during the upgrade to 21.04.0 and all "queue" and "unprocessed" files must be removed.

- Improvement of the acknowledgement of events when broker is shutting down.

## Centreon Gorgone

### 21.04.0

- [Core] Better congestion management for communication
